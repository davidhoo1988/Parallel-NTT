######################################################################
#
# File name : parallel_ntt_0_butterfly_tb_simulate.do
# Created on: Sun Feb 06 16:54:32 +0800 2022
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L xbip_utils_v3_0_9 -L xbip_pipe_v3_0_5 -L xbip_bram18k_v3_0_5 -L mult_gen_v12_0_14 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm -lib xil_defaultlib xil_defaultlib.parallel_ntt_0_butterfly_tb xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {parallel_ntt_0_butterfly_tb_wave.do}

view wave
view structure
view signals

do {parallel_ntt_0_butterfly_tb.udo}

run 1000ns
