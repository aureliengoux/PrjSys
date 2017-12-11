library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;
	use IEEE.numeric_std.all;
library lib_simon;
	use lib_simon.const_def.all;

entity counter is
	port(	
		clk	: in std_logic;
    nrst: in std_logic;
    done : out std_logic;
		count : out std_logic_vector(5 downto 0)
	);
end counter;

architecture rtl_counter of counter is
	signal val: std_logic_vector(5 downto 0);

begin
	process(clk,nrst)      
  begin
  	if (nrst = '0')  then 
	    	val <= "000000";
        done <= '0';
    elsif clk'event and clk = '1' then
  	  if (val >= NB_ROUND)then  
      	val <= "111111";
        done <='1';  
      else 
      	val <= val + "000001";
        done <='0';
      end if;
    end if;
  end process;

  count <= val; 
 
end rtl_counter;
