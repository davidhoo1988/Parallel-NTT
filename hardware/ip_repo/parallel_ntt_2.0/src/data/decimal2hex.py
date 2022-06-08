###############################################
# This python script
# transform a memroy file with decimal values
# to hexdecimal values
# for example, decimal2hex.py -d 4
# then output Pi_twiddle_factors_LUT_hex.txt (i=0,...,d-1)
###############################################
import os
import argparse
import math
import sys

parser = argparse.ArgumentParser(description='Convert twiddle_factors_LUT to twiddle_factors_LUT_hex.',
                formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('-d, --num', dest='d', type=int, required= True,
          help='number of butterfly units')
args = parser.parse_args()


d = args.d

# filename = sys.argv[1]
# tmp = re.findall(r"^\w+",filename)

# covert d files one by one
for i in range(d):
	filename = 'P{i}_'.format(i = i) + 'twiddle_factors_LUT' + '.txt'
	writefilename = 'P{i}_'.format(i = i) + 'twiddle_factors_LUT' + '_hex.txt'

	content = []
	with open(filename) as file:
		for line in file:
			content.append(line.rstrip())

	writefile = open(writefilename, 'w')
	for item in content:
		writefile.write(hex(int(item))[2:]+'\n')
	writefile.close()

