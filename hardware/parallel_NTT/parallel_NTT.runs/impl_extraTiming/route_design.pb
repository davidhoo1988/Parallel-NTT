
o
Command: %s
53*	vivadotcl2>
*route_design -directive NoTimingRelaxation2default:defaultZ4-113h px? 
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
i
Using Router directive '%s'.
20*	routeflow2&
NoTimingRelaxation2default:defaultZ35-270h px? 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
C
.Phase 1 Build RT Design | Checksum: 155c26ef6
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:04 ; elapsed = 00:00:53 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
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
-Phase 2.1 Create Timer | Checksum: 2564b93af
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:04 ; elapsed = 00:00:53 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
N
9Phase 2.2 Fix Topology Constraints | Checksum: 2564b93af
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:04 ; elapsed = 00:00:53 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
G
2Phase 2.3 Pre Route Cleanup | Checksum: 2564b93af
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:04 ; elapsed = 00:00:53 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
2.4 2default:default2,
Global Clock Net Routing2default:defaultZ18-101h px? 
N
9Phase 2.4 Global Clock Net Routing | Checksum: 169eb68b6
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:06 ; elapsed = 00:00:54 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
p

Phase %s%s
101*constraints2
2.5 2default:default2!
Update Timing2default:defaultZ18-101h px? 
C
.Phase 2.5 Update Timing | Checksum: 274a1d27e
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:09 ; elapsed = 00:00:56 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
?
Intermediate Timing Summary %s164*route2M
9| WNS=-45.477| TNS=-38810.801| WHS=-0.612 | THS=-3.384 |
2default:defaultZ35-416h px? 
I
4Phase 2 Router Initialization | Checksum: 2b602ecd7
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:13 ; elapsed = 00:00:58 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
C
.Phase 3 Initial Routing | Checksum: 2a46c19ab
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:15 ; elapsed = 00:00:59 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
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
Intermediate Timing Summary %s164*route2M
9| WNS=-45.478| TNS=-40445.227| WHS=-0.079 | THS=-0.137 |
2default:defaultZ35-416h px? 
H
3Phase 4.1 Global Iteration 0 | Checksum: 2731b8962
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:22 ; elapsed = 00:01:04 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
u

Phase %s%s
101*constraints2
4.2 2default:default2&
Global Iteration 12default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2M
9| WNS=-45.479| TNS=-39103.785| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.2 Global Iteration 1 | Checksum: 1f0ca82ec
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:27 ; elapsed = 00:01:09 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
u

Phase %s%s
101*constraints2
4.3 2default:default2&
Global Iteration 22default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2M
9| WNS=-45.479| TNS=-39026.531| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.3 Global Iteration 2 | Checksum: 208e409c0
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:27 ; elapsed = 00:01:09 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
F
1Phase 4 Rip-up And Reroute | Checksum: 208e409c0
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:27 ; elapsed = 00:01:09 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
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
0Phase 5.1.1 Update Timing | Checksum: 2a96ac4b4
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:29 ; elapsed = 00:01:10 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
?
Intermediate Timing Summary %s164*route2M
9| WNS=-45.478| TNS=-39028.223| WHS=0.022  | THS=0.000  |
2default:defaultZ35-416h px? 
C
.Phase 5.1 Delay CleanUp | Checksum: 2a96ac4b4
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:30 ; elapsed = 00:01:10 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px? 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 2a96ac4b4
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:30 ; elapsed = 00:01:10 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
O
:Phase 5 Delay and Skew Optimization | Checksum: 2a96ac4b4
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:30 ; elapsed = 00:01:10 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
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
0Phase 6.1.1 Update Timing | Checksum: 1f82b0c83
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:31 ; elapsed = 00:01:11 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
?
Intermediate Timing Summary %s164*route2M
9| WNS=-45.478| TNS=-39028.223| WHS=0.022  | THS=0.000  |
2default:defaultZ35-416h px? 
C
.Phase 6.1 Hold Fix Iter | Checksum: 1f82b0c83
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:31 ; elapsed = 00:01:11 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
A
,Phase 6 Post Hold Fix | Checksum: 1f82b0c83
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:31 ; elapsed = 00:01:11 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 7 Route finalize | Checksum: 29cb56f34
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:32 ; elapsed = 00:01:11 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
I
4Phase 8 Verifying routed nets | Checksum: 29cb56f34
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:32 ; elapsed = 00:01:11 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
E
0Phase 9 Depositing Routes | Checksum: 29cb56f34
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:32 ; elapsed = 00:01:12 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
10 2default:default2-
Leaf Clock Prog Delay Opt2default:defaultZ18-101h px? 
q

Phase %s%s
101*constraints2
10.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
s

Phase %s%s
101*constraints2
10.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
F
1Phase 10.1.1 Update Timing | Checksum: 1dea363b1
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:39 ; elapsed = 00:01:15 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
?
Intermediate Timing Summary %s164*route2M
9| WNS=-45.478| TNS=-39028.223| WHS=0.022  | THS=0.000  |
2default:defaultZ35-416h px? 
D
/Phase 10.1 Delay CleanUp | Checksum: 1dea363b1
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:39 ; elapsed = 00:01:15 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
q

Phase %s%s
101*constraints2
10.2 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
s

Phase %s%s
101*constraints2
10.2.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
F
1Phase 10.2.1 Update Timing | Checksum: 20e8d4036
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:42 ; elapsed = 00:01:17 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
?
Intermediate Timing Summary %s164*route2M
9| WNS=-45.478| TNS=-39028.223| WHS=0.022  | THS=0.000  |
2default:defaultZ35-416h px? 
D
/Phase 10.2 Hold Fix Iter | Checksum: 20e8d4036
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:42 ; elapsed = 00:01:17 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
N
9Phase 10 Leaf Clock Prog Delay Opt | Checksum: 275945aac
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:44 ; elapsed = 00:01:18 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
t

Phase %s%s
101*constraints2
11 2default:default2&
Post Router Timing2default:defaultZ18-101h px? 
?
Post Routing Timing Summary %s
20*route2M
9| WNS=-45.478| TNS=-39027.348| WHS=0.022  | THS=0.000  |
2default:defaultZ35-20h px? 
?
dThe design did not meet timing requirements. Please run report_timing_summary for detailed reports.
39*routeZ35-39h px? 
?
?TNS is the sum of the worst slack violation on every endpoint in the design. Review the paths with the biggest WNS violations in the timing reports and modify your constraints or your design to improve both WNS and TNS.
96*routeZ35-253h px? 
G
2Phase 11 Post Router Timing | Checksum: 282a96f1d
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:48 ; elapsed = 00:01:20 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
~

Phase %s%s
101*constraints2
12 2default:default20
Physical Synthesis in Router2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
12.1 2default:default25
!Physical Synthesis Initialization2default:defaultZ18-101h px? 
?
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
22default:defaultZ32-721h px? 
?
:%s %s Timing Summary | WNS=%s | TNS=%s | WHS=%s | THS=%s |342*physynth2
Current2default:default2
 2default:default2
-45.4782default:default2

-39027.3492default:default2
0.0222default:default2
0.0002default:defaultZ32-668h px? 
X
CPhase 12.1 Physical Synthesis Initialization | Checksum: 282a96f1d
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:53 ; elapsed = 00:01:26 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
?
?WARNING: Physical Optimization has determined that the magnitude of the negative slack is too large and it is highly unlikely that slack will be improved. Post-Route Physical Optimization is most effective when WNS is above -0.5ns400*physynthZ32-745h px? 
~

Phase %s%s
101*constraints2
12.2 2default:default2.
Critical Path Optimization2default:defaultZ18-101h px? 
?
:%s %s Timing Summary | WNS=%s | TNS=%s | WHS=%s | THS=%s |342*physynth2
Current2default:default2
 2default:default2
-45.4782default:default2

-39027.3492default:default2
0.0222default:default2
0.0002default:defaultZ32-668h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2?
9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish9parallel_ntt_0_instance/inst/parallel_NTT_top_inst/finish2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2J
s_axis_aclk_IBUF_inst/OUTs_axis_aclk_IBUF_inst/OUT2default:default8Z32-702h px? 
?
:%s %s Timing Summary | WNS=%s | TNS=%s | WHS=%s | THS=%s |342*physynth2
Current2default:default2
 2default:default2
-45.4782default:default2

-39027.3492default:default2
0.0222default:default2
0.0002default:defaultZ32-668h px? 
Q
<Phase 12.2 Critical Path Optimization | Checksum: 29b19d8da
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:56 ; elapsed = 00:01:28 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0112default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
?
OPost Physical Optimization Timing Summary | WNS=%s | TNS=%s | WHS=%s | THS=%s |343*physynth2
-45.4782default:default2

-39027.3492default:default2
0.0222default:default2
0.0002default:defaultZ32-669h px? 
P
;Phase 12 Physical Synthesis in Router | Checksum: 8e308c2f
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:57 ; elapsed = 00:01:28 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
p

Phase %s%s
101*constraints2
13 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 13 Route finalize | Checksum: 8e308c2f
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:57 ; elapsed = 00:01:28 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
@
Router Completed Successfully
2*	routeflowZ35-16h px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:57 ; elapsed = 00:01:28 . Memory (MB): peak = 4174.086 ; gain = 0.0002default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
3202default:default2
142default:default2
12default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:02:012default:default2
00:01:312default:default2
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
00:00:00.6782default:default2
4174.0862default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?E:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.runs/impl_extraTiming/parallel_ntt_0_wrapper_routed.dcp2default:defaultZ17-1381h px? 
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
?E:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.runs/impl_extraTiming/parallel_ntt_0_wrapper_drc_routed.rpt?E:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.runs/impl_extraTiming/parallel_ntt_0_wrapper_drc_routed.rpt2default:default8Z2-168h px? 
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
112default:default8@Z18-633h px? 
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
112default:default8@Z18-633h px? 
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
?E:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.runs/impl_extraTiming/parallel_ntt_0_wrapper_methodology_drc_routed.rpt?E:/Dropbox/FHE/my project/Parallel NTT/hardware/parallel_NTT/parallel_NTT.runs/impl_extraTiming/parallel_ntt_0_wrapper_methodology_drc_routed.rpt2default:default8Z2-1520h px? 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px? 
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
112default:default8@Z18-633h px? 
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
28*	vivadotcl2
3322default:default2
202default:default2
12default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
report_power: 2default:default2
00:00:142default:default2
00:00:112default:default2
4174.0862default:default2
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
rThe design failed to meet the timing requirements. Please see the %s report for details on the timing violations.
188*timing2"
timing summary2default:defaultZ38-282h px? 
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
4174.0862default:default2
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