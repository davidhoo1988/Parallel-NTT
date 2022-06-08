
















create_clock -period 12.500 -name clk -waveform {0.000 6.250} [get_ports {m_axis_aclk s_axis_aclk}]
set_input_delay -clock [get_clocks *] 1.000 [get_ports {m_axis_aresetn m_axis_tready s_axis_aresetn {s_axis_tdata[0]} {s_axis_tdata[1]} {s_axis_tdata[2]} {s_axis_tdata[3]} {s_axis_tdata[4]} {s_axis_tdata[5]} {s_axis_tdata[6]} {s_axis_tdata[7]} {s_axis_tdata[8]} {s_axis_tdata[9]} {s_axis_tdata[10]} {s_axis_tdata[11]} {s_axis_tdata[12]} {s_axis_tdata[13]} {s_axis_tdata[14]} {s_axis_tdata[15]} {s_axis_tdata[16]} {s_axis_tdata[17]} {s_axis_tdata[18]} {s_axis_tdata[19]} {s_axis_tdata[20]} {s_axis_tdata[21]} {s_axis_tdata[22]} {s_axis_tdata[23]} {s_axis_tdata[24]} {s_axis_tdata[25]} {s_axis_tdata[26]} {s_axis_tdata[27]} {s_axis_tdata[28]} {s_axis_tdata[29]} {s_axis_tdata[30]} {s_axis_tdata[31]} s_axis_tlast {s_axis_tstrb[0]} {s_axis_tstrb[1]} {s_axis_tstrb[2]} {s_axis_tstrb[3]} s_axis_tvalid start}]
set_output_delay -clock [get_clocks clk] 1.000 [get_ports -filter { NAME =~  "*" && DIRECTION =~  "*OUT*" }]
