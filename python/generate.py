import tools

def constFile(dSize, wNb, rNb, z):
	strLibraries = 'library IEEE;\n\
	use IEEE.std_logic_1164.all;\n\
	use IEEE.std_logic_unsigned.all;\n\
 \n'

	strPackage = "package const_def is \n\
	-- IP parameters\n\
  constant DATA_SIZE : integer := "+ str(dSize) +"; 											-- 2*n\n\
	constant WORDS_NB  : integer := "+ str(wNb) +";												-- m \n\
	constant WORD_SIZE : integer := DATA_SIZE/2 ; 						-- n\n\
  constant KEY_SIZE  : integer := WORD_SIZE * WORDS_NB;			-- m*n\n\
	constant NB_ROUND  : integer :=  "+ str(rNb) +";\n\
	\n\
	-- Key schedule encryption \n\
  constant ROUND_CONST: std_logic_vector(31 downto 0):= X\"fffffffc\"; -- constant \"c\" for key schedule (see figure)\n\
  constant Z         : std_logic_vector(61 downto 0 ):= \""+ str(z) +"\"; --constant sequence \"z\" for key schedule (see figure)\n\
end const_def;\n"

	return  strLibraries+strPackage
		

def roundFile(wNb,rNb):
	if rNb > 64 :
		cSize = 7		
	elif rNb > 32:
		cSize = 6
	else:
		cSize = 5

	strLibraries = "library IEEE;\n\
	use IEEE.std_logic_1164.all;\n\
	use IEEE.std_logic_unsigned.all;\n\
	use IEEE.numeric_std.all;\n\
library lib_simon;\n\
	use lib_simon.const_def.all;\n\
\n"

	strEntity= "entity round is\n\
  port(\n\
	 	clk : in std_logic;\n\
		nrst: in std_logic;\n\
    start: in std_logic;\n\
		done: in std_logic;\n\
		count: in std_logic_vector("+str(cSize)+" downto 0); \n\
    key_i : in std_logic_vector(KEY_SIZE-1 downto 0);	\n\
		data_in: in std_logic_vector(DATA_SIZE-1 downto 0);\n\
   	data_out: out std_logic_vector (DATA_SIZE-1 downto 0)\n\
    --done: out std_logic\n\
	);\n\
end round;\n\
\n"

	strArchi = "architecture rtl_round of round is \n\
	-- registers update signals\n\
	signal cr_key,n_key: std_logic_vector(KEY_SIZE-1 downto 0); --key\n\
	signal cr_data,n_data: std_logic_vector(DATA_SIZE-1 downto 0); --data\n\
\n\
	-- intermediate signals for key calculation\n\
	signal zji: std_logic_vector(WORD_SIZE-1 downto 0); -- key encryption with \"c\" and \"z\" sequence constants \n\
	signal msb_key: std_logic_vector(WORD_SIZE-1 downto 0); --current key 4th word (96-127)\n\
	signal s3_key: std_logic_vector(WORD_SIZE-1 downto 0); -- 3 bits right rotation of msb_key \n\
	signal s3xorkey: std_logic_vector(WORD_SIZE-1 downto 0); -- s3_key xor 2nd current key word (32-63)\n\
	signal s1_key: std_logic_vector(WORD_SIZE-1 downto 0); -- 1 bit right rotation of s3xorkey\n\
	signal key_temp1: std_logic_vector(WORD_SIZE-1 downto 0); -- s3xorkey xor 1st current key word (0-31)\n\
	signal key_temp2: std_logic_vector(WORD_SIZE-1 downto 0); -- s1_key xor key_temp2\n\
	signal r_key: std_logic_vector(WORD_SIZE-1 downto 0); -- round key\n\
\n\
	-- intermediate signals for data calculation\n\
	signal s1_data: std_logic_vector(WORD_SIZE-1 downto 0); -- 1 bit left rotation of left half of data\n\
	signal s8_data: std_logic_vector(WORD_SIZE-1 downto 0); -- 8 bit left rotation of left half of data\n\
	signal s2_data: std_logic_vector(WORD_SIZE-1 downto 0); -- 2 bit left rotation of left half of data\n\
	signal r_data: std_logic_vector(WORD_SIZE-1 downto 0); -- round data\n\
\n\
begin\n"

	strSynchroProc= "--process for registers update\n\
	synchro: process(clk,nrst)\n\
	begin\n\
		if (nrst='0')then -- asynchronous low level reset\n\
			cr_key<= key_i; -- master key loaded in key register (write)\n\
		 	cr_data<= data_in; -- plaintext loaded in data register (write)\n\
		elsif (clk'event and clk='1') then --rising edge\n\
      if (start='1') then\n\
      	cr_key<=key_i; -- master key loaded in key register (write)\n\
		 		cr_data<=data_in; -- plaintext loaded in data register (write)\n\
      else\n\
		 		cr_key<=n_key;	--new round key loaded in key register (write)\n\
		 		cr_data<=n_data; --new round data loaded in data register (write)\n\
      end if;\n\
		end if;\n\
	end process synchro;\n"
	if wNb<4 :
		strKeyProc = "--\n\
		key_gen: process(key_i,count,cr_key,msb_key,s3_key,s3xorkey,s1_key,key_temp1,key_temp2,r_key,start)\n\
		begin\n\
			if (count < NB_ROUND)then\n\
				msb_key <= cr_key(KEY_SIZE-1 downto (WORD_SIZE*(WORDS_NB-1))); --gets the 32 most significant bits\n\
				s3_key <= msb_key(2 downto 0)&msb_key(WORD_SIZE-1 downto 3); -- right rotation (3 bits)\n\
				--s3xorkey <= s3_key xor cr_key((WORD_SIZE*2)-1 downto WORD_SIZE); -- xor with 2nd word of current key (32-63) \n\
				s1_key <= (s3_key(0)& s3_key((WORD_SIZE-1) downto 1)); --right rotation (1 bits)\n\
				key_temp1 <= s3_key xor cr_key(WORD_SIZE-1 downto 0); -- xor with 1st word of current key (0-31)\n\
				key_temp2 <= key_temp1 xor s1_key;\n\
				zji<=ROUND_CONST(WORD_SIZE-1 downto 1)& Z(to_integer(unsigned(count))); --\"c\" xor \"z\" (see key schedule figure)\n\
				r_key <= key_temp2 xor zji; -- r_key = 32 bits calculated in a single round\n\
				n_key <= r_key & cr_key((WORD_SIZE*WORDS_NB)-1 downto WORD_SIZE); -- n_key = right shift of current key with round key added to the left\n\
		 	else \n\
				--assignation of all signals in all branches to avoid latches\n\
				msb_key <= (others => '0');\n\
			 	s3_key <= (others => '0');\n\
				s3xorkey <= (others => '0');\n\
				s1_key <= (others => '0');\n\
				key_temp1 <= (others => '0');\n\
				key_temp2 <= (others => '0');      \n\
				zji<=(others => '0');\n\
				r_key <= (others => '0');\n\
				n_key <= (others => '0');\n\
			end if;\n\
		end process key_gen;\n"
	else :
		strKeyProc = "--\n\
			key_gen: process(key_i,count,cr_key,msb_key,s3_key,s3xorkey,s1_key,key_temp1,key_temp2,r_key,start)\n\
			begin\n\
				if (count < NB_ROUND)then\n\
					msb_key <= cr_key(KEY_SIZE-1 downto (WORD_SIZE*(WORDS_NB-1))); --gets the 32 most significant bits\n\
					s3_key <= msb_key(2 downto 0)&msb_key(WORD_SIZE-1 downto 3); -- right rotation (3 bits)\n\
					s3xorkey <= s3_key xor cr_key((WORD_SIZE*2)-1 downto WORD_SIZE); -- xor with 2nd word of current key (32-63)\n\
					s1_key <= (s3xorkey(0)& s3xorkey((WORD_SIZE-1) downto 1)); --right rotation (1 bits)\n\
					key_temp1 <= s3xorkey xor cr_key(WORD_SIZE-1 downto 0); -- xor with 1st word of current key (0-31)\n\
					key_temp2 <= key_temp1 xor s1_key;\n\
					zji<=ROUND_CONST(WORD_SIZE-1 downto 1)& Z(to_integer(unsigned(count))); --\"c\" xor \"z\" (see key schedule figure)\n\
					r_key <= key_temp2 xor zji; -- r_key = 32 bits calculated in a single round\n\
					n_key <= r_key & cr_key((WORD_SIZE*WORDS_NB)-1 downto WORD_SIZE); -- n_key = right shift of current key with round key added to the left\n\
			 	else \n\
					--assignation of all signals in all branches to avoid latches\n\
					msb_key <= (others => '0');\n\
				 	s3_key <= (others => '0');\n\
					s3xorkey <= (others => '0');\n\
					s1_key <= (others => '0');\n\
					key_temp1 <= (others => '0');\n\
					key_temp2 <= (others => '0');      \n\
					zji<=(others => '0');\n\
					r_key <= (others => '0');\n\
					n_key <= (others => '0');\n\
				end if;\n\
			end process key_gen;\n"


	strDataProc = "--\n\
	data_path : process(cr_data,count,cr_key,r_data,s2_data,s8_data, s1_data,start)\n\
	begin\n\
\n\
		data_out <= cr_data;\n\
\n\
		if (count < NB_ROUND) then\n\
			s1_data<=cr_data(DATA_SIZE-2 downto WORD_SIZE)& cr_data(DATA_SIZE-1); \n\
			s8_data<=cr_data(DATA_SIZE-9 downto WORD_SIZE)& cr_data(DATA_SIZE-1 downto DATA_SIZE-8); \n\
			s2_data<=cr_data(DATA_SIZE-3 downto WORD_SIZE)& cr_data(DATA_SIZE-1 downto DATA_SIZE-2);\n\
			r_data<= ( ( ( (s1_data and s8_data) xor cr_data(WORD_SIZE-1 downto 0) ) xor s2_data) xor cr_key(WORD_SIZE-1 downto 0) );--calculate round_data\n\
			n_data<= r_data & cr_data(DATA_SIZE-1 downto WORD_SIZE); -- switch left half and right half data\n\
  	else\n\
		--assignation of all signals in all branches to avoid latches\n\
			s1_data<=(others => '0');\n\
			s8_data<=(others => '0');\n\
			s2_data<=(others => '0');\n\
			n_data<= cr_data;\n\
			r_data<= (others => '0'); \n\
\n\
		end if;\n\
	end process;\n\
end rtl_round;\n"

	return strLibraries+strEntity+strArchi+strSynchroProc+strKeyProc+strDataProc

def counterFile(rNb):
	if rNb > 64 :
		cSize = 7
		reset = "0000000"
		incr = "0000001"
	elif rNb > 32:
		cSize = 6
		reset = "000000"
		incr = "000001"
	else:
		cSize = 5
		reset = "00000"
		incr = "00001"

	strLibraries = "library IEEE;\n\
	use IEEE.std_logic_1164.all;\n\
	use IEEE.numeric_std.all;\n\
	use IEEE.std_logic_unsigned.all;\n\
	use IEEE.numeric_std.all;\n\
library lib_simon;\n\
	use lib_simon.const_def.all;\n\
\n"

	strEntity = "entity counter is\n\
	port(\n\
		clk	: in std_logic;\n\
    nrst: in std_logic;\n\
    start  : in std_logic;	-- overflow flag\n\
		count : out std_logic_vector("+str(cSize)+" downto 0); --count output\n\
	  done: out std_logic\n\
   );\n\
end counter;\n\
\n"

	strArchi = "architecture rtl_counter of counter is\n\
	signal val: std_logic_vector("+str(cSize)+" downto 0); --signal for read and write count value\n\
\n\
begin\n\
	process(clk,nrst)\n\
  begin\n\
  	if (nrst = '0')  then -- asynchronous low level reset\n\
	  	val <= \""+str(reset)+"\";		-- reset counter\n\
     	done <= '0';				-- lower flag\n\
    elsif clk'event and clk = '1' then  	    \n\
     if (start ='1')then\n\
      	val <= \""+str(reset)+"\";\n\
        done <='0';  		 	-- drop flag\n\
      elsif  (val >= NB_ROUND )then        	  \n\
       	val<=val;\n\
        done <='1'; --rise flag \n\
       else\n\
      	 val <= val + \""+str(incr)+"\"; --count\n\
         done <='0';\n\
       end if;\n\
    end if;\n\
  end process;\n\
\n\
  count <= val; 			--concurrential update of count output\n\
\n\
end rtl_counter;\n"

	return strLibraries+strEntity+strArchi

def topFile(rNb):
	if rNb > 64 :
		cSize = 7		
	elif rNb > 32:
		cSize = 6
	else:
		cSize = 5
			
	strLibraries = "library IEEE;\n\
	use IEEE.std_logic_1164.all;\n\
	use IEEE.std_logic_unsigned.all;\n\
	use IEEE.numeric_std.all;\n\
library lib_simon;\n\
	use lib_simon.const_def.all;\n\
	use lib_simon.round;\n\
	use lib_simon.counter;\n\
\n"

	strEntity = "entity top is \n\
	port (\n\
  	clk : in std_logic;\n\
		nrst: in std_logic;	\n\
    start: in std_logic;    \n\
    key_i : in std_logic_vector(KEY_SIZE-1 downto 0);	\n\
		plaintext: in std_logic_vector(DATA_SIZE-1 downto 0); \n\
    ciphertext: out std_logic_vector (DATA_SIZE-1 downto 0);\n\
    done : out std_logic\n\
  );\n\
end top;\n\
\n"

	strCompRound = "architecture rtl_top of top is \n\
	component round port (\n\
        clk : in std_logic;\n\
				nrst: in std_logic;\n\
				done: in std_logic;\n\
        start: in std_logic;\n\
				count: in std_logic_vector("+str(cSize)+" downto 0);\n\
        key_i : in std_logic_vector(KEY_SIZE-1 downto 0);	\n\
				data_in: in std_logic_vector(DATA_SIZE-1 downto 0); \n\
        data_out: out std_logic_vector (DATA_SIZE-1 downto 0)\n\
        --done: out std_logic\n\
        );\n\
	end component;\n\
\n"

	strCompCount = "	component counter port (\n\
        clk	: in std_logic;\n\
        nrst: in std_logic;\n\
   			start : in std_logic;\n\
				count : out std_logic_vector("+str(cSize)+" downto 0);\n\
 				done  : out std_logic);\n\
	end component;\n\
\n"

	strMap = "begin \n\
	round_map: round PORT MAP (\n\
		clk=>clk,\n\
    nrst=>nrst,\n\
    start=>start,\n\
    done => s_done,\n\
		count=>s_count,\n\
		key_i=>key_i,\n\
    data_in=>plaintext,\n\
    data_out=>ciphertext\n\
    --done => done\n\
	);\n\
\n\
	counter_map: counter PORT MAP (\n\
		clk=>clk,\n\
		nrst=>nrst,    \n\
    start=>start,\n\
	  count=>s_count,\n\
    done => s_done  \n\
	);\n\
\n\
  done<=s_done;\n\
end rtl_top;\n"

	return strLibraries+strEntity+strCompRound+strCompCount+strMap

def benchFile():
	return tools.myRead("../Simon_Base_64_128/bench/bench_top.vhd")

def benchSynthFile():
	return tools.myRead("../Simon_Base_64_128/SYNT_PRE_2014/bench_top_synth.vhd")

def compileVHD():
	strScript = "rm _r ./lib_simon\n\
\n\
vlib lib_simon\n\
vmap lib_simon ./lib_simon\n\
\n\
vcom +acc -work lib_simon  ./const.vhd\n\
vcom +acc -work lib_simon  ./round.vhd\n\
vcom +acc -work lib_simon  ./counter.vhd\n\
vcom +acc -work lib_simon  ./Top.vhd"
	return strScript

def compileBench():
	strScript = "cd ../vhd/\n\
./script\n\
cd ../bench\n\
\n\
rm -r ./lib_bench_simon\n\
vlib lib_bench_simon\n\
vmap lib_bench_simon ./lib_bench_simon\n\
\n\
vcom +acc -work lib_bench_simon  ./bench_top.vhd"
	return strScript

def compileSynth():
	strScript = "rm -r ./lib_synth\n\
vlib lib_synth\n\
vmap lib_synth ./lib_synth\n\
#vcom +acc -work lib_synth  ../vhd/const.vhd\n\
vcom +acc -work lib_synth  ./simon_synth_impl_1/top.vhd\n\
\n\
rm -r ./lib_bench\n\
vlib lib_bench\n\
vmap lib_bench ./lib_bench\n\
vcom +acc -work lib_bench ./bench_top_synth.vhd"
	return strScript
