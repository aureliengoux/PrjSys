/**********************************************************
 * File Name   : top.sv
 * Description : TRNG/PUF TestChip top level.
 *               This module instantiates the uart interface
 *               and the sub IPs.
 *               Some glue logic for bus multiplexing and
 *               asynchronous reset resynchronization is
 *               also present at that level.
 * Author      : T. Graba (Telecom ParisTECH)
 * Licence     : This code is distributed 'as is' without
 *               any warranty.You are free to use it and
 *               redistribute it under what ever condition
 *               you want.
 *********************************************************/

module top (
    // System Signals
    input  wire clk,
    input  wire n_reset,
    // UART signals
    input  wire uart_rxd,
    output wire uart_txd,
    // Trigger signal
    output wire trigger
    );

// UART clock and baud rate
parameter   UART_CLK_FREQ = 24_000_000;
parameter   UART_BAUD     = 115_200;

// internal signals
reg [7:0] rdata;
wire[7:0] wdata;
wire[6:0] addr ;
wire      write;
// read_ack not used !!
wire      read_ack;

// Asynchronous reset resynchronization
reg    s_n_reset_, s_n_reset;

always@(posedge clk or negedge n_reset)
if (!n_reset) begin
    s_n_reset_ <= 1'b0;
    s_n_reset  <= 1'b0;
end else begin
    s_n_reset_ <= 1'b1;
    s_n_reset  <= s_n_reset_;
end

// Uart interface
uart_interface #(
    .UART_CLK_FREQ ( UART_CLK_FREQ ),
    .UART_BAUD     ( UART_BAUD     )    
)
uart_inst
(
    // System Signals
    .n_reset ( s_n_reset ),
    .clk     ( clk      ),
    // UART signals,
    .uart_rxd     ( uart_rxd ),
    .uart_txd     ( uart_txd ),
    // System Interface,
    .rdata        ( rdata    ),
    .wdata        ( wdata    ),
    .addr         ( addr     ),
    .write        ( write    ),
    .read_ack     ( read_ack )
);

// internal registers
`include "../src/register_map.hsv"
reg [7:0][7:0] plaintext;
reg [7:0][7:0] cipher_r;
reg [11:0][7:0] key;

reg        start;

// Result from ciphertext
wire        eoc;
wire [63:0] ciphertext;

always@(posedge clk or negedge s_n_reset)
if (!s_n_reset) begin
   plaintext <= 64'd0;
   cipher_r  <= 64'd0;
   key       <= 96'd0;
   start     <= 0;
end else begin
   start <= 0;
   if (write) begin
      case(addr)
         REG_PTEXT_0 : plaintext[0] <= wdata;
         REG_PTEXT_1 : plaintext[1] <= wdata;
         REG_PTEXT_2 : plaintext[2] <= wdata;
         REG_PTEXT_3 : plaintext[3] <= wdata;
         REG_PTEXT_4 : plaintext[4] <= wdata;
         REG_PTEXT_5 : plaintext[5] <= wdata;
         REG_PTEXT_6 : plaintext[6] <= wdata;
         REG_PTEXT_7 : plaintext[7] <= wdata;
         REG_KEY_00  : key      [0] <= wdata;
         REG_KEY_01  : key      [1] <= wdata;
         REG_KEY_02  : key      [2] <= wdata;
         REG_KEY_03  : key      [3] <= wdata;
         REG_KEY_04  : key      [4] <= wdata;
         REG_KEY_05  : key      [5] <= wdata;
         REG_KEY_06  : key      [6] <= wdata;
         REG_KEY_07  : key      [7] <= wdata;
         REG_KEY_08  : key      [8] <= wdata;
         REG_KEY_09  : key      [9] <= wdata;
         REG_KEY_10  : key     [10] <= wdata;
         REG_KEY_11  : key     [11] <= wdata;
         REG_START   : start <= 1;
      endcase
      end
// Latch the ciphertext text when eoc
   if (eoc)
      cipher_r <= ciphertext;
end

// Data to be sent back
always@( * )
begin
      rdata = 8'd0;
      case(addr)
         REG_PTEXT_0  : rdata = plaintext[0] ;
         REG_PTEXT_1  : rdata = plaintext[1] ;
         REG_PTEXT_2  : rdata = plaintext[2] ;
         REG_PTEXT_3  : rdata = plaintext[3] ;
         REG_PTEXT_4  : rdata = plaintext[4] ;
         REG_PTEXT_5  : rdata = plaintext[5] ;
         REG_PTEXT_6  : rdata = plaintext[6] ;
         REG_PTEXT_7  : rdata = plaintext[7] ;
         REG_CIPHER_0 : rdata = cipher_r [0] ;
         REG_CIPHER_1 : rdata = cipher_r [1] ;
         REG_CIPHER_2 : rdata = cipher_r [2] ;
         REG_CIPHER_3 : rdata = cipher_r [3] ;
         REG_CIPHER_4 : rdata = cipher_r [4] ;
         REG_CIPHER_5 : rdata = cipher_r [5] ;
         REG_CIPHER_6 : rdata = cipher_r [6] ;
         REG_CIPHER_7 : rdata = cipher_r [7] ;
         REG_KEY_00   : rdata = key      [0] ;
         REG_KEY_01   : rdata = key      [1] ;
         REG_KEY_02   : rdata = key      [2] ;
         REG_KEY_03   : rdata = key      [3] ;
         REG_KEY_04   : rdata = key      [4] ;
         REG_KEY_05   : rdata = key      [5] ;
         REG_KEY_06   : rdata = key      [6] ;
         REG_KEY_07   : rdata = key      [7] ;
         REG_KEY_08   : rdata = key      [8] ;
         REG_KEY_09   : rdata = key      [9] ;
         REG_KEY_10   : rdata = key     [10] ;
         REG_KEY_11   : rdata = key     [11] ;
      endcase
end

simon 
inst_simon  (
             .clk       ( clk        ) ,
             .nrst      ( s_n_reset  ) ,
             .trigger   ( trigger    ) ,
             .start     ( start      ) ,
             .eoc       ( eoc        ) ,
             .plaintext ( plaintext  ) ,
             .key       ( key        ) ,
             .ciphertext( ciphertext )
        );

endmodule
