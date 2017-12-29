library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_unsigned.all;
 
package const_def is 
	-- IP parameters
  constant DATA_SIZE : integer := 128; 											-- 2*n
	constant WORDS_NB  : integer := 2;												-- m 
	constant WORD_SIZE : integer := DATA_SIZE/2 ; 						-- n
  constant KEY_SIZE  : integer := WORD_SIZE * WORDS_NB;			-- m*n
	constant NB_ROUND  : integer :=  68;
	
	-- Key schedule encryption 
  constant ROUND_CONST: std_logic_vector(31 downto 0):= X"fffffffc"; -- constant "c" for key schedule (see figure)
  constant Z         : std_logic_vector(61 downto 0 ):= "11001101101001111110001000010100011001001011000000111011110101"; --constant sequence "z" for key schedule (see figure)
end const_def;
