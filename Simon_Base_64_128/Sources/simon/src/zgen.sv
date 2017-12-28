/*
* LFSR MATRIXES
*
*     |0 1 0 0 0|     |0 1 1 0 0|     |0 1 0 0 0|
*     |0 0 1 0 0|     |0 0 1 0 0|     |0 0 1 0 0|
* U = |1 0 0 1 0| V = |1 0 0 1 0| W = |1 0 0 1 0|
*     |0 0 0 0 1|     |0 0 0 0 1|     |0 0 0 0 1|
*     |1 0 0 0 1|     |1 0 0 0 0|     |1 0 0 0 0|
*
*/

module zgen (
         input clk, nrst, start, compute,
         output z
         );

import simon_pkg::CONST_SEQ;

function [4:0] MatrixU ( input [4:0] u);
   return {u[3], u[2], u[1]^u[4], u[0], u[4]^u[0]};
endfunction

function [4:0] MatrixV ( input [4:0] v);
   return {v[3]^v[2], v[2], v[1]^v[4], v[0], v[4]};
endfunction

function [4:0] MatrixW ( input [4:0] w);
   return {w[3], w[2], w[1]^w[4], w[0], w[4]};
endfunction

wire u_i,v_i,w_i;

reg [4:0] U,V,W;
reg t;

wire [4:0] Z;

always@(posedge clk or negedge nrst)
if(~nrst)
begin
   // initial shift registers value
   U <= 5'b00001;
   V <= 5'b00001;
   W <= 5'b00001;
   // t flipflop
   t <= 0;
end
else
begin
   if(start)
   begin
      // initial shift registers value
      U <= 5'b00001;
      V <= 5'b00001;
      W <= 5'b00001;
      // t flipflop
      t <= 0;
   end
   if (compute)
   begin
      // LFSR generator matrix multiplication
      U <= MatrixU(U);
      V <= MatrixV(V);
      W <= MatrixW(W);
      // t flipflip
      t <= ~t;
   end
end

// The output is the bit 0 of the LFS
//
assign u_i = U[0];
assign v_i = V[0];
assign w_i = W[0];

// The pseudo random sequences that are used in the key schedule
assign Z[0] = u_i;
assign Z[1] = v_i;
assign Z[2] = u_i ^ t;
assign Z[3] = v_i ^ t;
assign Z[4] = w_i ^ t;

assign z = Z[CONST_SEQ];
endmodule
