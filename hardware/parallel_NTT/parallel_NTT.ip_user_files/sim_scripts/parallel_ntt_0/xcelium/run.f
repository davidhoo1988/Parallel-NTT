-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xbip_utils_v3_0_9 \
  "../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_pipe_v3_0_5 \
  "../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_bram18k_v3_0_5 \
  "../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/mult_gen_v12_0_14 \
  "../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../ip/parallel_ntt_0/src/mult_gen_32x32/sim/mult_gen_32x32.vhd" \
  "../../../ip/parallel_ntt_0/src/mult_gen_64x33/sim/mult_gen_64x33.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../ip/parallel_ntt_0/hdl/parallel_ntt_v2_0_S_AXIS.v" \
  "../../../ip/parallel_ntt_0/src/NTT_processor.v" \
  "../../../ip/parallel_ntt_0/src/mem_sp.v" \
  "../../../ip/parallel_ntt_0/src/Barret_reduce.v" \
  "../../../ip/parallel_ntt_0/src/parallel_NTT_top.v" \
  "../../../ip/parallel_ntt_0/src/mem_dp.v" \
  "../../../ip/parallel_ntt_0/hdl/parallel_ntt_v2_0_M_AXIS.v" \
  "../../../ip/parallel_ntt_0/hdl/parallel_ntt_v2_0.v" \
  "../../../ip/parallel_ntt_0/sim/parallel_ntt_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

