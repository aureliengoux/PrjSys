module simon_tb ();

import simon_tb_pkg::SimonCipher;
import simon_pkg::data_t;
import simon_pkg::key_t;
import simon_pkg::WORD_SIZE;
import simon_pkg::KEY_WORDS;

wire trigger, eoc;

logic clk   = 0;
logic nrst  = 0;
logic start = 0;

data_t plaintext, ciphertext;
key_t key;

simon uut( .* );

// clock
always #10ns clk = !clk;

initial
begin : test_sequence

   data_t ref_ciphertext;

   // reset
   nrst   = 0;
   @(negedge clk);
   @(negedge clk);
   nrst   = 1;
   @(negedge clk);
   // For Simon 64/96   => (32, 3, 2, 42)
   key = 'h131211100b0a090803020100;
   plaintext = 'h6f7220676e696c63;

   repeat(20)
   begin
      start = 1;
      @(negedge clk);
      start = 0;
      forever
      begin
         @(posedge clk)
         if (eoc)
            break;
      end

      ref_ciphertext = SimonCipher( 2*WORD_SIZE, KEY_WORDS*WORD_SIZE, key, plaintext );

      if (ref_ciphertext !== ciphertext) $display("ERROR!");

      $display ("%x (+) %x -> %x %x (ref %x %x)",plaintext, key,
                                                 ciphertext.L, ciphertext.R,
                                                 ref_ciphertext.L, ref_ciphertext.R
                                                 );
      @(negedge clk);
      key = {$random(),$random(),$random()};
      plaintext = {$random(),$random()};
   end

   $finish();
end

initial
   $display(">>> Testing a %3d/%3d Simon configuration <<<",2*WORD_SIZE, KEY_WORDS*WORD_SIZE);

endmodule
