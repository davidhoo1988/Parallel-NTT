vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../ip/parallel_ntt_0/src/mult_gen_32x32/sim/mult_gen_32x32.vhd" \
"../../../ip/parallel_ntt_0/src/mult_gen_64x33/sim/mult_gen_64x33.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../ip/parallel_ntt_0/src" "+incdir+../../../ip/parallel_ntt_0/src" \
"../../../ip/parallel_ntt_0/hdl/parallel_ntt_v2_0_S_AXIS.v" \
"../../../ip/parallel_ntt_0/src/NTT_processor.v" \
"../../../ip/parallel_ntt_0/src/mem_sp.v" \
"../../../ip/parallel_ntt_0/src/Barret_reduce.v" \
"../../../ip/parallel_ntt_0/src/parallel_NTT_top.v" \
"../../../ip/parallel_ntt_0/src/mem_dp.v" \
"../../../ip/parallel_ntt_0/hdl/parallel_ntt_v2_0_M_AXIS.v" \
"../../../ip/parallel_ntt_0/hdl/parallel_ntt_v2_0.v" \
"../../../ip/parallel_ntt_0/sim/parallel_ntt_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

