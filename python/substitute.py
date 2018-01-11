import tools

def constFile(dSize, wNb, rNb, z):
	constFile= tools.myRead("../Simon_Base_64_128/vhd/const.vhd")
	constFile = tools.substituteString(r" 64;", r" " + str(dSize) +";",constFile)
	constFile = tools.substituteString(r" 4;", r" " + str(wNb) +";",constFile)
	constFile = tools.substituteString(r" 44;",r" "+ str(rNb) +";",constFile)
	constFile = tools.substituteString(r"\"(?P<dSize>\d+)\";",r"\"" + str(z) +"\";",constFile)

	return constFile
	
def roundFile(wNb,rNb):
	if rNb > 64 :
		cSize = 7		
	elif rNb > 32:
		cSize = 6
	else:
		cSize = 5

	roundFile = tools.myRead("../Simon_Base_64_128/vhd/round.vhd")
	roundFile = tools.substituteString(r"5 downto 0", str(cSize) + r" downto 0", roundFile)
	if wNb<4 :
		roundFile = tools.substituteString(r"s3xorkey <=", r"--s3xorkey <=", roundFile)
		roundFile = tools.substituteString(r"s3xorkey", r"s3_key", roundFile)

	return roundFile

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

	counterFile = tools.myRead("../Simon_Base_64_128/vhd/counter.vhd")
	counterFile = tools.substituteString(r"5 downto 0", str(cSize) + r" downto 0", counterFile)
	counterFile = tools.substituteString(r"\"(?P<dSize>\d+)\"0",r"\"" + str(reset) +"\";",counterFile)
	counterFile = tools.substituteString(r"\"(?P<dSize>\d+)\"1",r"\"" + str(incr) +"\";",counterFile)

	return counterFile

def topFile(rNb):
	if rNb > 64 :
		cSize = 7		
	elif rNb > 32:
		cSize = 6
	else:
		cSize = 5

	topFile = tools.myRead("../Simon_Base_64_128/vhd/Top.vhd")
	topFile = tools.substituteString(r"5 downto 0", str(cSize) + r" downto 0", topFile)

	return topFile

def benchFile():
	return tools.myRead("../Simon_Base_64_128/bench/bench_top.vhd")

def benchSynthFile():
	return tools.myRead("../Simon_Base_64_128/SYNT_PRE_2014/bench_top_synth.vhd")

def compileVHD():
	strScript = "rm _r ./lib_simon\n\
\n\
vlib lib_simon\n\
vmap lib_simon $HOME/Prj_Sys/Simon_IPs/vhd/lib_simon\n\
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
