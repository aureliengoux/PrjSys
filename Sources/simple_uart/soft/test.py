#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Pour accéder au port série
import serial

# On ouvre le port série
ser = serial.Serial('/dev/ttyS0',115200,xonxoff=0, rtscts=0,bytesize=8, parity='N', stopbits=1)
ser.open()
# ser.isOpen() pour tester s'il est vraiment ouvert

# Les adresses des différents registres
import regs

# Des fonctions pour la communication avec le FPGA
# On pourrait les mettre dans un paquetage ou les encapsuler

def write (data, addr):
   # pour une écriture, le bit de poids fort doit être 0
   ser.write(chr( addr & ~0x80))
   ser.write(chr( data ))

def read (addr):
   # pour une écriture, le bit de poids fort doit être 1
   ser.write(chr( addr | 0x80))
   # On le circuit est supposé répondre, on relit donc sa réponse
   return ord(ser.read()) 

# une fonction pour extraire un octet particulier
def byte (val, index):
   return ((val>>(8*index)) & 0xff)


# Le bloc de donnée à chiffrer (plaintext) et la clé
pText = 0x6f7220676e696c63
Key   = 0x131211100b0a090803020100


# On charge le plaintext
write(byte(pText,0), regs.REG_PTEXT_0)
write(byte(pText,1), regs.REG_PTEXT_1)
write(byte(pText,2), regs.REG_PTEXT_2)
write(byte(pText,3), regs.REG_PTEXT_3)
write(byte(pText,4), regs.REG_PTEXT_4)
write(byte(pText,5), regs.REG_PTEXT_5)
write(byte(pText,6), regs.REG_PTEXT_6)
write(byte(pText,7), regs.REG_PTEXT_7)

# On charge la clé
write(byte(Key, 0), regs.REG_KEY_00)
write(byte(Key, 1), regs.REG_KEY_01)
write(byte(Key, 2), regs.REG_KEY_02)
write(byte(Key, 3), regs.REG_KEY_03)
write(byte(Key, 4), regs.REG_KEY_04)
write(byte(Key, 5), regs.REG_KEY_05)
write(byte(Key, 6), regs.REG_KEY_06)
write(byte(Key, 7), regs.REG_KEY_07)
write(byte(Key, 8), regs.REG_KEY_08)
write(byte(Key, 9), regs.REG_KEY_09)
write(byte(Key,10), regs.REG_KEY_10)
write(byte(Key,11), regs.REG_KEY_11)

# On démarre un chiffrement
write(    1 , regs.REG_START)

# On lit le chiffré
cText  =  read(regs.REG_CIPHER_0)
cText  =  read(regs.REG_CIPHER_1) <<  8 | cText
cText  =  read(regs.REG_CIPHER_2) << 16 | cText
cText  =  read(regs.REG_CIPHER_3) << 24 | cText
cText  =  read(regs.REG_CIPHER_4) << 32 | cText
cText  =  read(regs.REG_CIPHER_5) << 40 | cText
cText  =  read(regs.REG_CIPHER_6) << 48 | cText
cText  =  read(regs.REG_CIPHER_7) << 56 | cText


# On imprime
print hex(pText),"+", hex(Key), " --> ",hex(cText) 

# On relâche le port série
ser.close()
