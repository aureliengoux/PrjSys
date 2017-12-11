library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_unsigned.all;

package const_def is 
        constant DATA_SIZE : integer := 64; 		-- 2*n
	constant WORDS_NB  : integer := 4;		-- m 
	constant WORD_SIZE : integer := DATA_SIZE/2 ; 	-- n
        constant KEY_SIZE  : integer := WORD_SIZE * WORDS_NB;-- m*n
	constant CONST_SEQU: integer :=   3;    
	constant NB_ROUND  : integer :=  44;
        constant ROUND_CONST: std_logic_vector(31 downto 0):= X"fffffffc";
        constant Z         : std_logic_vector(61 downto 0 ):="11110000101100111001010001001000000111101001100011010111011011";

--:="01010001001000000111101001100011010111011011";

--"1101101110101100011001011110000
--0010010001010";
        constant SHT_ZEROS : std_logic_vector(WORD_SIZE-1 downto 0) := (others=>'0');
end const_def;

