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
end const_def;
