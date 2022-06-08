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
// Test the function of butterfly computation
//////////////////////////////////////////////////////////////////////////////////


module parallel_ntt_0_butterfly_tb(
    );
// declaration of signals
reg clk;
reg resetn; 
reg m_axis_tready;
reg [3:0] strb;
reg [31:0] data;
reg last,  valid;
wire ready;
reg m_ready;
wire m_last, m_valid;
wire [31:0] m_data;
integer i,j;

reg ntt_start;
wire ntt_finish;

parameter PERIOD = 100; // clock period (ns)
parameter N = 1024; // Number of NTT points

//variables used in FILE IO
integer file_in, file_out;
integer scan;
reg [31:0] mem;

// instantiation of the parallel_ntt design below
parallel_ntt_0_wrapper DUT(
        // Users to add ports here
        .start              (ntt_start),
        .finish             (ntt_finish),
        // User ports ends
        // Do not modify the ports beyond this line


        // Ports of Axi Slave Bus Interface S_AXIS
        .s_axis_aclk        (clk),
        .s_axis_aresetn     (resetn),
        .s_axis_tready      (ready),
        .s_axis_tdata       (data),
        .s_axis_tstrb       (strb),
        .s_axis_tlast       (last),
        .s_axis_tvalid      (valid),

        // Ports of Axi Master Bus Interface M_AXIS
        .m_axis_aclk        (clk),
        .m_axis_aresetn     (resetn),
        .m_axis_tvalid      (m_valid),
        .m_axis_tdata       (m_data),
        .m_axis_tstrb       (),
        .m_axis_tlast       (m_last),
        .m_axis_tready      (m_ready)
    );

//this process block sets up the free running clock
initial begin
clk = 0;
forever #(PERIOD/2) clk = ~clk;
end

initial begin// this process block specifies the stimulus. 
resetn = 0;
m_axis_tready = 0;
valid = 0;
data = 0;
m_ready = 0;
ntt_start = 0;
last = 0;
strb = 4'b1111;
file_in = $fopen("E:/Dropbox/FHE/my project/Parallel NTT/hardware/ip_repo/parallel_ntt_2.0/src/data/NTT_points_in.txt", "r");
file_out = $fopen("E:/Dropbox/FHE/my project/Parallel NTT/hardware/ip_repo/parallel_ntt_2.0/src/data/NTT_points_out.txt", "w");
        

          

#(20*PERIOD)
resetn = 1;
#(20*PERIOD) // BE CAREFUL! valid signal must allign to the positive edge of clk 


//round-1 test: produce test data [0,1,...,31] for axis slave interface
for (i = 0; i < N; i = i+1) begin
    scan = $fscanf(file_in, "%d", mem);
    data = mem;
    #(PERIOD/4)
    valid = 1;
    if (i == N-1)
        last = 1;
    else 
        last = 0;    
    #(PERIOD-PERIOD/4);
end
$fclose(file_in); 
valid = 0;
last = 0;


#(5*PERIOD) // wait 5 cycles for UUT to finish writing completely
resetn = 0;
#(20*PERIOD)
resetn = 1;
#(20*PERIOD)
ntt_start = 1; // start NTT computation


@(posedge ntt_finish);
    #(20*PERIOD) $stop;
//round-1 test: produce test data for axis master interface
for (i = 0; i < N; i = i+1) begin
    m_ready = 1; // indicate the external axis slave is ready
    #PERIOD;
end

begin // wait on axi master read complete signal
@(posedge m_last);
    #PERIOD;
    m_ready = 0;
end

#(20*PERIOD) $stop;
end


always @(posedge m_valid) begin
    $display("output results: ");
    #(PERIOD/4);
    for (j  = 0; j < N; j = j+1) begin
        $fwrite(file_out, "%0d\n", m_data);
        $display("%d\n", m_data);
        #PERIOD;
    end
    $fclose(file_out); 
end


initial begin// this process block pipes the ASCII results to the 
//terminal or text editor
$timeformat(-9,1,"ns",12);
$display(" Time Clk Rstb Valid Ready Last Data");
$monitor("%t %b %b %b %b %b %b", $realtime, clk, resetn, valid, ready, last, data);
end

endmodule


