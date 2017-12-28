package simon_pkg;

`define SIMON_64_96

`ifdef SIMON_32_64
   localparam WORD_SIZE = 16;
   localparam KEY_WORDS = 4;
   localparam CONST_SEQ = 0;
   localparam N_ROUNDS  = 32;
`elsif SIMON_48_72
   localparam WORD_SIZE = 24;
   localparam KEY_WORDS = 3;
   localparam CONST_SEQ = 0;
   localparam N_ROUNDS  = 36;
`elsif SIMON_48_96
   localparam WORD_SIZE = 24;
   localparam KEY_WORDS = 4;
   localparam CONST_SEQ = 1;
   localparam N_ROUNDS  = 36;
`elsif SIMON_64_96
   localparam WORD_SIZE = 32;
   localparam KEY_WORDS = 3;
   localparam CONST_SEQ = 2;
   localparam N_ROUNDS  = 42;
`elsif SIMON_64_128
   localparam WORD_SIZE = 32;
   localparam KEY_WORDS = 4;
   localparam CONST_SEQ = 3;
   localparam N_ROUNDS  = 44;
`elsif SIMON_96_96
   localparam WORD_SIZE = 48;
   localparam KEY_WORDS = 2;
   localparam CONST_SEQ = 2;
   localparam N_ROUNDS  = 52;
`elsif SIMON_96_128
   localparam WORD_SIZE = 48;
   localparam KEY_WORDS = 3;
   localparam CONST_SEQ = 3;
   localparam N_ROUNDS  = 54;
`elsif SIMON_128_128
   localparam WORD_SIZE = 64;
   localparam KEY_WORDS = 2;
   localparam CONST_SEQ = 2;
   localparam N_ROUNDS  = 68;
`elsif SIMON_128_192
   localparam WORD_SIZE = 64;
   localparam KEY_WORDS = 3;
   localparam CONST_SEQ = 2;
   localparam N_ROUNDS  = 69;
`elsif SIMON_128_256
   localparam WORD_SIZE = 64;
   localparam KEY_WORDS = 4;
   localparam CONST_SEQ = 4;
   localparam N_ROUNDS  = 72;
`endif

localparam  N_BYTES = WORD_SIZE/4 +  (WORD_SIZE*KEY_WORDS)/8; // WORD_SIZE

// Data register type
typedef struct packed {
   logic[WORD_SIZE-1   : 0] L;
   logic[WORD_SIZE-1   : 0] R;
                        } data_t;

// Key register type
typedef logic[KEY_WORDS-1:0][WORD_SIZE-1:0] key_t;

// Round Key type
typedef logic[WORD_SIZE-1:0] rkey_t;


endpackage
