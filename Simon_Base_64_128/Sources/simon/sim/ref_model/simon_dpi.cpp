#include "svdpi.h"
#include "Simon.h"


#define EXTERNC extern "C"

// largest block size is 128bit for the data and 256 for the key 
// we need an extra position to hold the End Of String character
svBitVecVal raw_cipher [SV_PACKED_DATA_NELEMS(256)];

EXTERNC void  SimonCipher_dpi ( 
                              unsigned int bs, unsigned int ks,
                              const svBitVecVal* key, const svBitVecVal* plaintext,
                              svBitVecVal* ciphertext
                              )
{
   Simon simon(bs,ks);

   simon.setRawKey(key, SV_PACKED_DATA_NELEMS(ks), sizeof(svBitVecVal));
   simon.setRawPlaintext(plaintext, SV_PACKED_DATA_NELEMS(bs), sizeof(svBitVecVal));

   simon.cipher();

   simon.getRawCipher(ciphertext, SV_PACKED_DATA_NELEMS(bs),sizeof(svBitVecVal));
}
