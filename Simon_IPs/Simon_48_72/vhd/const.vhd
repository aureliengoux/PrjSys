library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_unsigned.all;

package const_def is 
	-- IP parameters
  constant DATA_SIZE : integer := 48; 									-- 2*n
	constant WORDS_NB  : integer := 3;										-- m 
	constant WORD_SIZE : integer := DATA_SIZE/2 ; 				-- n
  constant KEY_SIZE  : integer := WORD_SIZE * WORDS_NB;	-- m*n
	constant NB_ROUND  : integer := 36;								

	-- Key schedule encryption
  constant ROUND_CONST: std_logic_vector(63 downto 0):= X"fffffffffffffffc"; -- constant "c" for key schedule (see figure)
  constant Z         : std_logic_vector(61 downto 0 ):= "01100111000011010100100010111110110011100001101010010001011111"; --constant sequence "z" for key schedule (see figure)
end const_def;

