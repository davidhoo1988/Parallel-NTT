######################################################################
#
# File name : parallel_ntt_0_butterfly_tb_simulate.do
# Created on: Thu Nov 18 17:27:30 +0800 2021
#
# Auto generated by Vivado for 'post-implementation' simulation
#
######################################################################
vsim -voptargs="+acc" +transport_int_delays +pulse_e/0 +pulse_int_e/0 +pulse_r/0 +pulse_int_r/0 -L xil_defaultlib -L simprims_ver -L secureip -lib xil_defaultlib xil_defaultlib.parallel_ntt_0_butterfly_tb xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {parallel_ntt_0_butterfly_tb_wave.do}

view wave
view structure
view signals

do {parallel_ntt_0_butterfly_tb.udo}

run 1000ns
