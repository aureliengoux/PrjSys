package simon_tb_pkg;

   // The maximum length is 256 bits for the key and 128 bits for the data
   typedef bit[255:0] bit_array;

   // Import C-DPI wrapper of the Simon C++ reference code
   import "DPI-C" function void SimonCipher_dpi( 
                              int unsigned bs, int unsigned ks,
                              bit_array key, bit_array plaintext,
                              output bit_array ciphertext
                              ) ;

   function bit_array SimonCipher ( int unsigned bs, int unsigned ks, bit_array key, bit_array plaintext );
      bit_array ct;
      begin
         SimonCipher_dpi(bs, ks, key, plaintext, ct);
         return ct ;
      end
   endfunction

endpackage
