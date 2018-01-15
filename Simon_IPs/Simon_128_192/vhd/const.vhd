library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_unsigned.all;

package const_def is 
	-- IP parameters
  constant DATA_SIZE : integer := 128; 									-- 2*n
	constant WORDS_NB  : integer := 3;										-- m 
	constant WORD_SIZE : integer := DATA_SIZE/2 ; 				-- n
  constant KEY_SIZE  : integer := WORD_SIZE * WORDS_NB;	-- m*n
	constant NB_ROUND  : integer := 69;								

	-- Key schedule encryption
  constant ROUND_CONST: std_logic_vector(71 downto 0):= X"fffffffffffffffffc"; -- constant "c" for key schedule (see figure)
  constant Z         : std_logic_vector(71 downto 0 ):= "011101101111110000101100111001010001001000000111101001100011010111011011"; --constant sequence "z" for key schedule (see figure)
end const_def;

