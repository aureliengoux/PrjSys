library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_unsigned.all;

package const_def is 
	-- IP parameters
  constant DATA_SIZE : integer := 48; 									-- 2*n
	constant WORDS_NB  : integer := 4;										-- m 
	constant WORD_SIZE : integer := DATA_SIZE/2 ; 				-- n
  constant KEY_SIZE  : integer := WORD_SIZE * WORDS_NB;	-- m*n
	constant NB_ROUND  : integer := 36;								

	-- Key schedule encryption
  constant ROUND_CONST: std_logic_vector(71 downto 0):= X"fffffffffffffffffc"; -- constant "c" for key schedule (see figure)
  constant Z         : std_logic_vector(71 downto 0 ):= "110111000101011010000110010011111011100010101101000011001001111101110001"; --constant sequence "z" for key schedule (see figure)
end const_def;

