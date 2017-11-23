library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_unsigned.all;
library lib_simon;
 use lib_simon.const_def.all;

entity round is
  port(
 	clk : in std_logic;
	nrst: in std_logic;
	count: in std_logic_vector(NB_ROUND downto 0);
        key_i : in std_logic_vector(KEY_SIZE-1 downto 0);
	rkey : out std_logic_vector(KEY_SIZE/WORDS_NB-1 downto 0);
	data_i: in std_logic_vector(DATA_SIZE-1 downto 0); 
        data_o: out std_logic_vector (DATA_SIZE-1 downto 0)

	--plaintxt/cipertxt pour le top
      );
end round;

architecture rtl_round of round is 

signal rkey,tmp,tmp1: std_logic_vector(WORD_SIZE-1 downto 0);
signal ldata : std_logic_vector(DATA_SIZE-1 downto WORD_SIZE);
signal rdata : std_logic_vector(WORD_SIZE-1 downto 0);
 

begin 

--synchro: process(clk,nrst)
--begin
--current_key<=(others->'0');
--else 
--next_key<=key
--end process synchro;

key_gen: process(clk,nrst,key,count)

begin
 if (count="00001") then 
  rkey<= key(WORD_SIZE-1 downto 0) ;
else 
  -- key(WORD_SIZE*2-1 downto WORD_SIZE) xor (key( downto ())& key());
  tmp <= key(KEY_SIZE-1 downto (WORD_SIZE*(WORDS_NB-1)));--get les 32 msbs
  tmp <= tmp(2 downto 0)&tmp(WORD_SIZE-1 downto 3); -- rotation vers la droite (3 bits)
  tmp <= tmp xor key(WORD_SIZE*2-1 downto WORD_SIZE); --xor avec la deuxième mot (du 63 a 32 de clé mère)
  tmp1<= tmp(0)&tmp(WORD_SIZE-1 downto 1);-- rotation vers la droite (1 bit)
  tmp <= tmp xor key(WORD_SIZE-1 downto 0);
  tmp <= tmp xor  tmp1;
  tmp <= tmp xor (key xor Zi); 
  key <= tmp & key((WORD_SIZE*(WORDS_NB-1)) downto WORD_SIZE);--attention affectation d'une valeur à un signal  
 end if;
end process key_gen;

data_path : process(clk, nrst,datacount)
begin


end rtl_round;

