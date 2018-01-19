import tools
import os

def constFile(dSize, wNb, rNb, z):
	constFile= tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/vhd/const.vhd")
	constFile = tools.substituteString(r" 64;", r" " + str(dSize) +";",constFile)
	constFile = tools.substituteString(r" 4;", r" " + str(wNb) +";",constFile)
	constFile = tools.substituteString(r" 44;",r" "+ str(rNb) +";",constFile)
	constFile = tools.substituteString("\"(?P<dSize>\d+)\";", "\"" + str(z) +"\";",constFile)

	return constFile
	
def roundFile(wNb,rNb):
	if rNb > 64 :
		cSize = 6		
	else:# rNb > 32:
		cSize = 5
	#else:
	#	cSize = 4

	roundFile = tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/vhd/round.vhd")
	roundFile = tools.substituteString(r"5 downto 0", str(cSize) + r" downto 0", roundFile)
	if wNb<4 :
		roundFile = tools.substituteString(r"signal s3xorkey", r"--signal s3xorkey", roundFile)
		roundFile = tools.substituteString(r"s3_key,s3xorkey,", r"s3_key,", roundFile)
		roundFile = tools.substituteString(r"s3xorkey <=", r"--s3xorkey <=", roundFile)
		roundFile = tools.substituteString(r"s3xorkey\(", r"s3_key(", roundFile)
		roundFile = tools.substituteString(r"s3xorkey xor", r"s3_key xor", roundFile)

	return roundFile

def fsmFile(rNb):
	if rNb > 64 :
		cSize = 6
		reset = "0000000"
		incr = "0000001"
	else :
		cSize = 5
		reset = "000000"
		incr = "000001"

	fsmFile = tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/vhd/fsm.vhd")
	fsmFile = tools.substituteString(r"5 downto 0", str(cSize) + r" downto 0", fsmFile)
	fsmFile = tools.substituteString("\"(?P<dSize>\d+)0\"","\"" + str(reset) +"\"",fsmFile)
	fsmFile = tools.substituteString("\"(?P<dSize>\d+)1\"","\"" + str(incr) +"\"",fsmFile)

	return fsmFile

def topFile(rNb):
	if rNb > 64 :
		cSize = 6		
	else:
		cSize = 5


	topFile = tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/vhd/top.vhd")
	topFile = tools.substituteString(r"5 downto 0", str(cSize) + r" downto 0", topFile)

	return topFile

def benchFile(Key,plainT,cipherT):
	benchFile = tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/bench/bench_top.vhd")
	benchFile = tools.substituteString(r"\"1b1a1918131211100b0a090803020100\"", "\"" + Key + "\"", benchFile)
	benchFile = tools.substituteString(r"\"656b696c20646e75\"", "\""+ plainT + "\"", benchFile)
	benchFile = tools.substituteString(r"\"44c8fc20b9dfa07a\"", "\"" + cipherT + "\"", benchFile)
	return benchFile

def benchSynthFile(Key,plainT,cipherT):
	benchSynthFile = tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/synth/bench_top_synth.vhd")
	benchSynthFile = tools.substituteString(r"\"1b1a1918131211100b0a090803020100\"", "\"" + Key + "\"", benchSynthFile)
	benchSynthFile = tools.substituteString(r"\"656b696c20646e75\"", "\""+ plainT +"\"", benchSynthFile)
	benchSynthFile = tools.substituteString(r"\"44c8fc20b9dfa07a\"", "\""+ cipherT + "\"", benchSynthFile)
	return benchSynthFile

def compileVHD(dSize,kSize):
	compileVHDFile = tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/vhd/compile_vhd.sh")
	compileVHDFile = tools.substituteString(r"Simon_Base_64_128", r"Simon_IPs/Simon_" + str(dSize) + "_" + str(kSize), compileVHDFile)
	return compileVHDFile

def compileBench(dSize,kSize):
	compileBenchFile = tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/bench/compile_bench.sh")
	compileBenchFile = tools.substituteString(r"Simon_Base_64_128", r"Simon_IPs/Simon_"+str(dSize)+"_"+str(kSize), compileBenchFile)
	return compileBenchFile

def compileSynth(dSize,kSize):
	compileSynthFile = tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/synth/compile_synth.sh")
	compileSynthFile = tools.substituteString(r"Simon_Base_64_128", r"Simon_IPs/Simon_"+str(dSize)+"_"+str(kSize), compileSynthFile)
	return compileSynthFile


def simuBenchScript():
	return tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/bench/test.tcl")

def launchSimuBenchScript():
	return tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/bench/valid_IP.sh")

def simuSynthScript():
	return tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/synth/test.tcl")

def launchSimuSynthScript():
	return tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/synth/valid_IP.sh")

def launchSynthScript(dSize,kSize):
	launchSynthFile=tools.myRead(os.environ['SIMON_WORKSPACE']+"/Simon_Base_64_128/synth/autoSynth.tcl")
	launchSynthFile=tools.substituteString(r"Simon_Base_64_128", r"Simon_"+str(dSize)+"_"+str(kSize),launchSynthFile) 
	return launchSynthFile


