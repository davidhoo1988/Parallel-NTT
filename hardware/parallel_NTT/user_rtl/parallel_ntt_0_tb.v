`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2021 11:37:30 AM
// Design Name: 
// Module Name: parallel_ntt_0_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module parallel_ntt_0_tb(
    );

reg clk;
reg resetn; // declaration of signals
reg m_axis_tready;
reg [3:0] strb;
reg [31:0] data;
reg last, ready, valid;
reg m_ready;
wire m_last;
integer i;

// instantiation of the parallel_ntt design below
parallel_ntt_0 DUT(
        // Users to add ports here

        // User ports ends
        // Do not modify the ports beyond this line


        // Ports of Axi Slave Bus Interface S_AXIS
        .s_axis_aclk        (clk),
        .s_axis_aresetn     (resetn),
        .s_axis_tready      (),
        .s_axis_tdata       (data),
        .s_axis_tstrb       (strb),
        .s_axis_tlast       (last),
        .s_axis_tvalid      (valid),

        // Ports of Axi Master Bus Interface M_AXIS
        .m_axis_aclk        (clk),
        .m_axis_aresetn     (resetn),
        .m_axis_tvalid      (),
        .m_axis_tdata       (),
        .m_axis_tstrb       (),
        .m_axis_tlast       (m_last),
        .m_axis_tready      (m_ready)
    );

//this process block sets up the free running clock
initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin// this process block specifies the stimulus. 
resetn = 0;
m_axis_tready = 0;
valid = 0;
m_ready = 0;
#200
resetn = 1;
#10 // BE CAREFUL! valid signal must allign to the positive edge of clk 
valid = 1;
data = 0;
//round-1 test: produce test data [0,1,...,31] for axis slave interface
#10
for (i = 0; i < 32; i = i+1) begin
    data = i;
    valid = 1;
    if (i == 32-1)
        last = 1;
    else 
        last = 0;    
    #10;
end
valid = 0;
last = 0;


#50 // wait 5 cycles for UUT to finish writing completely
resetn = 0;
#200
resetn = 1;
#10
valid = 1;
//round-2 test: produce test data [31,30,...,0] for axis slave interface
for (i = 0; i < 32; i = i+1) begin
    data = 32-1-i;
    valid = 1;
    if (i == 32-1)
        last = 1;
    else 
        last = 0;    
    #10;
end
valid = 0;
last = 0;



#50 // wait 5 cycles for UUT to finish writing completely
resetn = 0;
#200
resetn = 1;
#10

//round-1 test: produce test data for axis master interface
for (i = 0; i < 32; i = i+1) begin
    m_ready = 1; // indicate the external axis slave is ready
    #10;
end


begin // wait on axi master read complete signal
@(posedge m_last);
    #10;
    m_ready = 0;
end

//round-2 test: produce test data for axis master interface, need resetn to restart the axis master
resetn = 0;
#200
resetn = 1;
#15

for (i = 0; i < 32; i = i+1) begin
    m_ready = 1;
    #10;
end

#1000 $stop;
end

initial begin// this process block pipes the ASCII results to the 
//terminal or text editor
$timeformat(-9,1,"ns",12);
$display(" Time Clk Rstb Valid Ready Last Data");
$monitor("%t %b %b %b %b %b %b", $realtime, clk, resetn, valid, ready, last, data);
end

endmodule


