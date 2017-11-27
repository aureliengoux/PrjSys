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
	count: in std_logic_vector(NB_ROUND downto 0);
        key_i : in std_logic_vector(KEY_SIZE-1 downto 0);	
	data_in: in std_logic_vector(DATA_SIZE-1 downto 0); 
        data_out: out std_logic_vector (DATA_SIZE-1 downto 0)	
      );
end round;

architecture rtl_round of round is 

signal cr_key,n_key: std_logic_vector(KEY_SIZE-1 downto 0);
signal msb_key,s3_key,s1_key,s3xorkey,new_r_key:std_logic_vector(WORD_SIZE-1 downto 0);

signal cr_data,n_data: std_logic_vector(DATA_SIZE-1 downto 0);
signal s1_data,s8_data,s2_data,r_data:std_logic_vector(WORD_SIZE-1 downto 0);






--signal cr_data,n_data: std_logic_vector(DATA_SIZE-1 downto 0);
 

begin 

synchro_key: process(clk,nrst)
begin
 if (clk'event and clk='1') then 
  if (nrst='0')then 
     cr_key<=key_i;
     cr_data<=data_in;
     data_out<= (others =>'0'); 
  else 
     cr_key<=n_key;
     cr_data<=n_data;
     if (count = NB_ROUND) then 
     data_out <= n_data; 
     end if;     
     
  end if;
 end if;
end process synchro_key;

key_gen: process(key_i,count,cr_key,msb_key,s3_key,s3xorkey,new_r_key)

begin

  if (count < (NB_ROUND-WORDS_NB))then
  	msb_key <= cr_key(KEY_SIZE-1 downto (WORD_SIZE*(WORDS_NB-1)));--get les 32 msbs
 	s3_key <= msb_key(2 downto 0)&msb_key(WORD_SIZE-1 downto 3); -- rotation vers la droite (3 bits)

  	--if (WORDS_NB = 4)then 
       		s3xorkey <= s3_key xor cr_key((WORD_SIZE*2)-1 downto WORD_SIZE); --xor avec la deuxième mot (du 63 a 32 de la clé mère) 
        	s1_key <= (s3xorkey(0)& s3xorkey((WORD_SIZE-1) downto 1));
       -- else
       --	s1_key<=s3_key(0)&s3_key((WORD_SIZE-1) downto 1));
       -- end if;  

  	--tmp2 <= (s3xorkey xor cr_key(WORD_SIZE-1 downto 0)) xor s1_key; 
  	new_r_key <= ( (s3xorkey xor cr_key(WORD_SIZE-1 downto 0)) xor s1_key)  xor (key_i(WORD_SIZE-1 downto 1)&( key_i(0) xor Z(to_integer(unsigned(count))) )); 
  	n_key <= new_r_key & cr_key((WORD_SIZE*WORDS_NB)-1 downto WORD_SIZE);
  
 elsif (count>=(NB_ROUND-WORDS_NB) and count <=(NB_ROUND))then
  	n_key <= SHT_ZEROS & cr_key((WORD_SIZE*WORDS_NB)-1 downto WORD_SIZE);
 end if; 

end process key_gen;




data_path : process(cr_data,count,cr_key,r_data)
begin
	if (count<= NB_ROUND ) then 

  s1_data<=cr_data(DATA_SIZE-2 downto WORD_SIZE)& cr_data(DATA_SIZE-1); -- shift 1 de data
  s8_data<=cr_data(DATA_SIZE-9 downto WORD_SIZE)& cr_data(DATA_SIZE-1 downto DATA_SIZE-8); 
  s2_data<=cr_data(DATA_SIZE-3 downto WORD_SIZE)& cr_data(DATA_SIZE-1 downto DATA_SIZE-2);
  r_data<= ( ( ( (s1_data and s8_data) xor cr_data(WORD_SIZE-1 downto 0) ) xor s2_data) xor cr_key(WORD_SIZE-1 downto 0) );
  n_data<= r_data & cr_data(DATA_SIZE-1 downto WORD_SIZE);


	end if;
end process;
end rtl_round;

