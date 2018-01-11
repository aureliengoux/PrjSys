import tools

def constFile(dSize, wNb, rNb, z):
	constFile= tools.myRead("../Simon_Base_64_128/vhd/const.vhd")
	constFile = tools.substituteString(r" 64;", r" " + str(dSize) +";",constFile)
	constFile = tools.substituteString(r" 4;", r" " + str(wNb) +";",constFile)
	constFile = tools.substituteString(r" 44;",r" "+ str(rNb) +";",constFile)
	constFile = tools.substituteString("\"(?P<dSize>\d+)\";", "\"" + str(z) +"\";",constFile)

	return constFile
	
def roundFile(wNb,rNb):
	if rNb > 64 :
		cSize = 6		
	elif rNb > 32:
		cSize = 5
	else:
		cSize = 4

	roundFile = tools.myRead("../Simon_Base_64_128/vhd/round.vhd")
	roundFile = tools.substituteString(r"5 downto 0", str(cSize) + r" downto 0", roundFile)
	if wNb<4 :
		roundFile = tools.substituteString(r"signal s3xorkey", r"--signal s3xorkey", roundFile)
		roundFile = tools.substituteString(r"s3_key,s3xorkey,", r"s3_key,", roundFile)
		roundFile = tools.substituteString(r"s3xorkey <=", r"--s3xorkey <=", roundFile)
		roundFile = tools.substituteString(r"s3xorkey\(", r"s3_key(", roundFile)
		roundFile = tools.substituteString(r"s3xorkey xor", r"s3_key xor", roundFile)

	return roundFile

def counterFile(rNb):
	if rNb > 64 :
		cSize = 6
		reset = "0000000"
		incr = "0000001"
	elif rNb > 32:
		cSize = 5
		reset = "000000"
		incr = "000001"
	else:
		cSize = 4
		reset = "00000"
		incr = "00001"

	counterFile = tools.myRead("../Simon_Base_64_128/vhd/counter.vhd")
	counterFile = tools.substituteString(r"5 downto 0", str(cSize) + r" downto 0", counterFile)
	counterFile = tools.substituteString("\"(?P<dSize>\d+)0\"","\"" + str(reset) +"\";",counterFile)
	counterFile = tools.substituteString("\"(?P<dSize>\d+)1\"","\"" + str(incr) +"\";",counterFile)

	return counterFile

def topFile(rNb):
	if rNb > 64 :
		cSize = 6		
	elif rNb > 32:
		cSize = 5
	else:
		cSize = 4

	topFile = tools.myRead("../Simon_Base_64_128/vhd/top.vhd")
	topFile = tools.substituteString(r"5 downto 0", str(cSize) + r" downto 0", topFile)

	return topFile

def benchFile(Key,plainT,cipherT):
	benchFile = tools.myRead("../Simon_Base_64_128/bench/bench_top.vhd")
	benchFile = tools.substituteString(r"\"1b1a1918131211100b0a090803020100\"", "\"" + Key + "\"", benchFile)
	benchFile = tools.substituteString(r"\"656b696c20646e75\"", "\""+ plainT + "\"", benchFile)
	benchFile = tools.substituteString(r"\"44c8fc20b9dfa07\"", "\"" + cipherT + "\"", benchFile)
	return benchFile

def benchSynthFile(Key,plainT,cipherT):
	benchSynthFile = tools.myRead("../Simon_Base_64_128/synth/bench_top_synth.vhd")
	benchSynthFile = tools.substituteString(r"\"1b1a1918131211100b0a090803020100\"", "\"" + Key + "\"", benchSynthFile)
	benchSynthFile = tools.substituteString(r"\"656b696c20646e75\"", "\""+ plainT +"\"", benchSynthFile)
	benchSynthFile = tools.substituteString(r"\"44c8fc20b9dfa07\"", "\""+ cipherT + "\"", benchSynthFile)
	return benchSynthFile

def compileVHD(dSize,kSize):
	compileVHDFile = tools.myRead("../Simon_Base_64_128/vhd/compile_vhd.sh")
	compileVHDFile = tools.substituteString(r"Simon_Base_64_128", r"Simon_IPs/Simon_" + str(dSize) + "_" + str(kSize), compileVHDFile)
	return compileVHDFile

def compileBench(dSize,kSize):
	compileBenchFile = tools.myRead("../Simon_Base_64_128/bench/compile_bench.sh")
	compileBenchFile = tools.substituteString(r"Simon_Base_64_128", r"Simon_IPs/Simon_"+str(dSize)+"_"+str(kSize), compileBenchFile)
	return compileBenchFile

def compileSynth(dSize,kSize):
	compileSynthFile = tools.myRead("../Simon_Base_64_128/synth/compile_synth.sh")
	compileSynthFile = tools.substituteString(r"Simon_Base_64_128", r"Simon_IPs/Simon_"+str(dSize)+"_"+str(kSize), compileSynthFile)
	return compileSynthFile
