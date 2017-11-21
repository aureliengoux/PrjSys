module simon_algo (
                  );

import simon_pkg::*;

data_t ciphertext;
key_t Kreg = 0;
rkey_t rkey;

assign rkey = Kreg[0];

logic [0:61] Z [5] = '{
   {63'b11111010001001010110000111001101111101000100101011000011100110},
   {63'b10001110111110010011000010110101000111011111001001100001011010},
   {63'b10101111011100000011010010011000101000010001111110010110110011},
   {63'b11011011101011000110010111100000010010001010011100110100001111},
   {63'b11010001111001101011011000100000010111000011001010010011101111}
};



// data
data_t Dreg;
data_t Dnext;

// The output is the data register
assign ciphertext =  Dreg;


initial
begin
    Dreg   = 'h1;
    for (int i = 0; i<N_ROUNDS; i++ )
    begin
       #10;
       Dreg = Round( Dreg, rkey );
       Kreg = KSCH ( Kreg, Z[CONST_SEQ][i]);
    end
end

initial
   $monitor("%h",Dreg);

endmodule
