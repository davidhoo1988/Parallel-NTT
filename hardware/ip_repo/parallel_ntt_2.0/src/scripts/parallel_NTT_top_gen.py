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
# Function: code generation tool for module parallel_NTT_top
# Usage: python parallel_NTT_top_gen.py -N 32 -d 4 > ./verilog/parallel_NTT_top.v

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
args = parser.parse_args()

N = args.N
d = args.d

logN = int(math.log2(N))
logd = int(math.log2(d))

print ("`timescale 1ns / 1ps")
print ("""//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2021 07:19:03 PM
// Design Name: 
// Module Name: parallel_NTT_top
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
// the fundamental logic for parallel_NTT_top is the data movement
// between processor ram and external. The data channel is 32-bit wide,
// and only one processor is selected per time
//////////////////////////////////////////////////////////////////////////////////""")
print ("")

print ("""module parallel_NTT_top(
    input wire clk,
    input wire rst_b, // reset signal, enabled if set low
    input wire start, //trigger this signal to start NTT computation
    output wire finish, //indicator signal set high if NTT computation is finished
    // related to slave interface, send data to ram
    input wire [31:0] s_processor_din,  // data channel from external to processor ram
    input wire [{i}:0] s_processor_num, // indicator signal suggesting which proceesor is ready for data transfer from external to processor ram
    input wire s_processor_din_valid, //indicator signal set high if the input data is valid
    // related to master interface, request data from ram
    output reg [31:0] m_processor_dout, //data channel from processor ram to external 
    output reg m_processor_dout_valid, // indicator signal set high if the data inside processor ram is ready for transfer
    input wire [{i}:0] m_processor_num, //indicator signal suggesting which processor is ready for data transfer from processor ram to external
    input wire m_processor_num_valid //indicator signal set high if the slected processor is valid
    );
""".format(i = logd-1))

print ("// declare port signals")
for i in range(d):
    print ("reg     P{i}_extra_connect_din_valid;".format(i = i))
print ("")

print ("reg [31:0] s_processor_din_delay;\n")

for i in range(d):
    print ("wire [31:0] P{i}_extra_connect_dout;".format(i = i))
print ("")

for i in range(d):
    print ("wire    P{i}_extra_connect_dout_valid;".format(i = i))
print ("")

for i in range(d):
    print ("reg    P{i}_extra_connect_read_valid;".format(i = i))
print ("")


print ("// connecting wires")
for i in range(d):
    bin_format = '{{0:0{k}b}}'.format(k = logd)
    i_bin = bin_format.format(i)  # For more info, check https://stackoverflow.com/questions/10411085/converting-integer-to-binary-in-python
    for j in range(len(i_bin)):
        dist = int(d/2**(1+j))
        if i_bin[j] == '0': # Pi in the 'upper' position
            print ("wire [31:0] P{x}_to_P{y}_dout;".format(x = i, y = i + dist))
        else: # Pi in the 'lower' position
            print ("wire [31:0] P{x}_to_P{y}_dout;".format(x = i, y = i - dist)) 
    print ("") 

print ("// intermediate variables")
print ("""reg start_reg;
wire start_proc;

reg finish_reg;""")
tmp = "wire"
for i in range(d):
    if i != d-1:
        tmp += " P{i}_end_proc,".format(i = i)
    else:
        tmp += " P{i}_end_proc;\n".format(i = i)
print (tmp)

for i in range(d):
    bin_format = '{{0:0{k}b}}'.format(k = logd)
    i_bin = bin_format.format(i)

    tmp = "// Processor P{i}\n".format(i = i)
    tmp += """NTT_processor #(.FILE("E:/Dropbox/FHE/my project/Parallel NTT/hardware/ip_repo/parallel_ntt_2.0/src/data/P{i}_twiddle_factors_LUT_hex.txt"),
                .CONFIG({logd}'b{j}))
""".format(i = i, j = i_bin, logd = logd)
    tmp += """P{i} (
    .clk(clk),
    .rst_b(rst_b),
    .start(start_proc),
    .finish(P{i}_end_proc),
    //extra-connection with parallel_NTT_top
    .extra_connect_din(s_processor_din_delay),
    .extra_connect_din_valid(P{i}_extra_connect_din_valid),
    .extra_connect_dout(P{i}_extra_connect_dout),
    .extra_connect_dout_valid(P{i}_extra_connect_dout_valid),
    .extra_connect_read_valid(P{i}_extra_connect_read_valid),
""".format(i = i)
    for j in range(logd):
        dist = int(d/2**(1+j))
        if i_bin[j] == '0': # Pi in the 'upper' position
            i1 = i + dist
        else: # Pi in the 'lower' position
            i1 = i - dist

        if j != logd-1:
            tmp += """    //inter-connection No.{j1}, used in round-{j1}
    .inter_connect_{j}_din(P{i1}_to_P{i}_dout),
    .inter_connect_{j}_dout(P{i}_to_P{i1}_dout),
""".format(j = j, j1 = j+1, i = i, i1 = i1)
        else:
            tmp += """    //inter-connection No.{j1}, used in round-{j1}
    .inter_connect_{j}_din(P{i1}_to_P{i}_dout),
    .inter_connect_{j}_dout(P{i}_to_P{i1}_dout)
    );
""".format(j = j, j1 = j+1, i = i, i1 = i1)           

    print (tmp)

extra_connect_din_valid_config = [['' for i in range(d)] for j in range(d+1)]
# sys.stderr.write(str(extra_connect_din_valid_config))

for i in range(d+1):
    for j in range(d):
        if i == j:
            extra_connect_din_valid_config[i][j] = "P{j}_extra_connect_din_valid <= 1'b{v};".format(j = j, v = 1)
        else:
            extra_connect_din_valid_config[i][j] = "P{j}_extra_connect_din_valid <= 1'b{v};".format(j = j, v = 0)         


tmp = """//  user logic here
/***AXIS protocol***/
/***             ***/
always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        """
for j in range(d):
    tmp += extra_connect_din_valid_config[d][j]
    if j != d-1:
        tmp += '\n\t\t'    
tmp += "\n\t end\n"

tmp += """    else if (s_processor_din_valid) begin
        case (s_processor_num)\n"""
for i in range(d):
    tmp += " \t\t\t{v}'d{w}: begin\n\t\t\t\t".format(v = logd, w = i)
    for j in range(d):
        tmp += extra_connect_din_valid_config[i][j]
        if j != d-1:
            tmp += '\n\t\t\t\t'    
    tmp += "\n\t\t\t end\n"            

tmp += " \t\t\tdefault: begin\n\t\t\t\t".format(v = logd, w = i)
for j in range(d):
    tmp += extra_connect_din_valid_config[d][j]
    if j != d-1:
        tmp += '\n\t\t\t\t'    
tmp += "\n\t\t\t end\n\t\tendcase\n\tend\n"    

tmp += "\telse begin\n\t\t"
for j in range(d):
    tmp += extra_connect_din_valid_config[d][j]
    if j != d-1:
        tmp += '\n\t\t'    
tmp += "\n\t end\nend\n"     
del extra_connect_din_valid_config
print(tmp)


print("""always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        s_processor_din_delay <= 0;
    end
    else begin
        s_processor_din_delay <= s_processor_din;
    end
end
""")

extra_connect_read_valid_config = [['' for i in range(d)] for j in range(d+1)]

for i in range(d+1):
    for j in range(d):
        if i == j:
            extra_connect_read_valid_config[i][j] = "P{j}_extra_connect_read_valid <= 1'b{v};".format(j = j, v = 1)
        else:
            extra_connect_read_valid_config[i][j] = "P{j}_extra_connect_read_valid <= 1'b{v};".format(j = j, v = 0)         


tmp = """
always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        """
for j in range(d):
    tmp += extra_connect_read_valid_config[d][j]
    if j != d-1:
        tmp += '\n\t\t'    
tmp += "\n\t end\n"

tmp += """    else if (m_processor_num_valid) begin
        case (m_processor_num)\n"""
for i in range(d):
    tmp += " \t\t\t{v}'d{w}: begin\n\t\t\t\t".format(v = logd, w = i)
    for j in range(d):
        tmp += extra_connect_read_valid_config[i][j]
        if j != d-1:
            tmp += '\n\t\t\t\t'    
    tmp += "\n\t\t\t end\n"            

tmp += " \t\t\tdefault: begin\n\t\t\t\t".format(v = logd, w = i)
for j in range(d):
    tmp += extra_connect_read_valid_config[d][j]
    if j != d-1:
        tmp += '\n\t\t\t\t'    
tmp += "\n\t\t\t end\n\t\tendcase\n\tend\n"    

tmp += "\telse begin\n\t\t"
for j in range(d):
    tmp += extra_connect_read_valid_config[d][j]
    if j != d-1:
        tmp += '\n\t\t'    
tmp += "\n\t end\nend\n"     
del extra_connect_read_valid_config
print(tmp)

tmp = """always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        m_processor_dout <= 0;
        m_processor_dout_valid <= 0;
    end
"""
for i in range(d):
    tmp += """    else if (P{i}_extra_connect_dout_valid) begin
        m_processor_dout <= P{i}_extra_connect_dout;
        m_processor_dout_valid <= P{i}_extra_connect_dout_valid;
    end
""".format(i = i)
tmp += """    else begin
        m_processor_dout <= 0;
        m_processor_dout_valid <= 0;
    end
end
"""
print(tmp)


str_tmp = ''
for i in range(d):
    str_tmp += 'P{i}_end_proc'.format(i = i)
    if i != d-1:
        str_tmp += ' & '

tmp = """/***NTT protocol***/
/***             ***/
always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        start_reg <= 0;
    end
    else begin
        start_reg <= start;
    end
end

assign start_proc = start_reg == 1'b0 && start == 1'b1 ? 1'b1 : 1'b0;

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        finish_reg <= 0;
    end
    else if ({}) begin
        finish_reg <= 1;
    end
end

assign finish = finish_reg;

endmodule""".format(str_tmp)
print(tmp)
