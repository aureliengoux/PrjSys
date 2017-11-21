module de2_top
   (
      ///////////////////////   Clock Input    ////////////////////////
      input            clock_27,          // 27 MHz
      input            clock_50,          // 50 MHz
      input            ext_clock,         // External Clock
      ////////////////////////   Push Button    ////////////////////////
      input      [3:0] key,               // Pushbutton[3:0]
      ////////////////////////   DPDT Switch    ////////////////////////
      input     [17:0] sw,                // Toggle Switch[17:0]
      ////////////////////////   7-SEG Dispaly  ////////////////////////
      output     [6:0] hex0,              // Seven Segment Digit 0
      output     [6:0] hex1,              // Seven Segment Digit 1
      output     [6:0] hex2,              // Seven Segment Digit 2
      output     [6:0] hex3,              // Seven Segment Digit 3
      output     [6:0] hex4,              // Seven Segment Digit 4
      output     [6:0] hex5,              // Seven Segment Digit 5
      output     [6:0] hex6,              // Seven Segment Digit 6
      output     [6:0] hex7,              // Seven Segment Digit 7
      ////////////////////////////  LED      ////////////////////////////
      output     [8:0] ledg,              // LED Green[8:0]
      output    [17:0] ledr,              // LED Red[17:0]
      ////////////////////////////  UART  ////////////////////////////
      output         uart_txd,            // UART Transmitter
      input          uart_rxd,            // UART Receiver
      ////////////////////////////  IRDA  ////////////////////////////
      output         irda_txd,            // IRDA Transmitter
      input          irda_rxd,            // IRDA Receiver
      ///////////////////////    SDRAM Interface   ////////////////////////
      inout   [15:0] dram_dq,             // SDRAM Data bus 16 Bits
      output  [11:0] dram_addr,           // SDRAM Address bus 12 Bits
      output         dram_ldqm,           // SDRAM Low-byte Data Mask
      output         dram_udqm,           // SDRAM High-byte Data Mask
      output         dram_we_n,           // SDRAM Write Enable
      output         dram_cas_n,          // SDRAM Column Address Strobe
      output         dram_ras_n,          // SDRAM Row Address Strobe
      output         dram_cs_n,           // SDRAM Chip Select
      output         dram_ba_0,           // SDRAM Bank Address 0
      output         dram_ba_1,           // SDRAM Bank Address 0
      output         dram_clk,            // SDRAM Clock
      output         dram_cke,            // SDRAM Clock Enable
      ////////////////////////   Flash Interface   ////////////////////////
      inout    [7:0] fl_dq,               // FLASH Data bus 8 Bits
      output  [21:0] fl_addr,             // FLASH Address bus 22 Bits
      output         fl_we_n,             // FLASH Write Enable
      output         fl_rst_n,            // FLASH Reset
      output         fl_oe_n,             // FLASH Output Enable
      output         fl_ce_n,             // FLASH Chip Enable
      ////////////////////////   SRAM Interface ////////////////////////
      inout   [15:0] sram_dq,             // SRAM Data bus 16 Bits
      output  [17:0] sram_addr,           // SRAM Address bus 18 Bits
      output         sram_ub_n,           // SRAM High-byte Data Mask
      output         sram_lb_n,           // SRAM Low-byte Data Mask
      output         sram_we_n,           // SRAM Write Enable
      output         sram_ce_n,           // SRAM Chip Enable
      output         sram_oe_n,           // SRAM Output Enable
      //////////////////// ISP1362 Interface ////////////////////////
      inout   [15:0] otg_data,            // ISP1362 Data bus 16 Bits
      output   [1:0] otg_addr,            // ISP1362 Address 2 Bits
      output         otg_cs_n,            // ISP1362 Chip Select
      output         otg_rd_n,            // ISP1362 Write
      output         otg_wr_n,            // ISP1362 Read
      output         otg_rst_n,           // ISP1362 Reset
      output         otg_fspeed,          // USB Full Speed,   0 = Enable, Z = Disable
      output         otg_lspeed,          // USB Low Speed,    0 = Enable, Z = Disable
      input          otg_int0,            // ISP1362 Interrupt 0
      input          otg_int1,            // ISP1362 Interrupt 1
      input          otg_dreq0,           // ISP1362 DMA Request 0
      input          otg_dreq1,           // ISP1362 DMA Request 1
      output         otg_dack0_n,         // ISP1362 DMA Acknowledge 0
      output         otg_dack1_n,         // ISP1362 DMA Acknowledge 1
      //////////////////// LCD Module 16X2   ////////////////////////////
      inout [7:0]    lcd_data,            // LCD Data bus 8 bits
      output         lcd_on,              // LCD Power ON/OFF
      output         lcd_blon,            // LCD Back Light ON/OFF
      output         lcd_rw,              // LCD Read/Write Select, 0 = Write, 1 = Read
      output         lcd_en,              // LCD Enable
      output         lcd_rs,              // LCD Command/Data Select, 0 = Command, 1 = Data
      //////////////////// SD Card Interface ////////////////////////
      inout          sd_dat,              // SD Card Data
      inout          sd_dat3,             // SD Card Data 3
      inout          sd_cmd,              // SD Card Command Signal
      output         sd_clk,              // SD Card Clock
      ////////////////////////   I2C      ////////////////////////////////
      inout          i2c_sdat,            // I2C Data
      output         i2c_sclk,            // I2C Clock
      ////////////////////////   PS2      ////////////////////////////////
      input          ps2_dat,             // PS2 Data
      input          ps2_clk,             // PS2 Clock
      //////////////////// USB JTAG link  ////////////////////////////
      input          tdi,                 // CPLD -> FPGA (data in)
      input          tck,                 // CPLD -> FPGA (clk)
      input          tcs,                 // CPLD -> FPGA (CS)
      output         tdo,                 // FPGA -> CPLD (data out)
      ////////////////////////   VGA         ////////////////////////////
      output         vga_clk,             // VGA Clock
      output         vga_hs,              // VGA H_SYNC
      output         vga_vs,              // VGA V_SYNC
      output         vga_blank,           // VGA BLANK
      output         vga_sync,            // VGA SYNC
      output   [9:0] vga_r,               // VGA Red[9:0]
      output   [9:0] vga_g,               // VGA Green[9:0]
      output   [9:0] vga_b,               // VGA Blue[9:0]
      ////////////////  Ethernet Interface   ////////////////////////////
      inout   [15:0] enet_data,           // DM9000A DATA bus 16Bits
      output         enet_cmd,            // DM9000A Command/Data Select, 0 = Command, 1 = Data
      output         enet_cs_n,           // DM9000A Chip Select
      output         enet_wr_n,           // DM9000A Write
      output         enet_rd_n,           // DM9000A Read
      output         enet_rst_n,          // DM9000A Reset
      input          enet_int,            // DM9000A Interrupt
      output         enet_clk,            // DM9000A Clock 25 MHz
      //////////////////// Audio CODEC    ////////////////////////////
      inout          aud_adclrck,         // Audio CODEC ADC LR Clock
      input          aud_adcdat,          // Audio CODEC ADC Data
      inout          aud_daclrck,         // Audio CODEC DAC LR Clock
      output         aud_dacdat,          // Audio CODEC DAC Data
      inout          aud_bclk,            // Audio CODEC Bit-Stream Clock
      output         aud_xck,          // Audio CODEC Chip Clock
      //////////////////// TV Devoder     ////////////////////////////
      input    [7:0] td_data,             // TV Decoder Data bus 8 bits
      input          td_hs,               // TV Decoder H_SYNC
      input          td_vs,               // TV Decoder V_SYNC
      output         td_reset,            // TV Decoder Reset
      input          td_clk,              // TV Decoder Clock
      ////////////////////////   GPIO  ////////////////////////////////
      inout [35:0]   gpio_0,              // GPIO Connection 0
      inout [35:0]   gpio_1               // GPIO Connection 1
      );


// sw connected to ledr
assign   ledr          = sw;
// Turn on all display
assign   hex0          = 7'h3F;
assign   hex1          = 7'h3F;
assign   hex2          = 7'h3F;
assign   hex3          = 7'h3F;
assign   hex4          = 7'h3F;
assign   hex5          = 7'h3F;
assign   hex6          = 7'h3F;
assign   hex7          = 7'h3F;
assign   ledg          = 9'h000;


// All unused inout port turn to tri-state
assign   sram_dq     =  16'hzzzz;
assign   dram_dq     =  16'hzzzz;
assign   fl_dq       = 8'hzz;
assign   otg_data    = 16'hzzzz;
assign   lcd_data    = 8'hzz;
assign   sd_dat      = 1'bz;
assign   i2c_sdat    = 1'bz;
assign   enet_data   = 16'hzzzz;
assign   aud_adclrck = 1'bz;
assign   aud_daclrck = 1'bz;
assign   aud_bclk    = 1'bz;

// GPIO are also unused
assign   gpio_0      = 36'hzzzzzzzzz;
assign   gpio_1      = 36'hzzzzzzzzz;

// Define locally the main clock frequency and the uart baud rate
localparam          UART_CLK_FREQ = 24_000_000;
localparam          UART_BAUD     = 115_200;

//  Intern signals to link system and pll
wire clk24;
wire pll_locked;

//PLL to generate the mail clock @24MHz from the 50MHz on board oscillator
pll_50_24 pll_i(
            .inclk0 ( clock_50   ) ,
            .c0     ( clk24      ) ,
            .locked ( pll_locked )
          );

// The main reset:
//    - key[0] bush button
//    - The PLL while not locked
// The main module is kept reseted as long as one of those signals is low.

wire asn_reset = key[0] & pll_locked;
wire trigger;

  top #(.UART_CLK_FREQ(UART_CLK_FREQ), .UART_BAUD(UART_BAUD))
  top_i (
     .clk      ( clk24     ) ,
     .n_reset  ( asn_reset ) ,
     .uart_rxd ( uart_rxd  ) ,
     .uart_txd ( uart_txd  ) ,
     .trigger  ( trigger   )
  );


endmodule

