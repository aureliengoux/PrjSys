import tools, params
import generate, substitute
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
		Key = IPparams['Key']
		plainT = IPparams['Plaintext']
		cipherT = IPparams['Ciphertext']
		tools.myWrite(substitute.constFile(dSize, wNb, rNb, z), "../Simon_IPs/"+IPsimon+"/vhd/const.vhd")
		tools.myWrite(substitute.roundFile(wNb,rNb), "../Simon_IPs/"+IPsimon+"/vhd/round.vhd")
		tools.myWrite(substitute.counterFile(rNb), "../Simon_IPs/"+IPsimon+"/vhd/counter.vhd")
		tools.myWrite(substitute.topFile(rNb), "../Simon_IPs/"+IPsimon+"/vhd/top.vhd")

		tools.myWrite(substitute.benchFile(Key,plainT,cipherT), "../Simon_IPs/"+IPsimon+"/bench/bench_top.vhd")
		tools.myWrite(substitute.benchSynthFile(Key,plainT,cipherT), "../Simon_IPs/"+IPsimon+"/synth/bench_top_synth.vhd")

		tools.myWrite(substitute.compileVHD(dSize,kSize), "../Simon_IPs/"+IPsimon+"/vhd/compile_vhd.sh")
		tools.myWrite(substitute.compileBench(dSize,kSize), "../Simon_IPs/"+IPsimon+"/bench/compile_bench.sh")
		tools.myWrite(substitute.compileSynth(dSize,kSize), "../Simon_IPs/"+IPsimon+"/synth/compile_synth.sh")
		print "Simon IP [%s,%s] generated" %(dSize,kSize)
	else :
		print "unavailable to write requested IP description"

def createAllIP():
	for dSize in params.IPparams:
		for kSize in params.IPparams[dSize]:
			createIP(dSize,kSize)
	

