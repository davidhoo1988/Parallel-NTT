@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Fri Nov 12 20:05:09 +0800 2021
REM SW Build 2188600 on Wed Apr  4 18:40:38 MDT 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
call xsim parallel_ntt_0_butterfly_tb_time_synth -key {Post-Synthesis:sim_ntt:Timing:parallel_ntt_0_butterfly_tb} -tclbatch parallel_ntt_0_butterfly_tb.tcl -view E:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.sim/sim_ntt/behav/xsim/parallel_ntt_0_butterfly_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
