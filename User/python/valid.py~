#from colorama import colored
#from termcolor import colored
import tools, params
import os, os.path
import re

def isValid(filename):
	fileContent = tools.myRead(filename)
	if re.search("test pass", fileContent):
		valid = True
	else:
		valid = False
	return valid

def validBenchIP(dSize,kSize):	
	IPsimon = "Simon_"+str(dSize)+"_"+str(kSize)	
	IPparams = tools.setIPparams(dSize, kSize)	
	if IPparams :
		if os.path.isdir(os.environ['SIMON_WORKSPACE']+"/Simon_IPs/"+IPsimon):
			os.chdir(os.environ['SIMON_WORKSPACE']+"/Simon_IPs/"+IPsimon+"/bench")
			os.system("pwd")
			os.system("./valid_IP.sh")			
			if isValid("transcript"):
				print "Generated IP " + IPsimon + " is valid"#, ("valid", "green")
			else :
				print "Generated IP " + IPsimon + " is unvalid"#, ("unvalid","red")
        
		else :
			print " *** Warning *** No transcript file found : launch a simulation for " + IPsimon + " IP" 
		return isValid("transcript")

def validSynthIP(dSize,kSize):
	IPsimon = "Simon_"+str(dSize)+"_"+str(kSize)	
	IPparams = tools.setIPparams(dSize, kSize)	
	if IPparams :
		if os.path.isdir(os.environ['SIMON_WORKSPACE']+"/Simon_IPs/"+IPsimon):
			os.chdir(os.environ['SIMON_WORKSPACE']+"/Simon_IPs/"+IPsimon+"/synth")
			os.system("./valid_IP.sh")			
			if isValid("transcript"):
				print "Generated IP " + IPsimon + " is valid"#, ("valid", "green")
			else :
				print "Generated IP " + IPsimon + " is unvalid"#, ("unvalid","red")
        
		else :
			print " *** Warning *** No transcript file found : launch a simulation for " + IPsimon + " IP" 
		return isValid("transcript")

def validBenchAll():
	nbValid = 0
	unvalid_IP=[]
	for dSize in params.IPparams:
		for kSize in params.IPparams[dSize]:      
			if validBenchIP(dSize,kSize):
				nbValid = nbValid + 1
			else:
 			  unvalid_IP.append((dSize,kSize))
	print str(nbValid) + "/10 IP validated" 
	print "unvalid IP are:" 
	print unvalid_IP

def validSynthAll():
	nbValid = 0
	unvalid_IP=[]
	for dSize in params.IPparams:
		for kSize in params.IPparams[dSize]:      
			if validSynthIP(dSize,kSize):
				nbValid = nbValid + 1
			else:
 			  unvalid_IP.append((dSize,kSize))
	print str(nbValid) + "/10 IP validated" 
	print "unvalid IP are:" 
	print unvalid_IP		

