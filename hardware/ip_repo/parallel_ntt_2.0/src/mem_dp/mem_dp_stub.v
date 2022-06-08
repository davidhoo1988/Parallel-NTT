// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Mon Nov 15 12:58:08 2021
// Host        : DESKTOP-AN42RLU running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {e:/Dropbox/FHE/my project/Parallel
//               NTT/hardware/ip_repo/parallel_ntt_2.0/src/mem_dp/mem_dp_stub.v}
// Design      : mem_dp
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1" *)
module mem_dp(clka, ena, wea, addra, dina, douta, clkb, enb, web, addrb, 
  dinb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[2:0],dina[31:0],douta[31:0],clkb,enb,web[0:0],addrb[2:0],dinb[31:0],doutb[31:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [2:0]addra;
  input [31:0]dina;
  output [31:0]douta;
  input clkb;
  input enb;
  input [0:0]web;
  input [2:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
endmodule
