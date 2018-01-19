from Tkinter import *
import tkMessageBox
import tkSimpleDialog
#from tkinter import SimpleDialog
#import tkinter.SimpleDialog

key_lengh_list={64,72,92,96,128,144,196,256}
plaintext_lengh_list={32,48,64,96,128}

def launchGUI():
	root = Tk()
	w=Label(root,text="Simon_IP")
	w.pack()
	#tkMessageBox.showinfo("welcome to Simon Ip generator V1.0")

	key_lengh = tkSimpleDialog.askinteger("Simon Ip generator V1.0","please enter the key lengh")
	print (key_lengh in key_lengh_list)
	while not (key_lengh in key_lengh_list) :
		      tkMessageBox.showerror("Simon Ip generator V1.0","key lengh error")
		      key_lengh = tkSimpleDialog.askinteger("Simon Ip generator V1.0","please enter the key lengh")

		      
	plaintext_lengh = tkSimpleDialog.askinteger("Simon Ip generator V1.0","please enter the plaintext lengh")
	while not (plaintext_lengh in plaintext_lengh_list) :
		      tkMessageBox.showerror("Simon Ip generator V1.0","plaintext lengh error")
		      plaintext_lengh = tkSimpleDialog.askinteger("Simon Ip generator V1.0","please enter the plaintext lengh")

	print (plaintext_lengh,key_lengh)

	#word_size=plaintext_lengh/2
	#nb_words=key_lengh/word_size

	#print (word_size,nb_words)

	#root.wait_window()

	return [plaintext_lengh,key_lengh]
