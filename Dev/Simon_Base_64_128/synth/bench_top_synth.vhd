library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_unsigned.all;
 use IEEE.numeric_std.all;

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
DUT: top port map(s_clk,s_nrst,s_start,s_key_i,s_plaintext,s_ciphertext,s_done);

	process(s_clk)
	begin 
	s_clk <= not s_clk after 2 ns;
	end process; 

	process
	begin
    s_nrst<='0';
	 	s_key_i<= x"1b1a1918131211100b0a090803020100";
	 	s_plaintext<=x"656b696c20646e75";    
		wait for 500 ns;
		s_nrst<='1'; 
    
    wait for 500 ns;
    
		s_start<='1';
    wait for 100 ns;
		s_start<='0';
    wait until s_done ='1';
    assert s_ciphertext= x"44c8fc20b9dfa07a" report" FATAL ERROR: ciphertext_error." severity failure;	 	
    wait for 50 ns;
 
   	s_start<='1';
    wait for 50 ns;
		s_start<='0';
    wait until s_done ='1';
		assert s_ciphertext= x"44c8fc20b9dfa07a" report" FATAL ERROR: ciphertext_error." severity failure;
		wait for 500 ns;

		s_start<='1';
    wait for 50 ns;
		s_start<='0';
    wait until s_done ='1';
		assert s_ciphertext= x"44c8fc20b9dfa07a" report" FATAL ERROR: ciphertext_error." severity failure;
		wait for 500 ns;

		s_nrst <= '0';
		wait for 50 ns;
		s_nrst <= '1';
		wait for 50 ns;

		s_start<='1';
    wait for 50 ns;
		s_start<='0';
    wait until s_done ='1';
		assert s_ciphertext= x"44c8fc20b9dfa07a" report" FATAL ERROR: ciphertext_error." severity failure;
		wait for 500 ns;  
    
    assert false report "test pass, failure ending test" severity failure; 

	end process;
end tb;
