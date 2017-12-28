module simon(
                 clk,
                 nrst,
                 trigger,
                 start,
                 eoc,
                 plaintext,
                 key,
                 ciphertext
                );

import simon_pkg::data_t;
import simon_pkg::key_t;
import simon_pkg::rkey_t;


// inputs
input  clk;
input  nrst;
output trigger;
input  start;
output eoc;
input  data_t  plaintext;
input  key_t  key;
output data_t  ciphertext;

// internals
wire      compute;
rkey_t    rkey;

assign trigger = compute;


simon_dp dp_i     (
                    .clk        ( clk        ) ,
                    .nrst       ( nrst       ) ,
                    .plaintext  ( plaintext  ) ,
                    .compute    ( compute    ) ,
                    .rkey       ( rkey       ) ,
                    .ciphertext ( ciphertext )
                  );

simon_ks ks_i     (
                    .clk        ( clk      ) ,
                    .nrst       ( nrst     ) ,
                    .key        ( key      ) ,
                    .start      ( start    ) ,
                    .compute    ( compute  ) ,
                    .rkey       ( rkey     )
                  );

simon_ctrl ctrl_i (
                    .clk     ( clk     ) ,
                    .nrst    ( nrst    ) ,
                    .start   ( start   ) ,
                    .eoc     ( eoc     ) ,
                    .compute ( compute )
                   );
endmodule
