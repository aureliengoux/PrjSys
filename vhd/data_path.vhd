library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_unsigned.all;
 use IEEE.numeric_std.all;
library lib_simon;
 use lib_simon.const_def.all;

entity  data_path is 
 port (
      clk : in std_logic;
      nrst: in std_logic;
      ctr : in std_logic;
      din : in std_logic_vector(DATA_SIZE-1 downto 0);
      dout: out std_logic_vector(DATA_SIZE-1 downto 0)
 );
end data_path;

architecture rtl_data_path of data_path is

--signal rblock : std_logic_vector(DATA_SIZE/2-1) downto 0) := din((DATA_SIZE-1)/2 downto 0); -- Right half of the block size
--signal lblock : std_logic_vector((DATA_SIZE/2-1) downto 0) := din(DATA_SIZE-1) downto (DATA_SIZE/2-1)); --Left half ...
--signal shift1 : std_logic_vector((DATA_SIZE-1) downto 0) := shift_right(unsigned(l_block),1);
--signal shift2 : std_logic_vector((DATA_SIZE-1) downto 0) := shift_right(unsigned(l_block),2);
--signal shift8 : std_logic_vector((DATA_SIZE-1) downto 0) := shift_right(unsigned(l_block),8);

signal rblock : std_logic_vector((DATA_SIZE/2-1) downto 0);
signal lblock : std_logic_vector((DATA_SIZE/2-1) downto 0);
signal shift1 : std_logic_vector((DATA_SIZE-1) downto 0); 
signal shift2 : std_logic_vector((DATA_SIZE-1) downto 0); 
signal shift8 : std_logic_vector((DATA_SIZE-1) downto 0); 

begin
	process
	begin
	shift1	<= shift_right(lblock,1);
	shift2	<= shift_right(unsigned(l_block),2);
	shift8	<= shift_right(unsigned(l_block),8);
	rblock <= shift2 XOR shift1 AND shift8 XOR rblock; 
		--Switch out values
		dout((DATA_SIZE/2-1) downto 0) <= lbloc ; --Right half of dout
		dout((DATA_SIZE-1)downto (DATA_SIZE/2-1)) <= rblock ; --Left half of dout
	end process


end rtl_data_path;
