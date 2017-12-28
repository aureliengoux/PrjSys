module simon_ks (
                    clk,
                    nrst,
                    key,
                    start,
                    compute,
                    rkey
                  );

import simon_pkg::*;

input  clk;
input  nrst;
input  start;
input  compute;
input  key_t key;
output rkey_t rkey;

wire z;

// key
key_t Kreg;
key_t Knext;

// The partial round key
assign rkey = Kreg[0];

// Pseudo random sequence generator
zgen zgen_inst (.clk(clk), .nrst(nrst), .start(start), .compute(compute), .z(z));


// Key register
always@(posedge clk or negedge nrst)
if (~nrst)
    Kreg   <= '0;
else
    Kreg <= Knext;


// The next value of the key register
//   - if we are not computing we load the initial key
//   - else we advance the key schedule
 always_comb
 begin:compute_nextK
    logic [WORD_SIZE-1:0] tmp ;
    if (!compute)
       Knext = key ;
    else
    begin
      tmp =  Kreg[KEY_WORDS-1];
       // Rotate right 3 the leftmost part of the key
      tmp  = { tmp[2:0], tmp[WORD_SIZE-1:3] };
      // Xor with the tmp rotated right by right by one position
      tmp =  tmp ^ { tmp[0],   tmp[WORD_SIZE-1:1] };
      // Xor with rightmost part of the key and the pseudo random sequence
      tmp = ~Kreg[0] ^ tmp ^ z ^ 'h3;
      // replace the left formost part of the key
      Knext = { tmp, Kreg[KEY_WORDS-1:1] };
    end
 end

endmodule
