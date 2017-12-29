import tools
import generate
import os, os.path
from os import path

def createWorkSpace(dSize,kSize):
	IPsimon = "Simon_"+str(dSize)+"_"+str(kSize)
	if os.path.isdir("../Simon_IPs/"+IPsimon):
		os.system("rm -r ../Simon_IPs/"+IPsimon) 
	os.system("mkdir ../Simon_IPs/"+IPsimon) #Owerwrite IP base folder
	os.system("mkdir ../Simon_IPs/"+IPsimon+"/vhd") #create IP description folders
	os.system("mkdir ../Simon_IPs/"+IPsimon+"/bench") 
	os.system("mkdir ../Simon_IPs/"+IPsimon+"/synth") 

def createIP(dSize, kSize):
	IPsimon = "Simon_"+str(dSize)+"_"+str(kSize)
	IPparams = tools.setIPparams(dSize,kSize)

	if IPparams :
		createWorkSpace(dSize,kSize)
		wNb = IPparams['wNb']
		rNb = IPparams['rNb']
		z = IPparams['z']
		tools.myWrite(generate.constFile(dSize, wNb, rNb, z), "../Simon_IPs/"+IPsimon+"/vhd/const.vhd")
		tools.myWrite(generate.roundFile(wNb,rNb), "../Simon_IPs/"+IPsimon+"/vhd/round.vhd")
		tools.myWrite(generate.counterFile(rNb), "../Simon_IPs/"+IPsimon+"/vhd/counter.vhd")
		tools.myWrite(generate.topFile(rNb), "../Simon_IPs/"+IPsimon+"/vhd/top.vhd")

		tools.myWrite(generate.benchFile(), "../Simon_IPs/"+IPsimon+"/bench/bench_top.vhd")
		tools.myWrite(generate.benchSynthFile(), "../Simon_IPs/"+IPsimon+"/synth/bench_top_synth.vhd")

		tools.myWrite(generate.compileVHD(), "../Simon_IPs/"+IPsimon+"/vhd/compile_vhd.sh")
		tools.myWrite(generate.compileBench(), "../Simon_IPs/"+IPsimon+"/bench/compile_bench.sh")
		tools.myWrite(generate.compileSynth(), "../Simon_IPs/"+IPsimon+"/synth/compile_synth.sh")
	else :
		print "unavailable to write requested IP description"
	

