vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/xbip_utils_v3_0_9
vlib riviera/xbip_pipe_v3_0_5
vlib riviera/xbip_bram18k_v3_0_5
vlib riviera/mult_gen_v12_0_14

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap xbip_utils_v3_0_9 riviera/xbip_utils_v3_0_9
vmap xbip_pipe_v3_0_5 riviera/xbip_pipe_v3_0_5
vmap xbip_bram18k_v3_0_5 riviera/xbip_bram18k_v3_0_5
vmap mult_gen_v12_0_14 riviera/mult_gen_v12_0_14

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../ip/parallel_ntt_0/src" "+incdir+../../../ip/parallel_ntt_0/src" \
"D:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_9 -93 \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_5 -93 \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_5 -93 \
"../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_14 -93 \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../ip/parallel_ntt_0/src/mult_gen_32x32/sim/mult_gen_32x32.vhd" \
"../../../ip/parallel_ntt_0/src/mult_gen_64x33/sim/mult_gen_64x33.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ip/parallel_ntt_0/src" "+incdir+../../../ip/parallel_ntt_0/src" \
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

