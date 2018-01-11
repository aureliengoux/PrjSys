library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	use IEEE.std_logic_unsigned.all;
	use IEEE.numeric_std.all;
library lib_simon;
	use lib_simon.const_def.all;

entity counter is
	port(	
		clk	: in std_logic;
    nrst: in std_logic;    
    start  : in std_logic;	-- overflow flag
		count : out std_logic_vector(6 downto 0); --count output
	  done: out std_logic
   );
end counter;

architecture rtl_counter of counter is 
signal n_val,cr_val: std_logic_vector (6 downto 0);

begin 
synchro: process (clk,nrst)
begin
 if (nrst ='0')then 
    cr_val <= "0000000";;
 elsif (clk'event and clk='1') then --rising edge 
   cr_val <= n_val;
 end if; 
end process synchro; 


counting:process (start,cr_val)
begin
count<=cr_val;
	if (start = '1') then
					n_val<="0000000";;
					done <= '0';
	elsif  (cr_val >= NB_ROUND )then        	  
		     	n_val<=cr_val; 
		      done <='1'; --rise flag 
	else
					 n_val <= cr_val + "0000001";; 
		       done <='0';	
	end if;

end process counting;



end rtl_counter; 
