library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	use IEEE.std_logic_unsigned.all;
	use IEEE.numeric_std.all;
library lib_simon;
	use lib_simon.const_def.all;

entity fsm is
	port(	
		clk	: in std_logic;
    nrst: in std_logic;    
    start  : in std_logic;	-- overflow flag    
		count : out std_logic_vector(5 downto 0); --count output
	  done: out std_logic
   );
end fsm;


architecture rtl_fsm of  fsm is 
	type state_type is (idle,compute,finish);
	signal n_val,cr_val: std_logic_vector (5 downto 0);
	signal cr_state,n_state : state_type:=idle;

begin 
	synchro: process (clk,nrst)
	begin
 		if (nrst ='0')then 
		  cr_val <= "000000";
		  cr_state <=  idle ;  
	 	elsif (clk'event and clk='1') then --rising edge   
		 	cr_val <= n_val;
		  cr_state <= n_state;   
	 	end if; 
	end process synchro; 

	counting:process (start,cr_val,cr_state)
	begin
	count<=cr_val;
	case cr_state is
		when idle => 	n_val<="000000";
									done <= '0'; 
		             	if (start = '1') then
									 	n_state <= compute;
									else
										n_state<= cr_state;
		             	end if;	

		when compute => 
                    if (start = '1') then 
	                   n_val<= "000000";
                     done <='0'; 
                    else 
                    n_val <= cr_val + "000001"; 
				     				done <='0';  
                    end if;               
		                if (cr_val = NB_ROUND ) then 
			                n_state <= finish;
										else
											n_state<= cr_state;
		                end if;

		when finish => 	done <='1';	
		               	n_val <= cr_val;
		              	if (start = '1') then
									 		n_state <= idle;
										else
											n_state<= cr_state;		
					        	end if;

		when others =>  done <='0'; 
							      n_val<="000000";
										n_state <= idle;							
	end case;									 			 
	end process counting;
end rtl_fsm; 
