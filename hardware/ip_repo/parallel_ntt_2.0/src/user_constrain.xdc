
create_clock -period 100.000 -name clk -waveform {0.000 50.000} [get_ports {m_axis_aclk s_axis_aclk}]
