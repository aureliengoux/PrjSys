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
	rkey : out std_logic_vector(KEY_SIZE/WORDS_NB-1 downto 0);
	data_in: in std_logic_vector(DATA_SIZE-1 downto 0); 
        data_out: out std_logic_vector (DATA_SIZE-1 downto 0)

	--plaintxt/cipertxt pour le top
      );
end round;

architecture rtl_round of round is 

signal pr_key,n_key: std_logic_vector(KEY_SIZE-1 downto 0);
signal k_i3,s3_key, s1_key:


signal pr_data,n_data: std_logic_vector(DATA_SIZE-1 downto 0);
--signal ldata : std_logic_vector(DATA_SIZE-1 downto WORD_SIZE);
--signal rdata : std_logic_vector(WORD_SIZE-1 downto 0);
 

begin 

synchro_key: process(clk,nrst)
begin
 if (clk'event and clk='1') then 
  if (nrst='0')then 
     pr_key<=key_i;
     pr_data<=data_in;
     data_o<= (others =>'0');        
  else 
     pr_key<=n_key;
     pr_data<=n_data;     
     d<=n_data;
  end if;
 end if;
end process synchro_key;

key_gen: process(key_i,count)
variable tmp: std_logic_vector(WORD_SIZE-1 downto 0);
begin

  if (count < (NB_ROUND-WORDS_NB))then
  	msb_key <= pr_key(KEY_SIZE-1 downto (WORD_SIZE*(WORDS_NB-1)));--get les 32 msbs
 	s3_key <= msb_key(2 downto 0)&msb_key(WORD_SIZE-1 downto 3); -- rotation vers la droite (3 bits)

  	if (WORDS_NB = 4)then 
       		tmp1 <= s3_key xor pr_key((WORD_SIZE*2)-1 downto WORD_SIZE); --xor avec la deuxième mot (du 63 a 32 de la clé mère) 
        	s1_key <= (tmp1(0)&tmp1((WORD_SIZE-1) downto 1));
        else
         	s1_key<=s3_key(0)&s3_key((WORD_SIZE-1) downto 1));
        end if;  

  	tmp2 <= (tmp1 xor pr_key(WORD_SIZE-1 downto 0)) xor s1_key; 
  	tmp3 <= tmp2 xor (key_i(WORD_SIZE-1 downto 1)&( key_i(0) xor Z(to_integer(unsigned(count))) )); 
  	n_key <= tmp3 & pr_key((WORD_SIZE*(WORDS_NB-1)) downto WORD_SIZE);
  elsif (count>=(NB_ROUND-WORDS_NB) and count <=(NB_ROUND))then
  	n_key <= SHT_ZEROS & pr_key((WORD_SIZE*(WORDS_NB-1)) downto WORD_SIZE);
  end if; 

end process key_gen;




data_path : process(data_i,count,pr_key,)
begin
	if (count<= NB_ROUND ) then 
  
tmp_data<=
(( (data_i(DATA_SIZE-2 downto WORD_SIZE)& data_i(DATA_SIZE-1))and (data_i(DATA_SIZE-9 downto WORD_SIZE)&data_i(DATA_SIZE-1 downto DATA_SIZE-8))) xor (data_i(WORD_SIZE-1 downto 0)) xor data_i(WORD_SIZE-1 downto 0) ) xor pr_key(WORD_SIZE-1 downto 0);

n_data<= tmp_data & data_i(DATA_SIZE-1 downto WORD_SIZE);

-- dans le top si count==nb_round alors copier data_out dans le ciphertext
	end if;
end process;
end rtl_round;

