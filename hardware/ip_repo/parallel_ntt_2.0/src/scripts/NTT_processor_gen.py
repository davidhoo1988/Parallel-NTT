#! /usr/bin/python

#
# This file is part of the ROLLO hardware, which generates a digit-level
# GF(2m) multiplier
# 
# Copyright (C) 2021
# Authors: David Jingwei Hu <davidhu@ntu.edu.sg>
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Function: code generation tool for module NTT_processor
# Usage: python NTT_processor_gen.py -N 32 -d 4 -r 4294967935 -p 4294966657> ./verilog/NTT_processor.v

import os
import argparse
import math
import sys

parser = argparse.ArgumentParser(description='Generate parallel_NTT_top module.',
                formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('-N, --num', dest='N', type=int, required= True,
          help='number of NTT points')
parser.add_argument('-d, --num', dest='d', type=int, required= True,
          help='digit size of the multiplier')
parser.add_argument('-r, --num', dest='r', type=int, required= True,
          help='r value of the Barret reduction')
parser.add_argument('-p, --num', dest='p', type=int, required= True,
          help='modulus p')
args = parser.parse_args()

N = args.N
d = args.d
barret_r = args.r 
barret_mod = args.p

logN = int(math.log2(N))
logd = int(math.log2(d))

print ("`timescale 1ns / 1ps")
print ("""//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2021 07:36:31 PM
// Design Name: 
// Module Name: NTT_processor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////""")
print ("")

print ("""module NTT_processor #(parameter FILE = "", PARAM_MOD = 32'd{barret_mod}, CONFIG = {i}'d0)(
    //extra-connection with parallel_NTT_top
    input wire clk,
    input wire rst_b,
    input wire start,
    output wire finish,

    input wire [31:0] extra_connect_din,
    input wire extra_connect_din_valid,

    output wire [31:0] extra_connect_dout,
    output wire extra_connect_dout_valid,
    input wire extra_connect_read_valid, //burst-read request from external
    """.format(barret_mod = barret_mod, i = logd))

tmp = ""
for i in range(logd):
	if i != logd-1:
		tmp += """    //inter-connection No.{i1}
	input wire [31:0] inter_connect_{i}_din,
	output wire [31:0] inter_connect_{i}_dout,\n""".format(i1 = i+1, i = i)
	else:
		tmp += """    //inter-connection No.{i1}
    input wire [31:0] inter_connect_{i}_din,
    output wire [31:0] inter_connect_{i}_dout
    );
    """.format(i1 = i+1, i = i)  
print (tmp) 

print ("""// data transfer logic for bram data
reg data_wea, data_ena;
reg [31:0] data_dia;
reg [{i}:0] data_addra; 

reg data_web, data_enb;
reg [31:0] data_dib;
reg [{i}:0] data_addrb;
wire [31:0] data_doa;
wire [31:0] data_dob;

reg twiddle_factor_en;
reg [{j}:0] twiddle_factor_addr, twiddle_factor_addr_delay1;\n\n""".format( i = math.ceil(math.log2(N/d))-1, j = math.ceil(math.log2(N/d+logd-1))-1 ) )


tmp = """// Define the states of state machine
// The control state machine oversees the reading block RAM, butterfly computation,
// and outputs the results to block RAM
localparam [1:0] IDLE = 2'd0,        // This is the initial/idle state 

                ADDR_READ  = 1'd1, // In this state addra and addrb are tuned to read block RAM 
                ADDR_WRITE = 2'd2, // In this state addra and addrb are tuned to write bolck RAM
                IDLE1 = 2'd3; // pause state between ADDR_READ and ADDR_WRITE

// State variable
reg [1:0] current_state;  
// iteration round variable
reg [{i}:0] roundi;
// distance variable
reg [{j}:0] dist;
//  base variable
reg [{j}:0] base;
// cntb(counter base) variable
reg [{k}:0] cntb;
// cnt variable
reg [{k}:0] cnt;

//state transitional signal
wire idle1_done;\n""".format( i = math.ceil(math.log2(logN))-1, j = math.ceil(math.log2(N/(2*d)+1))-1, k = math.ceil(math.log2(N/(2*d)))-1 if math.ceil(math.log2(N/(2*d))) > 0 else 0)
print (tmp)

tmp = """// Control state machine implementation
always @(posedge clk) begin  
  if (!rst_b)  // Synchronous reset (active low)   
    current_state <= IDLE;
  else
    case (current_state)
      IDLE: 
        // The sink starts providing correct address control when 
        // the start singnal is asserted
        if (start) begin
          current_state <= ADDR_READ;
        end
        else begin
          current_state <= IDLE;
        end
      ADDR_READ: 
        if (cntb == {cntb_end}) begin
            current_state <= IDLE1;
        end 
        else begin
            current_state <= ADDR_READ;
        end
      ADDR_WRITE:
        if (roundi == {roundi_end} && cntb == {cntb_end}) begin // When all iterative rounds are completed, state restores to IDLE
            current_state <= IDLE;
        end
        else if (cntb == {cntb_end}) begin
            current_state <= ADDR_READ;
        end
        else begin
            current_state <= ADDR_WRITE;
        end
      IDLE1:
        if (idle1_done) begin
            current_state <= ADDR_WRITE;
        end 
        else begin
            current_state <= IDLE1;
        end
    endcase
end

assign finish = (current_state == ADDR_WRITE && roundi == {roundi_end} && cntb == {cntb_end}) ? 1'b1 : 1'b0;\n""".format(cntb_end = int(N/(2*d))-1, roundi_end = logN-1)
print (tmp)

if N != 2*d: # general case
    print ("""// logic control for auxillary variables
    always @(posedge clk) begin
        if (!rst_b) begin
            // reset
            cntb <= 0;
        end
        else if (current_state == ADDR_READ) begin
            cntb <= cntb + 1'b1;
        end
        else if (current_state == ADDR_WRITE) begin
            cntb <= cntb + 1'b1;
        end
        else begin
            cntb <= 0;
        end
    end\n""")
else: # special case
    print ("""// logic control for auxillary variables
    always @(posedge clk) begin
        if (!rst_b) begin
            // reset
            cntb <= 0;
        end
        else if (current_state == ADDR_READ) begin
            cntb <= cntb;
        end
        else if (current_state == ADDR_WRITE) begin
            cntb <= cntb;
        end
        else begin
            cntb <= 0;
        end
    end\n""")    

print ("""always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        roundi <= 0; 
    end
    else if (current_state == ADDR_WRITE && cntb == {cntb_end} && roundi != {roundi_end}) begin
        roundi <= roundi + 1'b1;
    end
    else if (current_state == ADDR_WRITE) begin
        roundi <= roundi; 
    end
    else if (current_state == ADDR_READ) begin
        roundi <= roundi;
    end
    else if (current_state == IDLE1) begin
        roundi <= roundi;
    end
    else begin
        roundi <= 0;
    end
end\n""".format(cntb_end = int(N/(2*d))-1, roundi_end = logN-1))

tmp = """always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        cnt <= 0;
    end
    else if (current_state == ADDR_READ || current_state == ADDR_WRITE) begin
        if (roundi < {i} && cnt == {cnt_end}) begin
            cnt <= 0;
        end\n""".format(i = logd+1, cnt_end = int(N/(2*d))-1)
val = 2*2
for i in range(logd+1,logN,1):
	tmp += """        else if (roundi == {i} && cnt == {j}) begin
            cnt <= 0;
        end\n""".format(i = i, j = int(N/(val*d))-1)
	val = 2*val
tmp += """        else begin
            cnt <= cnt + 1'b1;
        end
    end
    else begin
        cnt <= 0;
    end
end\n"""
print (tmp)

tmp = """always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        base <= 0;
    end
    else if (current_state == ADDR_READ || current_state == ADDR_WRITE) begin
        if (roundi < {i} && cntb == {cntb_end})
            base <= 0;\n""".format(i = logd+1, cntb_end = int(N/(2*d))-1)
val = int(N/(2*d))
val2 = 1
for i in range(logd+1,logN,1):
	if i != logN-1:
		tmp += """        else if (roundi == {i} && cntb[{j}:0] == {{{WIDTH}{{1'b1}}}})
            base <= base + {k};\n""".format(i = i, j = math.ceil(math.log2(N/(2*d)))-1-val2, k = val, WIDTH = math.ceil(math.log2(N/(2*d)))-val2)
	else:
		tmp += """        else if (roundi == {i})
            base <= base + {k};\n""".format(i = i, k = val)	            

	val = int(val/2)      
	val2 = val2 + 1
tmp += """        else 
            base <= base;    
    end
    else begin
        base <= 0;
    end
end\n"""
print (tmp)

tmp = """// logic control for twiddle factor LUT
always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        twiddle_factor_addr <= 0;
    end
    else if (current_state == ADDR_READ) begin
        if (roundi < {i} && cntb == {cntb_end})
            twiddle_factor_addr <= twiddle_factor_addr + 1;\n""".format(i = logd+1, cntb_end = int(N/(2*d))-1)
val2 = 1
for i in range(logd+1, logN, 1):
	if i != logN-1:
		tmp += """        else if (roundi == {i} && cntb[{j}:0] == {{{WIDTH}{{1'b1}}}})
            twiddle_factor_addr <= twiddle_factor_addr + 1;\n""".format(i = i, j = math.ceil(math.log2(N/(2*d)))-1-val2, WIDTH = math.ceil(math.log2(N/(2*d)))-val2)
	else:
		tmp +=	"""        else if (roundi == {i} && cntb != {cntb_end})
            twiddle_factor_addr <= twiddle_factor_addr + 1;\n  """.format(i = i, cntb_end = int(N/(2*d))-1) 
	val2 = val2 + 1

tmp += """        else 
            twiddle_factor_addr <= twiddle_factor_addr;         
    end
    else if (current_state == ADDR_WRITE || current_state == IDLE1)
        twiddle_factor_addr <= twiddle_factor_addr;
    else begin
        twiddle_factor_addr <= 0;
    end
end\n"""
print (tmp)

tmp = """always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        twiddle_factor_addr_delay1 <= 0;
    end
    else begin
        twiddle_factor_addr_delay1 <= twiddle_factor_addr;
    end
end

always @(posedge clk) begin
    if (!rst_b) begin
        twiddle_factor_en <= 0;
    end
    else if (current_state == ADDR_READ || current_state == ADDR_WRITE) begin
        twiddle_factor_en <= 1;
    end
    else begin
        twiddle_factor_en <= 0;
    end
end\n"""
print (tmp)

tmp = """// logic control for block RAM read/write
reg [31:0] butterfly_dout1, butterfly_dout2;
wire        butterfly_dout_valid;

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        data_wea <= 0;
        data_ena <= 0;
        data_dia <= 0;
        data_addra <= -1;

        data_web <= 0;
        data_enb <= 0;
        data_dib <= 0;
        data_addrb <= -1;
    end
    else if (extra_connect_din_valid) begin // use PORT-A to write
        data_wea <= 1;
        data_ena <= 1;
        data_dia <= extra_connect_din;
        data_addra <= data_addra + 1'b1;
    end
    else if (extra_connect_read_valid) begin // use PORT-B to read, keep 'extra_connect_read_valid' high to enable burst-read mode
        data_web <= 0;
        data_enb <= 1;
        data_dib <= 0;
        data_addrb <= data_addrb + 1'b1;
    end
    else if (current_state == ADDR_READ) begin // Butterfly computation: use both PORT-A and PORT-B to read data from block RAM 'data'
        data_wea <= 0;
        data_ena <= 1;
        data_dia <= 0;
        data_addra <= base + cnt;

        data_web <= 0;
        data_enb <= 1;
        data_dib <= 0;
        data_addrb <= base + cnt + dist;
    end
    else if (current_state == ADDR_WRITE) begin
        data_wea <= 1;
        data_ena <= 1;
        data_dia <= butterfly_dout1;
        data_addra <= base + cnt;

        data_web <= 1;
        data_enb <= 1;
        data_dib <= butterfly_dout2;
        data_addrb <= base + cnt + dist;
    end
    else begin 
        data_wea <= 0;
        data_ena <= 0;
        data_dia <= 0;
        data_addra <= -1;

        data_web <= 0;
        data_enb <= 0;
        data_dib <= 0;
        data_addrb <= -1;
    end

end\n"""
print (tmp)

tmp =  """// logic for data out to master AXI interface
reg extra_connect_read_valid_delay1;
reg extra_connect_read_valid_delay2;

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        extra_connect_read_valid_delay1 <= 0;
        extra_connect_read_valid_delay2 <= 0;
    end
    else begin
        extra_connect_read_valid_delay1 <= extra_connect_read_valid;
        extra_connect_read_valid_delay2 <= extra_connect_read_valid_delay1;
    end
end

assign extra_connect_dout_valid = extra_connect_read_valid_delay2;
assign extra_connect_dout = data_dob;


// butterfly structure
reg [31:0]  """

for i in range(int(math.ceil(24/3))): # HERE I ASSUME the delay = 1 + 6 + 17 = 24
    if i == 0:
        tmp += ("butterfly_din1_delay1, butterfly_din1_delay2, butterfly_din1_delay3,\n")
    elif i != int(math.ceil(24/3))-1:
        tmp += ("\t\t\tbutterfly_din1_delay{i1}, butterfly_din1_delay{i2}, butterfly_din1_delay{i3},\n".format(i1 = 3*i+1, i2 = 3*i+2, i3 = 3*i+3))
    else:
        if 24%3 == 0:
            tmp += ("\t\t\tbutterfly_din1_delay{i1}, butterfly_din1_delay{i2}, butterfly_din1_delay{i3};\n".format(i1 = 3*i+1, i2 = 3*i+2, i3 = 3*i+3))
        elif 24%3 == 2:
            tmp += ("\t\t\tbutterfly_din1_delay{i1}, butterfly_din1_delay{i2};\n".format(i1 = 3*i+1, i2 = 3*i+2))
        elif 24%3 == 1:
            tmp += ("\t\t\tbutterfly_din1_delay{i1};\n".format(i1 = 3*i+1))

tmp += ("""\n/*reg [31:0]  butterfly_din2_delay1, butterfly_din2_delay2, butterfly_din2_delay3,
            butterfly_din2_delay4, butterfly_din2_delay5, butterfly_din2_delay6,
            butterfly_din2_delay7, butterfly_din2_delay8, butterfly_din2_delay9,
            butterfly_din2_delay10, butterfly_din2_delay11, butterfly_din2_delay12,
            butterfly_din2_delay13, butterfly_din2_delay14, butterfly_din2_delay15,
            butterfly_din2_delay16, butterfly_din2_delay17;*/\n""")
print (tmp)

tmp = "reg [{sel_w}:0] sel, sel_delay1; // ".format(sel_w = math.ceil(math.log2(logd+1+1)) - 1)
for i in range(logd+1):
    if i != logd:
        tmp += "{i1} <-> inter_connect_{i}    ".format(i1 = i + 1, i = i)
    else:
        tmp += "{i1} <-> block ram DATA".format(i1 = i + 1)
print (tmp) 

print ("""
wire [31:0] butterfly_din1;
wire [31:0] butterfly_din2;
wire [31:0] twiddle_factor_din;
""")

tmp = "generate\n"
for i in range(d):
    if i == 0:
        tmp += "    if (CONFIG == {width}'b{value}) begin //the processor node is always in the first-half zone\n".format(width = logd, value = "{0:b}".format(i).zfill(logd))
    elif i != d-1:
        tmp += "    else if (CONFIG == {width}'b{value}) begin\n".format(width = logd, value = "{0:b}".format(i).zfill(logd))
    else:    
        tmp += "    else begin //the processor is always in the second-half zone\n"
    for j in range(logd):
        binary = "{0:b}".format(i).zfill(logd)
        if binary[j] == '0':
            tmp += "        assign inter_connect_{j}_dout = data_dob;\n".format(j = j)
        else:
            tmp += "        assign inter_connect_{j}_dout = data_doa;\n".format(j = j)  
    tmp += "\tend\n" 
tmp += "endgenerate\n" 
print (tmp)

tmp = "generate\n"
for i in range(d):
    if i == 0:
        tmp += "    if (CONFIG == {width}'b{value}) begin\n".format(width = logd, value = "{0:b}".format(i).zfill(logd))
    elif i != d-1:
        tmp += "    else if (CONFIG == {width}'b{value}) begin\n".format(width = logd, value = "{0:b}".format(i).zfill(logd))
    else:    
        tmp += "    else begin\n"

    binary = "{0:b}".format(i).zfill(logd)
    tmp += "\t\tassign butterfly_din1 = "
    for j in range(logd+2):
        if j == 0:
            if binary[j] == '0':
                tmp += "sel_delay1 == {j1} ? data_doa :\n".format(j1 = j+1)
            else:
                tmp += "sel_delay1 == {j1} ? inter_connect_{j}_din :\n".format(j1 = j+1, j = j)             
        elif j < logd:
            if binary[j] == '0':
                tmp += "\t\t\t\t\t\t\t\tsel_delay1 == {j1} ? data_doa :\n".format(j1 = j+1)
            else:
                tmp += "\t\t\t\t\t\t\t\tsel_delay1 == {j1} ? inter_connect_{j}_din :\n".format(j1 = j+1, j = j)        
        elif j == logd:
            tmp += """                                sel_delay1 == {j1} ? data_doa :\n""".format(j1 = j+1)
        elif j == logd+1:    
            tmp += "                                32'd0;\n"

    tmp += "\t\tassign butterfly_din2 = "
    for j in range(logd+2):
        if j == 0:
            if binary[j] == '1':
                tmp += "sel_delay1 == {j1} ? data_dob :\n".format(j1 = j+1)
            else:
                tmp += "sel_delay1 == {j1} ? inter_connect_{j}_din :\n".format(j1 = j+1, j = j)             
        elif j < logd:
            if binary[j] == '1':
                tmp += "\t\t\t\t\t\t\t\tsel_delay1 == {j1} ? data_dob :\n".format(j1 = j+1)
            else:
                tmp += "\t\t\t\t\t\t\t\tsel_delay1 == {j1} ? inter_connect_{j}_din :\n".format(j1 = j+1, j = j)        
        elif j == logd:
            tmp += """                                sel_delay1 == {j1} ? data_dob :\n""".format(j1 = j+1)
        elif j == logd+1:    
            tmp += "                                32'd0;\n"
    tmp += "\tend\n"
tmp += "endgenerate\n" 
print (tmp) 

tmp = """always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        sel <= 0;
    end
    else if (current_state == ADDR_READ) begin
        if (roundi < {x} && cntb == 0)
            sel <= sel + 1;
        else if (roundi == {x} && cntb == 0)
            sel <= 1;
        else if (roundi == {x1} && cntb == 0)
            sel <= {x1};
        else 
            sel <= sel;            
    end
    else if (current_state == IDLE) begin
        sel <= 0; 
    end
    else begin
        sel <= sel;
    end
end
""".format(x = logd, x1 = logd+1)
print (tmp)

print ("""always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        sel_delay1 <= 0;
    end
    else begin
        sel_delay1 <= sel;
    end
end""")

tmp = """\nalways @(posedge clk) begin // delay = 1 + 6 + 17 (butterfly_din delay + MUL delay + BarretReduce delay)
    if (!rst_b) begin
        // reset\n"""
for i in range(24):
    tmp += "        butterfly_din1_delay{i1} <= 0;\n".format(i1 = i+1)
tmp += "\tend\n\telse begin\n"

for i in range(24):
    if  i == 0:
        tmp += "        butterfly_din1_delay1 <= butterfly_din1;\n"
    else:
        tmp += "        butterfly_din1_delay{i1} <= butterfly_din1_delay{i};\n".format(i1 = i+1, i = i)
tmp += "\tend\nend\n"
print (tmp)

print ("""wire [31+1:0] add; // len(add) = len(mod_add) + 1
wire [31:0] sub, mod_add, mod_sub;
wire [31:0] mod_add_dia, mod_add_dib, mod_sub_dia, mod_sub_dib;

//32-bit mod_add
assign add = mod_add_dia + mod_add_dib; 
assign mod_add = add < PARAM_MOD ? add : add - PARAM_MOD;

//32-bit mod_sub
assign sub = mod_sub_dia - mod_sub_dib;
assign mod_sub = (mod_sub_dia > mod_sub_dib) | (mod_sub_dia == mod_sub_dib) ? sub : sub + PARAM_MOD;

//32-bit mod_mul, driven by DSP
reg [31:0] mul_dina, mul_dinb;
wire [63:0] mul_dout;
wire [31:0] mod_mul;

//32-bit butterfly output
always @(posedge clk) begin
     if (~rst_b) begin
         // reset
         butterfly_dout1 <= 0;
         butterfly_dout2 <= 0;
     end
     else begin
         butterfly_dout1 <= mod_add;
         butterfly_dout2 <= mod_sub;
     end
 end 

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        mul_dina <= 0;
        mul_dinb <= 0;
    end
    else begin
        mul_dina <= butterfly_din2;
        mul_dinb <= twiddle_factor_din;        
    end
end



//32bit*32bit integer multiplication, delay = 6 clock cycles
mult_gen_32x32 mul32x32(
    .CLK        (clk),
    .A          (mul_dina),
    .B          (mul_dinb),
    .P          (mul_dout)
    );\n""")

tmp = """//Barret modular reduction   Barret params: r = 816642, k = 32, delay = 17 clock cycles
wire [63:0] barret_din;
wire [31:0] barret_dout;
wire barret_din_valid, barret_dout_valid;

reg [1:0]   """

for i in range(int(math.ceil((3+6)/3))): # assume the delay = 3 + 6 = 9
    if i == 0:
        tmp += "current_state_delay1, current_state_delay2, current_state_delay3,\n"       
    elif i != int(math.ceil((3+6)/3))-1:
        tmp += "\t\t\tcurrent_state_delay{i1}, current_state_delay{i2}, current_state_delay{i3},\n".format(i1 = 3*i+1, i2 = 3*i+2, i3 = 3*i+3)
    else:
        tmp += "\t\t\tcurrent_state_delay{i1}, current_state_delay{i2}, current_state_delay{i3};// delay curret_state by 3+MUL_delay cycles to output barret_din_valid\n\n".format(i1 = 3*i+1, i2 = 3*i+2, i3 = 3*i+3)

tmp += """assign barret_din = mul_dout;
assign barret_din_valid = current_state_delay9 == 2'd1 ? 1'b1 : 1'b0;

always @(posedge clk) begin
    if (!rst_b) begin
        // reset\n"""
for i in range(3+6): # assume the delay = 3 + 6 = 9
    tmp += "        current_state_delay{i1} <= 0;\n".format(i1 = i+1)
tmp += "\tend\n\telse begin\n"

for i in range(3+6): # assume the delay = 3 + 6 = 9
    if i == 0:
        tmp += "        current_state_delay1 <= current_state;\n"
    else:
        tmp += "        current_state_delay{i1} <= current_state_delay{i};\n".format(i1 = i+1, i = i) 
tmp += "\tend\nend\n"   

tmp += """
assign mod_add_dia = butterfly_din1_delay24;
assign mod_add_dib = barret_dout;

assign mod_sub_dia = butterfly_din1_delay24;
assign mod_sub_dib = barret_dout;

assign idle1_done = barret_dout_valid;
assign butterfly_dout_valid = barret_dout_valid;

Barret_reduce #(
    .PARAM_R(33'd{barret_r}),
    .PARAM_K({barret_k}),
    .PARAM_MOD(32'd{barret_mod}))
    Barret(
    .clk        (clk),
    .rst_b      (rst_b),
    .din        (barret_din),
    .din_valid  (barret_din_valid),
    .dout       (barret_dout),
    .dout_valid (barret_dout_valid)
);

""".format(barret_r = barret_r, barret_k = 32, barret_mod = barret_mod)    
print (tmp)

val = 2
comment = ''
for i in range(logN):
    if i < logd+1:
        comment += '1+'
    else:
        if i != logN-1:
            comment += '{val}+'.format(val = val)
        else:
            comment += '{val}'.format(val = val) 
        val = val*2

tmp = """/*********************
 * Memory part
 ********************/    

mem_dp #( 
        .WIDTH(32),
        .DEPTH({N}/{d})
    )
data(
  .clka     (clk),
  .wea      (data_wea),
  .ena      (data_ena),
  .dina      (data_dia),
  .addra    (data_addra),
  .douta      (data_doa), 

  .clkb     (clk),
  .web      (data_web),
  .enb      (data_enb),
  .dinb      (data_dib),
  .addrb    (data_addrb),
  .doutb      (data_dob) 
);

mem_sp #(
    .WIDTH(32), 
    .DEPTH({value}),  // {comment}
    .FILE(FILE))
twiddle_factor(
  .clk      (clk),
  .di       (32'b0),
  .addr     (twiddle_factor_addr_delay1),
  .en       (twiddle_factor_en),
  .we       (1'b0),
  .do       (twiddle_factor_din)
);\n""".format(N = N, d = d, value = int(N/d+logd-1), comment = comment)
print (tmp)

tmp = """// distance LUT
always@(roundi) begin
    case(roundi)\n"""
distance = int(N/(2*d))
for i in range(logN):
    tmp += "       {roundi_width}'d{i}: dist <= {distance};\n".format(roundi_width = int(math.ceil(math.log2(logN))), i = i, distance = distance)
    if i >= logd:
        distance = distance >> 1
tmp += "       default: dist <= 0;\n\tendcase\nend\n\nendmodule"
print (tmp)