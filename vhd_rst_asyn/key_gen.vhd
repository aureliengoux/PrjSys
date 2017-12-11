library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_unsigned.all;
library lib_simon;
 use lib_simon.const_def.all;

entity  key_gen is 
 port (
      clk : in std_logic;
      nrst: in std_logic;
      cntr : in std_logic;
      start: in std_logic;
      key : in std_logic_vector(KEY_SIZE-1 downto 0);
      rkey: out std_logic_vector(WORD_SIZE-1 downto 0)
 );
end key_gen;

architecture rtl_key_gen of key_gen is 
 signal next_key: std_logic_vector(KEY_SIZE-1 downto 0);
 signal actl_key:  std_logic_vector(KEY_SIZE-1 downto 0);
 signal rkey: std_logic_vector(WORD_SIZE-1 downto 0);
 signal 
synchro:process(clk,nrst)
 begin 
    if (clk'event and clk='1') then 
     if (nrst='0')then
        actl_key<=(others=>'0');
     elsif
        actl_key<=next_key;
     end if; 
    end if;   
 end process synchro;

clacul: process
 begin 
  if start='1' then  
	  for i in 0 to WORDS_NB-1 loop
	    <=actl_key(WORD_SIZE-1 downto WORD_SIZE*i )
	  end loop
  end if 

  
 end process calcul;
 
end rtl_key_gen;



