
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px? 
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
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px? 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
B
-Phase 1 Build RT Design | Checksum: adac1065
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:10 ; elapsed = 00:00:57 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px? 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px? 
B
-Phase 2.1 Create Timer | Checksum: 1d77d7626
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:10 ; elapsed = 00:00:58 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
N
9Phase 2.2 Fix Topology Constraints | Checksum: 1d77d7626
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:10 ; elapsed = 00:00:58 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
G
2Phase 2.3 Pre Route Cleanup | Checksum: 1d77d7626
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:10 ; elapsed = 00:00:58 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
2.4 2default:default2,
Global Clock Net Routing2default:defaultZ18-101h px? 
N
9Phase 2.4 Global Clock Net Routing | Checksum: 216e6da47
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:12 ; elapsed = 00:00:59 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
p

Phase %s%s
101*constraints2
2.5 2default:default2!
Update Timing2default:defaultZ18-101h px? 
C
.Phase 2.5 Update Timing | Checksum: 267b40ecd
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:18 ; elapsed = 00:01:03 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=44.119 | TNS=0.000  | WHS=-0.361 | THS=-24.642|
2default:defaultZ35-416h px? 
I
4Phase 2 Router Initialization | Checksum: 26f3926f0
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:25 ; elapsed = 00:01:07 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
C
.Phase 3 Initial Routing | Checksum: 1dc1fe431
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:28 ; elapsed = 00:01:09 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px? 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=44.031 | TNS=0.000  | WHS=-0.044 | THS=-0.193 |
2default:defaultZ35-416h px? 
H
3Phase 4.1 Global Iteration 0 | Checksum: 1eb71aebf
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:38 ; elapsed = 00:01:15 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
4.2 2default:default21
Additional Iteration for Hold2default:defaultZ18-101h px? 
S
>Phase 4.2 Additional Iteration for Hold | Checksum: 1b40102c5
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:38 ; elapsed = 00:01:15 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
F
1Phase 4 Rip-up And Reroute | Checksum: 1b40102c5
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:39 ; elapsed = 00:01:15 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 5.1.1 Update Timing | Checksum: 239e2e661
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:42 ; elapsed = 00:01:17 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=44.031 | TNS=0.000  | WHS=0.017  | THS=0.000  |
2default:defaultZ35-416h px? 
C
.Phase 5.1 Delay CleanUp | Checksum: 239e2e661
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:42 ; elapsed = 00:01:17 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px? 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 239e2e661
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:42 ; elapsed = 00:01:17 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
O
:Phase 5 Delay and Skew Optimization | Checksum: 239e2e661
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:42 ; elapsed = 00:01:17 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 6.1.1 Update Timing | Checksum: 2a5cb056b
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:45 ; elapsed = 00:01:19 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=44.031 | TNS=0.000  | WHS=0.017  | THS=0.000  |
2default:defaultZ35-416h px? 
C
.Phase 6.1 Hold Fix Iter | Checksum: 20bb643dc
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:45 ; elapsed = 00:01:19 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
A
,Phase 6 Post Hold Fix | Checksum: 20bb643dc
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:45 ; elapsed = 00:01:19 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 7 Route finalize | Checksum: 1ca975e41
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:46 ; elapsed = 00:01:19 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
I
4Phase 8 Verifying routed nets | Checksum: 1ca975e41
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:46 ; elapsed = 00:01:19 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
E
0Phase 9 Depositing Routes | Checksum: 1ca975e41
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:46 ; elapsed = 00:01:20 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px? 
?
Estimated Timing Summary %s
57*route2J
6| WNS=44.031 | TNS=0.000  | WHS=0.017  | THS=0.000  |
2default:defaultZ35-57h px? 
?
?The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px? 
G
2Phase 10 Post Router Timing | Checksum: 1ca975e41
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:46 ; elapsed = 00:01:20 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
@
Router Completed Successfully
2*	routeflowZ35-16h px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:46 ; elapsed = 00:01:20 . Memory (MB): peak = 4025.531 ; gain = 0.0002default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
732default:default2
132default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:01:512default:default2
00:01:232default:default2
4025.5312default:default2
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
00:00:042default:default2
00:00:012default:default2
4025.5312default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
wE:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.runs/impl_1/parallel_ntt_0_wrapper_routed.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
?Executing : report_drc -file parallel_ntt_0_wrapper_drc_routed.rpt -pb parallel_ntt_0_wrapper_drc_routed.pb -rpx parallel_ntt_0_wrapper_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
?report_drc -file parallel_ntt_0_wrapper_drc_routed.rpt -pb parallel_ntt_0_wrapper_drc_routed.pb -rpx parallel_ntt_0_wrapper_drc_routed.rpx2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
{E:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.runs/impl_1/parallel_ntt_0_wrapper_drc_routed.rpt{E:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.runs/impl_1/parallel_ntt_0_wrapper_drc_routed.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 
?
%s4*runtcl2?
?Executing : report_methodology -file parallel_ntt_0_wrapper_methodology_drc_routed.rpt -pb parallel_ntt_0_wrapper_methodology_drc_routed.pb -rpx parallel_ntt_0_wrapper_methodology_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
?report_methodology -file parallel_ntt_0_wrapper_methodology_drc_routed.rpt -pb parallel_ntt_0_wrapper_methodology_drc_routed.pb -rpx parallel_ntt_0_wrapper_methodology_drc_routed.rpx2default:defaultZ4-113h px? 
?
"Creating clock %s with %s sources.582*constraints2
clk2default:default2
22default:default2?
?e:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.srcs/sources_1/ip/parallel_ntt_0/src/user_constrain.xdc2default:default2
22default:default8@Z18-633h px? 
?
"Creating clock %s with %s sources.582*constraints2
clk2default:default2
22default:default2m
WE:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/user_rtl/usr_constrain.xdc2default:default2
102default:default8@Z18-633h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?
"Creating clock %s with %s sources.582*constraints2
clk2default:default2
22default:default2?
?e:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.srcs/sources_1/ip/parallel_ntt_0/src/user_constrain.xdc2default:default2
22default:default8@Z18-633h px? 
?
"Creating clock %s with %s sources.582*constraints2
clk2default:default2
22default:default2m
WE:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/user_rtl/usr_constrain.xdc2default:default2
102default:default8@Z18-633h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px? 
?
2The results of Report Methodology are in file %s.
450*coretcl2?
?E:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.runs/impl_1/parallel_ntt_0_wrapper_methodology_drc_routed.rpt?E:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.runs/impl_1/parallel_ntt_0_wrapper_methodology_drc_routed.rpt2default:default8Z2-1520h px? 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2(
report_methodology: 2default:default2
00:00:142default:default2
00:00:082default:default2
4025.5312default:default2
0.0002default:defaultZ17-268h px? 
?
%s4*runtcl2?
?Executing : report_power -file parallel_ntt_0_wrapper_power_routed.rpt -pb parallel_ntt_0_wrapper_power_summary_routed.pb -rpx parallel_ntt_0_wrapper_power_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
?report_power -file parallel_ntt_0_wrapper_power_routed.rpt -pb parallel_ntt_0_wrapper_power_summary_routed.pb -rpx parallel_ntt_0_wrapper_power_routed.rpx2default:defaultZ4-113h px? 
?
"Creating clock %s with %s sources.582*constraints2
clk2default:default2
22default:default2?
?e:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.srcs/sources_1/ip/parallel_ntt_0/src/user_constrain.xdc2default:default2
22default:default8@Z18-633h px? 
?
"Creating clock %s with %s sources.582*constraints2
clk2default:default2
22default:default2m
WE:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/user_rtl/usr_constrain.xdc2default:default2
102default:default8@Z18-633h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
852default:default2
192default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
report_power: 2default:default2
00:00:162default:default2
00:00:122default:default2
4025.5312default:default2
0.0002default:defaultZ17-268h px? 
?
%s4*runtcl2?
yExecuting : report_route_status -file parallel_ntt_0_wrapper_route_status.rpt -pb parallel_ntt_0_wrapper_route_status.pb
2default:defaulth px? 
?
%s4*runtcl2?
?Executing : report_timing_summary -max_paths 10 -file parallel_ntt_0_wrapper_timing_summary_routed.rpt -pb parallel_ntt_0_wrapper_timing_summary_routed.pb -rpx parallel_ntt_0_wrapper_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px? 
?
UpdateTimingParams:%s.
91*timing2h
T Speed grade: -2, Temperature grade: E, Delay Type: min_max, Timing Stage: Requireds2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 
?
%s4*runtcl2s
_Executing : report_incremental_reuse -file parallel_ntt_0_wrapper_incremental_reuse_routed.rpt
2default:defaulth px? 
x
TNo incremental reuse to report, no incremental placement and routing data was found.278*	vivadotclZ4-545h px? 
?
%s4*runtcl2s
_Executing : report_clock_utilization -file parallel_ntt_0_wrapper_clock_utilization_routed.rpt
2default:defaulth px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
report_clock_utilization: 2default:default2
00:00:062default:default2
00:00:062default:default2
4025.5312default:default2
0.0002default:defaultZ17-268h px? 
?
%s4*runtcl2?
rExecuting : report_bus_skew -warn_on_violation -file route_report_bus_skew_0.rpt -rpx route_report_bus_skew_0.rpx
2default:defaulth px? 
?
UpdateTimingParams:%s.
91*timing2h
T Speed grade: -2, Temperature grade: E, Delay Type: min_max, Timing Stage: Requireds2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 


End Record