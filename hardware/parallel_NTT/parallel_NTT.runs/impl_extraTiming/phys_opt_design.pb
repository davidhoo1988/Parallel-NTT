
g
Command: %s
53*	vivadotcl26
"phys_opt_design -directive Explore2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xczu7ev2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xczu7ev2default:defaultZ17-349h px? 
i
)Directive used for phys_opt_design is: %s68*	vivadotcl2
Explore2default:defaultZ4-137h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0112default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
a

Starting %s Task
103*constraints2&
Physical Synthesis2default:defaultZ18-103h px? 
?

Phase %s%s
101*constraints2
1 2default:default25
!Physical Synthesis Initialization2default:defaultZ18-101h px? 
?
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
22default:defaultZ32-721h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-45.5102default:default2

-38942.0462default:defaultZ32-619h px? 
U
@Phase 1 Physical Synthesis Initialization | Checksum: 112e94d79
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:05 ; elapsed = 00:00:02 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-45.5102default:default2

-38942.0462default:defaultZ32-619h px? 
t

Phase %s%s
101*constraints2
2 2default:default2'
Fanout Optimization2default:defaultZ18-101h px? 
?
=Pass %s. Identified %s candidate %s for fanout optimization.
76*physynth2
12default:default2
22default:default2
nets2default:defaultZ32-76h px? 
?
-Processed net %s. Net driver %s was replaced
317*physynth2?
Mparallel_ntt_0_instance/inst/parallel_NTT_top_inst/P1/data_dib[31]_i_1__0_n_0Mparallel_ntt_0_instance/inst/parallel_NTT_top_inst/P1/data_dib[31]_i_1__0_n_02default:default2?
Iparallel_ntt_0_instance/inst/parallel_NTT_top_inst/P1/data_dib[31]_i_1__0	Iparallel_ntt_0_instance/inst/parallel_NTT_top_inst/P1/data_dib[31]_i_1__02default:default8Z32-601h px? 
?
'Processed net %s. Replicated %s times.
81*physynth2?
Jparallel_ntt_0_instance/inst/parallel_NTT_top_inst/P0/data_dib[31]_i_1_n_0Jparallel_ntt_0_instance/inst/parallel_NTT_top_inst/P0/data_dib[31]_i_1_n_02default:default2
12default:default8Z32-81h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
22default:default2
nets2default:default2
12default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
22default:default2!
nets or cells2default:default2
12default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-45.5102default:default2

-38936.2902default:defaultZ32-619h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0192default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
F
1Phase 2 Fanout Optimization | Checksum: 92917b51
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:06 ; elapsed = 00:00:03 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
}

Phase %s%s
101*constraints2
3 2default:default20
Placement Based Optimization2default:defaultZ18-101h px? 
?
=Identified %s candidate %s for placement-based optimization.
334*physynth2
352default:default2
nets2default:defaultZ32-660h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish2default:default2?
Aparallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish_reg_reg	Aparallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish_reg_reg2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Hparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tvalidHparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tvalid2default:default2?
Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tvalid_delay_reg	Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tvalid_delay_reg2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Gparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tlastGparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tlast2default:default2?
Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tlast_delay6_reg	Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tlast_delay6_reg2default:default8Z32-662h px? 
?
(Processed net %s.  Re-placed instance %s337*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[28]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[28]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[28]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[28]2default:default8Z32-663h px? 
?
(Processed net %s.  Re-placed instance %s337*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[31]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[31]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[31]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[31]2default:default8Z32-663h px? 
?
(Processed net %s.  Re-placed instance %s337*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[16]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[16]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[16]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[16]2default:default8Z32-663h px? 
?
(Processed net %s.  Re-placed instance %s337*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[25]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[25]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[25]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[25]2default:default8Z32-663h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[7]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[7]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[7]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[7]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[6]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[6]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[6]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[6]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[11]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[11]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[11]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[11]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[10]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[10]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[10]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[10]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[3]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[3]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[3]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[3]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[2]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[2]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[2]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[2]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[9]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[9]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[9]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[9]2default:default8Z32-662h px? 
?
(Processed net %s.  Re-placed instance %s337*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[19]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[19]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[19]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[19]2default:default8Z32-663h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[8]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[8]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[8]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[8]2default:default8Z32-662h px? 
?
(Processed net %s.  Re-placed instance %s337*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[24]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[24]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[24]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[24]2default:default8Z32-663h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[4]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[4]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[4]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[4]2default:default8Z32-662h px? 
?
(Processed net %s.  Re-placed instance %s337*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[1]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[1]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[1]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[1]2default:default8Z32-663h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[5]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[5]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[5]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[5]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[0]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[0]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[0]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[0]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[30]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[30]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[30]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[30]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[29]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[29]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[29]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[29]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[26]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[26]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[26]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[26]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[27]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[27]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[27]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[27]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[17]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[17]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[17]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[17]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[13]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[13]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[13]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[13]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[12]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[12]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[12]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[12]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[20]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[20]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[20]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[20]2default:default8Z32-662h px? 
?
(Processed net %s.  Re-placed instance %s337*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[23]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[23]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[23]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[23]2default:default8Z32-663h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[22]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[22]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[22]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[22]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[21]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[21]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[21]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[21]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[14]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[14]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[14]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[14]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[15]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[15]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[15]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[15]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[18]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[18]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[18]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[18]2default:default8Z32-662h px? 
?
#Optimized %s %s.  Re-placed %s %s.
335*physynth2
82default:default2
nets2default:default2
82default:default2
	instances2default:defaultZ32-661h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
82default:default2!
nets or cells2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
82default:default2
cells2default:defaultZ32-775h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-45.5102default:default2

-38936.1592default:defaultZ32-619h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0192default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
O
:Phase 3 Placement Based Optimization | Checksum: 76f56f6c
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:11 ; elapsed = 00:00:06 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
g

Phase %s%s
101*constraints2
4 2default:default2
Rewire2default:defaultZ18-101h px? 
a
Starting %s optimization...
227*physynth2
Signal Push2default:defaultZ32-246h px? 
h
.No nets found for rewiring (%s) optimization.
222*physynth2
 2default:defaultZ32-241h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0112default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
9
$Phase 4 Rewire | Checksum: 76f56f6c
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:11 ; elapsed = 00:00:06 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
5 2default:default2.
Critical Cell Optimization2default:defaultZ18-101h px? 
?
;Identified %s candidate %s for critical-cell optimization.
46*physynth2
12default:default2
net2default:defaultZ32-46h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2?
9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish2default:default8Z32-572h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0122default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
N
9Phase 5 Critical Cell Optimization | Checksum: 139e17fdc
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:11 ; elapsed = 00:00:06 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
t

Phase %s%s
101*constraints2
6 2default:default2'
Fanout Optimization2default:defaultZ18-101h px? 
?
=Pass %s. Identified %s candidate %s for fanout optimization.
76*physynth2
12default:default2
12default:default2
net2default:defaultZ32-76h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2?
Mparallel_ntt_0_instance/inst/parallel_NTT_top_inst/P1/data_dib[31]_i_1__0_n_0Mparallel_ntt_0_instance/inst/parallel_NTT_top_inst/P1/data_dib[31]_i_1__0_n_02default:default8Z32-572h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0122default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
G
2Phase 6 Fanout Optimization | Checksum: 15c6497d2
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:11 ; elapsed = 00:00:07 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
}

Phase %s%s
101*constraints2
7 2default:default20
Placement Based Optimization2default:defaultZ18-101h px? 
?
=Identified %s candidate %s for placement-based optimization.
334*physynth2
352default:default2
nets2default:defaultZ32-660h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish2default:default2?
Aparallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish_reg_reg	Aparallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish_reg_reg2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Hparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tvalidHparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tvalid2default:default2?
Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tvalid_delay_reg	Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tvalid_delay_reg2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Gparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tlastGparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tlast2default:default2?
Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tlast_delay6_reg	Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tlast_delay6_reg2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[7]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[7]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[7]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[7]2default:default8Z32-662h px? 
?
(Processed net %s.  Re-placed instance %s337*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[16]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[16]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[16]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[16]2default:default8Z32-663h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[6]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[6]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[6]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[6]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[11]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[11]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[11]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[11]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[10]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[10]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[10]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[10]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[3]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[3]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[3]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[3]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[2]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[2]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[2]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[2]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[9]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[9]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[9]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[9]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[8]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[8]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[8]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[8]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[28]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[28]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[28]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[28]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[24]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[24]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[24]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[24]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[4]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[4]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[4]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[4]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[5]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[5]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[5]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[5]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[0]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[0]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[0]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[0]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[1]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[1]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[1]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[1]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[31]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[31]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[31]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[31]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[30]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[30]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[30]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[30]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[29]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[29]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[29]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[29]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[26]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[26]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[26]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[26]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[27]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[27]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[27]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[27]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[17]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[17]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[17]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[17]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[13]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[13]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[13]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[13]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[12]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[12]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[12]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[12]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[25]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[25]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[25]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[25]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[20]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[20]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[20]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[20]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[22]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[22]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[22]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[22]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[23]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[23]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[23]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[23]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[21]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[21]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[21]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[21]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[14]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[14]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[14]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[14]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[15]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[15]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[15]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[15]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[19]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[19]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[19]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[19]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[18]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[18]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[18]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[18]2default:default8Z32-662h px? 
?
#Optimized %s %s.  Re-placed %s %s.
335*physynth2
12default:default2
net2default:default2
12default:default2
instance2default:defaultZ32-661h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
12default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
12default:default2
cell2default:defaultZ32-775h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-45.5102default:default2

-38936.1012default:defaultZ32-619h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0122default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
P
;Phase 7 Placement Based Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:16 ; elapsed = 00:00:10 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
g

Phase %s%s
101*constraints2
8 2default:default2
Rewire2default:defaultZ18-101h px? 
a
Starting %s optimization...
227*physynth2
Signal Push2default:defaultZ32-246h px? 
h
.No nets found for rewiring (%s) optimization.
222*physynth2
 2default:defaultZ32-241h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0142default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
:
%Phase 8 Rewire | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:16 ; elapsed = 00:00:10 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
9 2default:default2.
Critical Cell Optimization2default:defaultZ18-101h px? 
P
.No nets found for critical-cell optimization.
68*physynthZ32-68h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
N
9Phase 9 Critical Cell Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:16 ; elapsed = 00:00:10 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
10 2default:default2-
Slr Crossing Optimization2default:defaultZ18-101h px? 
N
9Phase 10 Slr Crossing Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:16 ; elapsed = 00:00:10 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
u

Phase %s%s
101*constraints2
11 2default:default2'
Fanout Optimization2default:defaultZ18-101h px? 
I
'No nets found for fanout-optimization.
64*physynthZ32-64h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
H
3Phase 11 Fanout Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:16 ; elapsed = 00:00:10 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
~

Phase %s%s
101*constraints2
12 2default:default20
Placement Based Optimization2default:defaultZ18-101h px? 
?
=Identified %s candidate %s for placement-based optimization.
334*physynth2
352default:default2
nets2default:defaultZ32-660h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish2default:default2?
Aparallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish_reg_reg	Aparallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish_reg_reg2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Hparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tvalidHparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tvalid2default:default2?
Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tvalid_delay_reg	Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tvalid_delay_reg2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Gparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tlastGparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tlast2default:default2?
Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tlast_delay6_reg	Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tlast_delay6_reg2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[7]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[7]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[7]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[7]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[6]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[6]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[6]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[6]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[11]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[11]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[11]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[11]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[10]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[10]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[10]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[10]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[3]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[3]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[3]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[3]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[2]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[2]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[2]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[2]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[9]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[9]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[9]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[9]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[8]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[8]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[8]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[8]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[28]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[28]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[28]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[28]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[24]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[24]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[24]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[24]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[4]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[4]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[4]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[4]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[5]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[5]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[5]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[5]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[0]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[0]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[0]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[0]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[1]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[1]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[1]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[1]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[31]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[31]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[31]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[31]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[30]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[30]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[30]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[30]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[29]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[29]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[29]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[29]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[26]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[26]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[26]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[26]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[27]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[27]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[27]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[27]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[17]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[17]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[17]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[17]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[16]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[16]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[16]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[16]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[13]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[13]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[13]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[13]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[12]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[12]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[12]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[12]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[25]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[25]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[25]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[25]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[20]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[20]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[20]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[20]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[22]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[22]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[22]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[22]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[23]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[23]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[23]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[23]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[21]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[21]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[21]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[21]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[14]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[14]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[14]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[14]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[15]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[15]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[15]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[15]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[19]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[19]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[19]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[19]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[18]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[18]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[18]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[18]2default:default8Z32-662h px? 
?
#Optimized %s %s.  Re-placed %s %s.
335*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-661h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0272default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
Q
<Phase 12 Placement Based Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
h

Phase %s%s
101*constraints2
13 2default:default2
Rewire2default:defaultZ18-101h px? 
a
Starting %s optimization...
227*physynth2
Signal Push2default:defaultZ32-246h px? 
h
.No nets found for rewiring (%s) optimization.
222*physynth2
 2default:defaultZ32-241h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0112default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
;
&Phase 13 Rewire | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
|

Phase %s%s
101*constraints2
14 2default:default2.
Critical Cell Optimization2default:defaultZ18-101h px? 
P
.No nets found for critical-cell optimization.
68*physynthZ32-68h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
O
:Phase 14 Critical Cell Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
15 2default:default2-
DSP Register Optimization2default:defaultZ18-101h px? 
j
FNo candidate cells for DSP register optimization found in the design.
274*physynthZ32-456h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
N
9Phase 15 DSP Register Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
|

Phase %s%s
101*constraints2
16 2default:default2.
BRAM Register Optimization2default:defaultZ18-101h px? 
i
ENo candidate cells for BRAM register optimization found in the design297*physynthZ32-526h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
O
:Phase 16 BRAM Register Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
|

Phase %s%s
101*constraints2
17 2default:default2.
URAM Register Optimization2default:defaultZ18-101h px? 
j
FNo candidate cells for URAM register optimization found in the design
437*physynthZ32-846h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
O
:Phase 17 URAM Register Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
}

Phase %s%s
101*constraints2
18 2default:default2/
Shift Register Optimization2default:defaultZ18-101h px? 
h
DNo candidate cells for SRL register optimization found in the design349*physynthZ32-677h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
P
;Phase 18 Shift Register Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
19 2default:default2-
DSP Register Optimization2default:defaultZ18-101h px? 
j
FNo candidate cells for DSP register optimization found in the design.
274*physynthZ32-456h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
N
9Phase 19 DSP Register Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
|

Phase %s%s
101*constraints2
20 2default:default2.
BRAM Register Optimization2default:defaultZ18-101h px? 
i
ENo candidate cells for BRAM register optimization found in the design297*physynthZ32-526h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
O
:Phase 20 BRAM Register Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
|

Phase %s%s
101*constraints2
21 2default:default2.
URAM Register Optimization2default:defaultZ18-101h px? 
j
FNo candidate cells for URAM register optimization found in the design
437*physynthZ32-846h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
O
:Phase 21 URAM Register Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
}

Phase %s%s
101*constraints2
22 2default:default2/
Shift Register Optimization2default:defaultZ18-101h px? 
h
DNo candidate cells for SRL register optimization found in the design349*physynthZ32-677h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
P
;Phase 22 Shift Register Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
23 2default:default2-
Critical Pin Optimization2default:defaultZ18-101h px? 
[
7No candidate nets found for critical-pin optimization.
321*physynthZ32-607h px? 
?
!Optimized %s %s.  Swapped %s %s.
322*physynth2
02default:default2
net2default:default2
02default:default2
pin2default:defaultZ32-608h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
N
9Phase 23 Critical Pin Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 


Phase %s%s
101*constraints2
24 2default:default21
Very High Fanout Optimization2default:defaultZ18-101h px? 
K
)No high fanout nets found in the design.
65*physynthZ32-65h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
R
=Phase 24 Very High Fanout Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:13 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
~

Phase %s%s
101*constraints2
25 2default:default20
Placement Based Optimization2default:defaultZ18-101h px? 
?
=Identified %s candidate %s for placement-based optimization.
334*physynth2
352default:default2
nets2default:defaultZ32-660h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish2default:default2?
Aparallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish_reg_reg	Aparallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish_reg_reg2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Hparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tvalidHparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tvalid2default:default2?
Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tvalid_delay_reg	Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tvalid_delay_reg2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Gparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tlastGparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tlast2default:default2?
Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tlast_delay6_reg	Pparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/axis_tlast_delay6_reg2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[7]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[7]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[7]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[7]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[6]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[6]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[6]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[6]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[11]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[11]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[11]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[11]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[10]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[10]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[10]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[10]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[3]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[3]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[3]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[3]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[2]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[2]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[2]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[2]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[9]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[9]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[9]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[9]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[8]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[8]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[8]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[8]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[28]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[28]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[28]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[28]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[24]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[24]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[24]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[24]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[4]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[4]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[4]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[4]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[5]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[5]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[5]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[5]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[0]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[0]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[0]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[0]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[1]Jparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[1]2default:default2?
Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[1]	Qparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[1]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[31]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[31]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[31]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[31]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[30]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[30]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[30]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[30]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[29]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[29]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[29]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[29]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[26]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[26]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[26]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[26]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[27]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[27]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[27]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[27]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[17]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[17]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[17]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[17]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[16]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[16]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[16]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[16]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[13]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[13]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[13]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[13]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[12]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[12]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[12]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[12]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[25]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[25]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[25]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[25]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[20]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[20]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[20]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[20]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[22]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[22]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[22]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[22]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[23]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[23]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[23]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[23]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[21]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[21]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[21]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[21]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[14]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[14]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[14]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[14]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[15]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[15]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[15]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[15]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[19]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[19]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[19]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[19]2default:default8Z32-662h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[18]Kparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/m_axis_tdata[18]2default:default2?
Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[18]	Rparallel_ntt_0_instance/inst/parallel_ntt_v1_0_M_AXIS_inst/stream_data_out_reg[18]2default:default8Z32-662h px? 
?
#Optimized %s %s.  Re-placed %s %s.
335*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-661h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0132default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
Q
<Phase 25 Placement Based Optimization | Checksum: 16efe2d6a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:26 ; elapsed = 00:00:16 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
|

Phase %s%s
101*constraints2
26 2default:default2.
Critical Path Optimization2default:defaultZ18-101h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-45.5102default:default2

-38936.1012default:defaultZ32-619h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish2default:default2?
Aparallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish_reg_reg	Aparallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish_reg_reg2default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2?
9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish2default:default8Z32-572h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2?
9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2J
s_axis_aclk_IBUF_inst/OUTs_axis_aclk_IBUF_inst/OUT2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2.
s_axis_aclks_axis_aclk2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2?
9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish2default:default2?
Aparallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish_reg_reg	Aparallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish_reg_reg2default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2?
9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2J
s_axis_aclk_IBUF_inst/OUTs_axis_aclk_IBUF_inst/OUT2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2.
s_axis_aclks_axis_aclk2default:default8Z32-702h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-45.5102default:default2

-38936.1012default:defaultZ32-619h px? 
O
:Phase 26 Critical Path Optimization | Checksum: 1373c58c2
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:26 ; elapsed = 00:00:16 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
z

Phase %s%s
101*constraints2
27 2default:default2,
BRAM Enable Optimization2default:defaultZ18-101h px? 
M
8Phase 27 BRAM Enable Optimization | Checksum: 1373c58c2
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:26 ; elapsed = 00:00:17 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0122default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
?
>Post Physical Optimization Timing Summary | WNS=%s | TNS=%s |
318*physynth2
-45.5102default:default2

-38936.1012default:defaultZ32-603h px? 
B
-
Summary of Physical Synthesis Optimizations
*commonh px? 
B
-============================================
*commonh px? 


*commonh px? 


*commonh px? 
?
?-----------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Optimization       |  WNS Gain (ns)  |  TNS Gain (ns)  |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Fanout             |          0.000  |          5.755  |            1  |              0  |                     2  |           0  |           3  |  00:00:01  |
|  Placement Based    |          0.000  |          0.189  |            0  |              0  |                     9  |           0  |           4  |  00:00:12  |
|  Rewire             |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           3  |  00:00:00  |
|  Critical Cell      |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           3  |  00:00:00  |
|  Slr Crossing       |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  DSP Register       |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           2  |  00:00:00  |
|  BRAM Register      |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           2  |  00:00:00  |
|  URAM Register      |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           2  |  00:00:00  |
|  Shift Register     |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           2  |  00:00:00  |
|  Critical Pin       |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Very High Fanout   |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  BRAM Enable        |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Critical Path      |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Total              |          0.000  |          5.944  |            1  |              0  |                    11  |           0  |          26  |  00:00:14  |
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 


*commonh px? 


*commonh px? 
I
4Ending Physical Synthesis Task | Checksum: fca54e26
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:27 ; elapsed = 00:00:17 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
2902default:default2
132default:default2
02default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
phys_opt_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
phys_opt_design: 2default:default2
00:00:312default:default2
00:00:192default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:022default:default2 
00:00:00.5462default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?E:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.runs/impl_extraTiming/parallel_ntt_0_wrapper_physopt.dcp2default:defaultZ17-1381h px? 


End Record