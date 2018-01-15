library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_unsigned.all;
 use IEEE.numeric_std.all;
--library lib_simon;
-- use lib_simon.const_def.all;
-- use lib_simon.top;
-- use lib_simon.round;
-- use lib_simon.counter;

library lib_synth;
use lib_synth.const_def.all; 
use lib_synth.round;
use lib_synth.top;


entity tb_top is 
end tb_top;

architecture tb of tb_top is 	
	component top is 
  	port (
    	clk : in std_logic;
			nrst: in std_logic;	
      start: in std_logic;      
      key_i : in std_logic_vector(KEY_SIZE-1 downto 0);	
			plaintext: in std_logic_vector(DATA_SIZE-1 downto 0); 
      ciphertext: out std_logic_vector (DATA_SIZE-1 downto 0);
      done: out std_logic
    );
end component;

	signal  s_clk :  std_logic:='0';
	signal	s_nrst:  std_logic;  
	signal  s_key_i :  std_logic_vector(KEY_SIZE-1 downto 0);	
	signal	s_plaintext:  std_logic_vector(DATA_SIZE-1 downto 0) ; 
	signal  s_ciphertext:  std_logic_vector (DATA_SIZE-1 downto 0);
  signal  s_start: std_logic:='0';
  signal  s_done:  std_logic;

begin
DUT: top port map (s_clk,s_nrst,s_start,s_key_i,s_plaintext,s_ciphertext,s_done);

	process(s_clk)
	begin 
	s_clk <= not s_clk after 2 ns;
	end process; 

	process
	begin
    s_nrst<='0';
	 	s_key_i<= x"1514131211100d0c0v0a0908050403020100";
	 	s_plaintext<=x"74616874207473756420666f";
		wait for 500 ns;
		s_nrst<='1';     
		s_start<='1';
    wait for 50 ns;
		s_start<='0';
    --assert s_ciphertext= x"44c8fc20b9dfa07" report" FATAL ERROR: ciphertext_error." severity error;	 	
    wait for 500 ns;
    s_start<='1';
		wait for 50 ns;
		s_start<='0';
		--assert s_ciphertext= x"44c8fc20b9dfa07" report" FATAL ERROR: ciphertext_error." severity error;
		wait for 500 ns;
    
	 	wait ;
	end process;

end tb;

