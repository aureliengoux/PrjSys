library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_unsigned.all;
 use IEEE.numeric_std.all;
library lib_simon;
 use lib_simon.const_def.all;
 use lib_simon.top;
  use lib_simon.round;
 use lib_simon.counter;


entity tb_top is 
end tb_top;

architecture tb of tb_top is 
component top is 
      port (
        clk : in std_logic;
	nrst: in std_logic;	
        key_i : in std_logic_vector(KEY_SIZE-1 downto 0);	
	plaintext: in std_logic_vector(DATA_SIZE-1 downto 0); 
        ciphertext: out std_logic_vector (DATA_SIZE-1 downto 0)
       );
end component;

signal       s_clk :  std_logic:='0';
signal	s_nrst:  std_logic;
signal       s_key_i :  std_logic_vector(KEY_SIZE-1 downto 0);	
signal	s_plaintext:  std_logic_vector(DATA_SIZE-1 downto 0) ; 
signal        s_ciphertext:  std_logic_vector (DATA_SIZE-1 downto 0);

begin
 
DUT: top port map (s_clk,s_nrst,s_key_i,s_plaintext,s_ciphertext);


process(s_clk)
begin 
s_clk <= not s_clk after 2 ns;
end process; 


process
begin


 s_nrst<='0';
 --s_key_i<= x"1b1a1918131211100b0a090803020100";
   s_key_i<= x"0000ffff0000ffff0000ffff0000ffff";
 s_plaintext<=x"656b696c20646e75";
  
-- s_key_i<=();
 --s_plaintext<=(others=>'0');
 
 wait for 500 ns;
 s_nrst<='1';

 wait ;
end process;

end tb;
