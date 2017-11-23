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
	data_i: in std_logic_vector(DATA_SIZE-1 downto 0); 
        data_o: out std_logic_vector (DATA_SIZE-1 downto 0)

	--plaintxt/cipertxt pour le top
      );
end round;

architecture rtl_round of round is 

signal pr_key,n_key: std_logic_vector(KEY_SIZE-1 downto 0);
signal ldata : std_logic_vector(DATA_SIZE-1 downto WORD_SIZE);
signal rdata : std_logic_vector(WORD_SIZE-1 downto 0);
 

begin 

synchro_key: process(clk,nrst)
begin
 if (clk'event and clk='1') then 
  if (nrst='0')then 
 	pr_key<=key_i;         
  else 
 	pr_key<=n_key;
  end if;
 end if;
end process synchro_key;


key_gen: process(key_i,count)
variable tmp: std_logic_vector(WORD_SIZE-1 downto 0);
begin

  if (count < (NB_ROUND-WORDS_NB))then
  tmp := pr_key(KEY_SIZE-1 downto (WORD_SIZE*(WORDS_NB-1)));--get les 32 msbs
  tmp := tmp(2 downto 0)&tmp(WORD_SIZE-1 downto 3); -- rotation vers la droite (3 bits)

  if (WORDS_NB = 4)then 
     tmp := tmp xor pr_key(WORD_SIZE*2-1 downto WORD_SIZE); --xor avec la deuxième mot (du 63 a 32 de clé mère) 
  end if;

  tmp := (tmp xor pr_key(WORD_SIZE-1 downto 0)) xor (tmp(0)&tmp((WORD_SIZE-1) downto 1)); 
  tmp := tmp xor (key_i(WORD_SIZE-1 downto 1)&( key_i(0) xor Z(to_integer(unsigned(count))) )); 
  n_key <= tmp & pr_key((WORD_SIZE*(WORDS_NB-1)) downto WORD_SIZE);

  elsif (count>=(NB_ROUND-WORDS_NB) and count <=(NB_ROUND))then
  n_key <= SHT_ZEROS & pr_key((WORD_SIZE*(WORDS_NB-1)) downto WORD_SIZE);
  end if; 

end process key_gen;





data_path : process(clk, nrst,data,count)
begin
if (count< NB_ROUND) then 

elsif () 

end if;

end rtl_round;

