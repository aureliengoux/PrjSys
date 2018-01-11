library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_unsigned.all;
	use IEEE.numeric_std.all;
library lib_simon;
	use lib_simon.const_def.all;
	use lib_simon.round;
	use lib_simon.counter;

entity top is 
	port (
  	clk : in std_logic;
		nrst: in std_logic;	
    start: in std_logic;    
    key_i : in std_logic_vector(KEY_SIZE-1 downto 0);	
		plaintext: in std_logic_vector(DATA_SIZE-1 downto 0); 
    ciphertext: out std_logic_vector (DATA_SIZE-1 downto 0);
    done : out std_logic
  );
end top;

architecture rtl_top of top is 
	component round port (
        clk : in std_logic;
				nrst: in std_logic;
        start: in std_logic;
				count: in std_logic_vector(5 downto 0);
        key_i : in std_logic_vector(KEY_SIZE-1 downto 0);	
				data_in: in std_logic_vector(DATA_SIZE-1 downto 0); 
        data_out: out std_logic_vector (DATA_SIZE-1 downto 0)
  );
        
	end component;

	component counter port (
        clk	: in std_logic;
        nrst: in std_logic;       
   			start : in std_logic;
				count : out std_logic_vector(5 downto 0);
        done  : out std_logic);
	end component;

	signal s_count: std_logic_vector (5 downto 0);

begin 
	round_map: round PORT MAP (
		clk=>clk,
    nrst=>nrst,
    start=>start,
		count=>s_count,
		key_i=>key_i,
    data_in=>plaintext,
    data_out=>ciphertext
	);

	counter_map: counter PORT MAP (
		clk=>clk,
		nrst=>nrst,    
    start=>start,
	  count=>s_count,
    done => done 
	);

  --done<=s_done;
end rtl_top;
