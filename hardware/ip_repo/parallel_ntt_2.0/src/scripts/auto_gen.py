#! /usr/bin/python

#
# This file is part of the NTT hardware, which generates a parallelized
# NTT module
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
# Function: code generation tool for all frequently changed files
# Usage: python auto_gen.py -N 1024 -d 4  

import os
import argparse
import sys

sys.path.insert(1, 'E:\Dropbox\FHE\my project\Parallel NTT\python')
from NTT import *

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Wrapper for generating all hdl files.',
                    formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-N, --num', dest='N', type=int, required= True,
              help='ROLLO security level category')
    parser.add_argument('-d, --num', dest='d', type=int, required= True,
              help='number of GF2m coefficients in each memory cell')

    args = parser.parse_args()

    N = args.N
    d = args.d

    #compute Barret reduction parameters, r and q
    qbit = 32
    q, psi = NTT.NTT_paramGen(N, qbit)
    r, k = NTT.Barret_init(q)

print("q={q}, r={r}".format(q = q, r = r))

#generate NTT_processor.v
if int(N/(2*d)) > 27:
    # Read and then write
    os.system("python NTT_processor_gen2.py -N {N} -d {d} -r {r} -p {p}> ./verilog/NTT_processor.v".format(N = N, d = d, r = r, p = q))
else:
    # Read, wait and then write    
    os.system("python NTT_processor_gen.py -N {N} -d {d} -r {r} -p {p}> ./verilog/NTT_processor.v".format(N = N, d = d, r = r, p = q))
print ("NTT_processor.v is generated.")

#generate parallel_NTT_top.v
os.system("python parallel_NTT_top_gen.py -N {N} -d {d}  > ./verilog/parallel_NTT_top.v".format(N = N, d = d))
print ("parallel_NTT_top.v is generated.")

#generate parallel_ntt_v2_0_M_AXIS.v
os.system("python parallel_ntt_v2_0_M_AXIS_gen.py -N {N} -d {d} > ./verilog/parallel_ntt_v2_0_M_AXIS.v".format(N = N, d = d))
print ("parallel_ntt_v2_0_M_AXIS.v is generated.")


