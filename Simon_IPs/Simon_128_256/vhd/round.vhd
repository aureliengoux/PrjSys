library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_unsigned.all;
	use IEEE.numeric_std.all;
library lib_simon;
	use lib_simon.const_def.all;

entity round is
  port(
	 	clk : in std_logic;
		nrst: in std_logic;
    start: in std_logic;
		count: in std_logic_vector(6 downto 0); 
    key_i : in std_logic_vector(KEY_SIZE-1 downto 0);	
		data_in: in std_logic_vector(DATA_SIZE-1 downto 0); 
   	data_out: out std_logic_vector (DATA_SIZE-1 downto 0)
	);
end round;

architecture rtl_round of round is 
	-- registers update signals
	signal cr_key,n_key: std_logic_vector(KEY_SIZE-1 downto 0); --key
	signal cr_data,n_data: std_logic_vector(DATA_SIZE-1 downto 0); --data

	-- intermediate signals for key calculation
	signal zji: std_logic_vector(WORD_SIZE-1 downto 0); -- key encryption with "c" and "z" sequence constants 
	signal msb_key: std_logic_vector(WORD_SIZE-1 downto 0); --current key 4th word (96-127)
	signal s3_key: std_logic_vector(WORD_SIZE-1 downto 0); -- 3 bits right rotation of msb_key 
	signal s3xorkey: std_logic_vector(WORD_SIZE-1 downto 0); -- s3_key xor 2nd current key word (32-63)
	signal s1_key: std_logic_vector(WORD_SIZE-1 downto 0); -- 1 bit right rotation of s3xorkey
	signal key_temp1: std_logic_vector(WORD_SIZE-1 downto 0); -- s3xorkey xor 1st current key word (0-31)
	signal key_temp2: std_logic_vector(WORD_SIZE-1 downto 0); -- s1_key xor key_temp2
	signal r_key: std_logic_vector(WORD_SIZE-1 downto 0); -- round key

	-- intermediate signals for data calculation
	signal s1_data: std_logic_vector(WORD_SIZE-1 downto 0); -- 1 bit left rotation of left half of data
	signal s8_data: std_logic_vector(WORD_SIZE-1 downto 0); -- 8 bit left rotation of left half of data
	signal s2_data: std_logic_vector(WORD_SIZE-1 downto 0); -- 2 bit left rotation of left half of data
	signal r_data: std_logic_vector(WORD_SIZE-1 downto 0); -- round data
  

begin 
	--process for registers update
	synchro: process(clk,nrst)
	begin
		if (nrst='0')then -- asynchronous low level reset
			cr_key<= key_i; -- master key loaded in key register (write)
		 	cr_data<= data_in; -- plaintext loaded in data register (write)	
		elsif (clk'event and clk='1') then --rising edge     
      if (start='1') then 
      	cr_key<=key_i; -- master key loaded in key register (write)
		 		cr_data<=data_in; -- plaintext loaded in data register (write)       
      else 
		 		cr_key<=n_key;	--new round key loaded in key register (write)
		 		cr_data<=n_data; --new round data loaded in data register (write)        
      
      end if;
		end if; 
	end process synchro;

	key_gen: process(key_i,count,cr_key,msb_key,s3_key,s3xorkey,s1_key,key_temp1,key_temp2,r_key)
	begin
		if (count < (NB_ROUND))then
			msb_key <= cr_key(KEY_SIZE-1 downto (WORD_SIZE*(WORDS_NB-1))); --gets the 32 most significant bits
			s3_key <= msb_key(2 downto 0)&msb_key(WORD_SIZE-1 downto 3); -- right rotation (3 bits)
			s3xorkey <= s3_key xor cr_key((WORD_SIZE*2)-1 downto WORD_SIZE); -- xor with 2nd word of current key (32-63) 
			s1_key <= (s3xorkey(0)& s3xorkey((WORD_SIZE-1) downto 1)); --right rotation (1 bits)
			key_temp1 <= s3xorkey xor cr_key(WORD_SIZE-1 downto 0); -- xor with 1st word of current key (0-31)
			key_temp2 <= key_temp1 xor s1_key;       
			zji<=ROUND_CONST(WORD_SIZE-1 downto 1)& Z(to_integer(unsigned(count))); --"c" xor "z" (see key schedule figure)
			r_key <= key_temp2 xor zji; -- r_key = 32 bits calculated in a single round 
			n_key <= r_key & cr_key((WORD_SIZE*WORDS_NB)-1 downto WORD_SIZE); -- n_key = right shift of current key with round key added to the left
	 	else 
			--assignation of all signals in all branches to avoid latches
			msb_key <= (others => '0');
		 	s3_key <= (others => '0');
			s3xorkey <= (others => '0');
			s1_key <= (others => '0');
			key_temp1 <= (others => '0');
			key_temp2 <= (others => '0');      
			zji<=(others => '0');
			r_key <= (others => '0');
			n_key <= (others => '0');
		end if; 
	end process key_gen;

	data_path : process(cr_data,count,cr_key,r_data,s2_data,s8_data, s1_data,start)
	begin
	
		data_out <= cr_data;

		if (count < NB_ROUND) then			
			s1_data<=cr_data(DATA_SIZE-2 downto WORD_SIZE)& cr_data(DATA_SIZE-1); 
			s8_data<=cr_data(DATA_SIZE-9 downto WORD_SIZE)& cr_data(DATA_SIZE-1 downto DATA_SIZE-8); 
			s2_data<=cr_data(DATA_SIZE-3 downto WORD_SIZE)& cr_data(DATA_SIZE-1 downto DATA_SIZE-2);
			r_data<= ( ( ( (s1_data and s8_data) xor cr_data(WORD_SIZE-1 downto 0) ) xor s2_data) xor cr_key(WORD_SIZE-1 downto 0) );--calculate round_data
			n_data<= r_data & cr_data(DATA_SIZE-1 downto WORD_SIZE); -- switch left half and right half data
  	else    
		--assignation of all signals in all branches to avoid latches      
			s1_data<=(others => '0');
			s8_data<=(others => '0');
			s2_data<=(others => '0');
			n_data<= cr_data;   
			r_data<= (others => '0'); 
		end if;	
	end process;
end rtl_round;

