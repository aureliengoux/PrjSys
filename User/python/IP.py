import tools, params, gui
import substitute
import os, os.path
from os import path

def createWorkSpace(dSize,kSize):
	IPsimon = "Simon_"+str(dSize)+"_"+str(kSize)
	IPpath = "$SIMON_WORKSPACE/Simon_IPs/"

	if os.path.isdir(os.environ["SIMON_WORKSPACE"]+"/Simon_IPs/"+IPsimon):
		os.system("rm -r -f " + os.environ["SIMON_WORKSPACE"]+"/Simon_IPs/"+IPsimon) 
	if not os.path.isdir(os.environ["SIMON_WORKSPACE"]+"/Simon_IPs/"):
		os.system("mkdir "+IPpath)
	os.system("mkdir "+IPpath+IPsimon) #Owerwrite IP base folder
	os.system("mkdir "+IPpath+IPsimon+"/vhd") #create IP description folders
	os.system("mkdir "+IPpath+IPsimon+"/bench") 
	os.system("mkdir "+IPpath+IPsimon+"/synth") 

def createIP(dSize,kSize):
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
		tools.myWrite(substitute.constFile(dSize, wNb, rNb, z), os.environ['SIMON_WORKSPACE']+"/Simon_IPs/"+IPsimon+"/vhd/const.vhd")
		tools.myWrite(substitute.roundFile(wNb,rNb), os.environ['SIMON_WORKSPACE']+"/Simon_IPs/"+IPsimon+"/vhd/round.vhd")
		tools.myWrite(substitute.fsmFile(rNb), os.environ['SIMON_WORKSPACE']+"/Simon_IPs/"+IPsimon+"/vhd/fsm.vhd")
		tools.myWrite(substitute.topFile(rNb), os.environ['SIMON_WORKSPACE']+"/Simon_IPs/"+IPsimon+"/vhd/top.vhd")
		tools.myWrite(substitute.benchFile(Key,plainT,cipherT), os.environ['SIMON_WORKSPACE']+"/Simon_IPs/"+IPsimon+"/bench/bench_top.vhd")
		tools.myWrite(substitute.benchSynthFile(Key,plainT,cipherT), os.environ['SIMON_WORKSPACE']+"/Simon_IPs/"+IPsimon+"/synth/bench_top_synth.vhd")
		print "Simon IP [%s,%s] generated" %(dSize,kSize)
	else :
		print "unavailable to generate requested IP"

def createIPGui():
	IPsizes = gui.launchGUI()
	dSize = IPsizes[0]
	kSize = IPsizes[1]
	createIP(dSize,kSize)

def createAll():
	for dSize in params.IPparams:
		for kSize in params.IPparams[dSize]:
			createIP(dSize,kSize)
