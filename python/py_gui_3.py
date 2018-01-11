from Tkinter import *
import tkinter.messagebox
import tkinter.simpledialog

key_lengh_list={64,72,92,96,128,144,196,256}
plaintext_lengh_list={32,48,64,96,128}


root = Tk()
w=Label(root,text="Simon_IP")
w.pack()
#tkinter.messagebox.showinfo("welcome to Simon Ip generator V1.0")

key_lengh = tkinter.simpledialog.askinteger("Simon Ip generator V1.0","please enter the key lengh")
print (key_lengh in key_lengh_list)
while not (key_lengh in key_lengh_list) :
        tkinter.messagebox.showerror("Simon Ip generator V1.0","key lengh error")
        key_lengh = tkinter.simpledialog.askinteger("Simon Ip generator V1.0","please enter the key lengh")

        
plaintext_lengh = tkinter.simpledialog.askinteger("Simon Ip generator V1.0","please enter the plaintext lengh")

while not (plaintext_lengh in plaintext_lengh_list) :
        tkinter.messagebox.showerror("Simon Ip generator V1.0","plaintext lengh error")
        plaintext_lengh = tkinter.simpledialog.askinteger("Simon Ip generator V1.0","please enter the plaintext lengh")

print (key_lengh,plaintext_lengh)

word_size=plaintext_lengh/2
nb_words=key_lengh/word_size

print (word_size,nb_words)

root.wait_window()
