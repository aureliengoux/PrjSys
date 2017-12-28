/**********************************************************
 * File Name   : tb_uart_simple.sv
 * Description : TODO
 * Author      : T. Graba (Telecom ParisTECH)
 * Licence     : This code is distributed 'as is' without
 *               any warranty.You are free to use it and
 *               redistribute it under what ever condition
 *               you want.
 *********************************************************/

`timescale 1ns/1ns

module tb_uart_simple();

import simon_tb_pkg::SimonCipher;

`include "sim_includes.hsv"
`include "../src/register_map.hsv"

reg [7:0][7:0]  plaintext;
reg [11:0][7:0] key;
reg [7:0][7:0]  ciphertext;

top uut (
    .n_reset  ( n_reset ) ,
    .clk      ( clk     ) ,
    .uart_rxd ( to_uart ) ,
    .uart_txd ( fr_uart ) ,
    .trigger  ( trigger )
);

// Test Sequence
initial
begin: main_loop
    reg[63:0] ref_ciphertext;
    reg[7:0] rdata;
    // For Simon 64/96   => (32, 3, 2, 42)
    key = 'h131211100b0a090803020100;
    plaintext = 'h6f7220676e696c63;
    #1000;
    n_reset = ! 1'b0;
    repeat(20) begin
    #1000;
    // Write plain text
    WRITE(plaintext[0], REG_PTEXT_0);
    WRITE(plaintext[1], REG_PTEXT_1);
    WRITE(plaintext[2], REG_PTEXT_2);
    WRITE(plaintext[3], REG_PTEXT_3);
    WRITE(plaintext[4], REG_PTEXT_4);
    WRITE(plaintext[5], REG_PTEXT_5);
    WRITE(plaintext[6], REG_PTEXT_6);
    WRITE(plaintext[7], REG_PTEXT_7);
    #1000;
    // Write Key
    WRITE(key[0] , REG_KEY_00);
    WRITE(key[1] , REG_KEY_01);
    WRITE(key[2] , REG_KEY_02);
    WRITE(key[3] , REG_KEY_03);
    WRITE(key[4] , REG_KEY_04);
    WRITE(key[5] , REG_KEY_05);
    WRITE(key[6] , REG_KEY_06);
    WRITE(key[7] , REG_KEY_07);
    WRITE(key[8] , REG_KEY_08);
    WRITE(key[9] , REG_KEY_09);
    WRITE(key[10], REG_KEY_10);
    WRITE(key[11], REG_KEY_11);
    #1000;
    //  Start ciphertext
    WRITE(    1 , REG_START);
    // Read ciphertext text
    READ(REG_CIPHER_0,ciphertext[0]);
    READ(REG_CIPHER_1,ciphertext[1]);
    READ(REG_CIPHER_2,ciphertext[2]);
    READ(REG_CIPHER_3,ciphertext[3]);
    READ(REG_CIPHER_4,ciphertext[4]);
    READ(REG_CIPHER_5,ciphertext[5]);
    READ(REG_CIPHER_6,ciphertext[6]);
    READ(REG_CIPHER_7,ciphertext[7]);

    ref_ciphertext = SimonCipher( 64, 96, key, plaintext );

    if (ref_ciphertext !== ciphertext) $display("ERROR!");

    $display ("%h (+) %h -> %h (%h) @ %t ns",plaintext,key,ciphertext,ref_ciphertext,$time);

    key = {$random(),$random(),$random()};
    plaintext = {$random(),$random()};
    end
    $finish();
end

endmodule

