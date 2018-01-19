import params #
import re 		#

def myRead(filename):
	file = open(filename, 'r')
	content = file.read()
	file.close()
	return content
	
def myWrite(myString,filename):
	file = open(filename, 'w')
	file.write(myString)
	file.close()

def substituteString(matchString,subsString,inputString):
	return re.sub(matchString,subsString,inputString)

def setIPparams(dataSize, keySize):
	try:
		return params.IPparams[dataSize][keySize]
	except KeyError:
		print "invalid parameters : available are : \
		\n(32,64)\
		\n(48,72),(48,96)\
		\n(64,96),(64,128)\
		\n(96,96),(96,144)\
		\n(128,128),(128,192),(128,256)"


