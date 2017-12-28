#include <iostream>
#include <cstdlib>
#include <cassert>
#include "Simon.h"

//#define VERBOSE

// Should be able to write the lfsr...
const unsigned int Simon::Z[5][62] = {
   {1,1,1,1,1,0,1,0,0,0,1,0,0,1,0,1,0,1,1,0,0,0,0,1,1,1,0,0,1,1,0,1,1,1,1,1,0,1,0,0,0,1,0,0,1,0,1,0,1,1,0,0,0,0,1,1,1,0,0,1,1,0},
   {1,0,0,0,1,1,1,0,1,1,1,1,1,0,0,1,0,0,1,1,0,0,0,0,1,0,1,1,0,1,0,1,0,0,0,1,1,1,0,1,1,1,1,1,0,0,1,0,0,1,1,0,0,0,0,1,0,1,1,0,1,0},
   {1,0,1,0,1,1,1,1,0,1,1,1,0,0,0,0,0,0,1,1,0,1,0,0,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,1,0,0,0,1,1,1,1,1,1,0,0,1,0,1,1,0,1,1,0,0,1,1},
   {1,1,0,1,1,0,1,1,1,0,1,0,1,1,0,0,0,1,1,0,0,1,0,1,1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0,1,0,1,0,0,1,1,1,0,0,1,1,0,1,0,0,0,0,1,1,1,1},
   {1,1,0,1,0,0,0,1,1,1,1,0,0,1,1,0,1,0,1,1,0,1,1,0,0,0,1,0,0,0,0,0,0,1,0,1,1,1,0,0,0,0,1,1,0,0,1,0,1,0,0,1,0,0,1,1,1,0,1,1,1,1}
};


// Constructor without key
Simon::Simon(unsigned int bs, unsigned int ks):
   BlockSize(bs),KeySize(ks),WordSize(bs/2),KeyWords(ks/(bs/2))
{
   define_constants();
}

// Constructor with key C style
Simon::Simon(unsigned int bs, unsigned int ks, const char *k):
   BlockSize(bs),KeySize(ks),WordSize(bs/2),KeyWords(ks/(bs/2))
{
   define_constants();
   setKey(k);
}

// Constructor with key C++ string
Simon::Simon(unsigned int bs, unsigned int ks, const string &k):
   BlockSize(bs),KeySize(ks),WordSize(bs/2),KeyWords(ks/(bs/2))
{
   define_constants();
   setKey(k.c_str());
}

// In case on unsupported data/key scheme
void Simon::unsupported_conf(void)
{
   std::cerr 
      << "Error: Simon : "
      << "Unsupported block/key sizes configuration"
      << " (" << BlockSize << "," << KeySize << ")"
      << std::endl;
   exit(-1);
}


// At construction, depending on the data/key scheme define the other constants
// ie. the number of rounds, the pseudo random sequence to use and some other
// useful things
void Simon::define_constants()
{
   switch(BlockSize)
   {
      case 32:
         switch (KeySize) {
            case 64: ZSequence = 0; NumRounds = 32; break;
            default: unsupported_conf();
         }
         break;
      case 48:
         switch (KeySize) {
            case 72: ZSequence = 0; NumRounds = 36; break;
            case 96: ZSequence = 1; NumRounds = 36; break;
            default: unsupported_conf();
         }
         break;
      case 64:
         switch (KeySize) {
            case 96 : ZSequence = 2; NumRounds = 42; break;
            case 128: ZSequence = 3; NumRounds = 44; break;
            default: unsupported_conf();
         }
         break;
      case 96:
         switch (KeySize) {
            case 96 : ZSequence = 2; NumRounds = 52; break;
            case 144: ZSequence = 3; NumRounds = 54; break;
            default: unsupported_conf();
         }
         break;
      case 128:
         switch (KeySize) {
            case 128: ZSequence = 2; NumRounds = 68; break;
            case 192: ZSequence = 3; NumRounds = 69; break;
            case 256: ZSequence = 4; NumRounds = 72; break;
            default: unsupported_conf();
         }
         break;
      default:
         unsupported_conf();
   }

   mpz_ui_pow_ui(Key_mod.get_mpz_t(),2,KeySize);
   mpz_ui_pow_ui(Block_mod.get_mpz_t(),2,BlockSize);
   mpz_ui_pow_ui(Word_mod.get_mpz_t(),2,WordSize);

#ifdef VERBOSE
   std::cout << "Simon with "
      << "  " << BlockSize
      << "  " << KeySize
      << "  " << WordSize
      << "  " << KeyWords
      << "  " << ZSequence
      << "  " << NumRounds
      << "  " << std::endl;
   std::cout << "key modulo " << std::hex << Key_mod << std::endl;
   std::cout << "Block modulo " << std::hex << Block_mod << std::endl;
#endif
}

// Macro for left and right circular shifts
#define lshift(X,i) ( ( (X<<i)|(X>> (WordSize-i)) ) % Word_mod )
#define rshift(X,i) ( ( (X<< (WordSize-i)) | (X>>i)) % Word_mod )


// Computes the keys for all the cipher rounds
void Simon::setRoundKeys()
{
   mpz_class t_k;

   // X = ~Y^3 <=> X = Y^(1<<sizeof(Y)-4) 
   mpz_class Nxor3;
   Nxor3 = Word_mod-4;

   // Unroll the key
   t_k = key % Key_mod;

   // the first round keys correspond to the input key
   for (int i=0; i<KeyWords; i++)
   {
      K.push_back(t_k % Word_mod);
      t_k = t_k / Word_mod;
   }
   for (int i=KeyWords; i<NumRounds; i++)
   {
      t_k = rshift(K[i-1],3);
      if (KeyWords == 4) t_k = t_k ^ K[i-3];
      t_k = t_k ^ rshift(t_k,1);
      t_k = K[i-KeyWords]^t_k^Z[ZSequence][(i-KeyWords)%62]^Nxor3;
      K.push_back(t_k);
   }
};

void Simon::setKey(const char *k)
{
   key = k;
   setRoundKeys();
}

// Change the clear text
void Simon::setClearText(const char *t)
{
   plaintext = t;
   plaintext = plaintext % Block_mod;
};

// Cipher and returns the result in hex as a C++ string
string Simon::cipher()
{
   mpz_class tmp;
   r = plaintext % Word_mod;
   l = plaintext >> WordSize;

   for (int i=0; i<NumRounds; i++)
   {
      tmp = lshift(l,1) & lshift(l,8) ^ lshift(l,2);
      r = r ^ tmp ^ K[i];
      std::swap(l,r);
   }

#ifdef VERBOSE
   // The result is ready
   std::cout << "cipher ( " << l << " , " << r << " )" << std::endl;
#endif

   ciphertext = (l<<WordSize) | r;

   return ("0x"+ciphertext.get_str(16));
}

string Simon::cipher(const char* t)
{
   setClearText(t);
   return (cipher());
}

string Simon::cipher(const string &t)
{
   setClearText(t.c_str());
   return (cipher());
}

void   Simon::setRawKey(const void *k, const size_t s, const size_t bs)
{
   assert (s*bs*8 == KeySize);

   mpz_import (
         key.get_mpz_t(), // where do we put the imported data
         s,               // how much words
         -1,              // order (lsb word first)
         bs,              // size of the word
         0,               // endiannes
         0,               // nails (use full words)
         k                // what do we import
         );


   setRoundKeys();
#ifdef VERBOSE
   std::cout << "Key set to " << key.get_str(16) << std::endl;
#endif
}

void   Simon::setRawPlaintext(const void *t, const size_t s, const size_t bs)
{
   assert (s*bs*8 == BlockSize);

   mpz_import (
         plaintext.get_mpz_t(), // where do we put the imported data
         s,               // how much words
         -1,              // order (lsb word first)
         bs,              // size of the word
         0,               // endiannes
         0,               // nails (use full words)
         t                // what do we import
         );
#ifdef VERBOSE
   std::cout << "Plain text set to " << plaintext.get_str(16) << std::endl;
#endif
}

void Simon::getRawCipher(void *t, const size_t s, const size_t bs)
{
   // The caller must allow enaugh space to hold the ciphertext
   assert (s*bs*8 >= BlockSize);
   // export the ciphertext as a raw byte array
   mpz_export (t,
         NULL,   // number of words produced
         -1,     // order (lsb word first)
         bs,     // word size 
         0,      // use native endianness
         0,      // "nails" - produce full "words"
         ciphertext.get_mpz_t()
         );
}
