#ifndef SIMON_H
#define SIMON_H

#include <gmpxx.h>
#include <vector>
#include <string>

using std::string;

class Simon
{
   unsigned int NumRounds;
   unsigned int ZSequence;

   // set internal constant
   void unsupported_conf(void);
   void define_constants(void);

   // Round sub keys
   void setRoundKeys (void);
   static const unsigned int Z[5][62];

   mpz_class Key_mod;
   mpz_class Block_mod;
   mpz_class Word_mod;

   mpz_class key;
   mpz_class plaintext;
   mpz_class ciphertext;

   // L/R variables
   mpz_class l,r;
   // Unrolled round keys
   std::vector<mpz_class> K;


   public:
   // constructors
   Simon(unsigned int bs=64, unsigned int ks=96);
   Simon(unsigned int bs,    unsigned int ks, const char *k);
   Simon(unsigned int bs,    unsigned int ks, const string &k);

   // cipher
   string cipher();

   //  C/C++ string interface
   void setKey(const char *k);
   void setClearText(const char *t);

   string cipher(const char * t);
   string cipher(const string &t);

   // Raw interface
   // Raw means a stream of consecutive bytes
   void   setRawKey      (const void *k, const size_t s, const size_t bs);
   void   setRawPlaintext(const void *t, size_t s, const size_t bs);
   void   getRawCipher   (      void *t, const size_t s, const size_t bs);

   // Constants we could have read access to
   const unsigned int BlockSize;
   const unsigned int KeySize;
   const unsigned int WordSize;
   const unsigned int KeyWords;
};

#endif
