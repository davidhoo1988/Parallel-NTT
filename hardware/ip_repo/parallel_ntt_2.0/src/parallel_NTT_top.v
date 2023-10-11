`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2021 07:19:03 PM
// Design Name: 
// Module Name: parallel_NTT_top
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
// the fundamental logic for parallel_NTT_top is the data movement
// between processor ram and external. The data channel is 32-bit wide,
// and only one processor is selected per time
//////////////////////////////////////////////////////////////////////////////////

module parallel_NTT_top(
    input wire clk,
    input wire rst_b, // reset signal, enabled if set low
    input wire start, //trigger this signal to start NTT computation
    output wire finish, //indicator signal set high if NTT computation is finished
    // related to slave interface, send data to ram
    input wire [31:0] s_processor_din,  // data channel from external to processor ram
    input wire [1:0] s_processor_num, // indicator signal suggesting which proceesor is ready for data transfer from external to processor ram
    input wire s_processor_din_valid, //indicator signal set high if the input data is valid
    // related to master interface, request data from ram
    output reg [31:0] m_processor_dout, //data channel from processor ram to external 
    output reg m_processor_dout_valid, // indicator signal set high if the data inside processor ram is ready for transfer
    input wire [1:0] m_processor_num, //indicator signal suggesting which processor is ready for data transfer from processor ram to external
    input wire m_processor_num_valid //indicator signal set high if the slected processor is valid
    );

// declare port signals
reg     P0_extra_connect_din_valid;
reg     P1_extra_connect_din_valid;
reg     P2_extra_connect_din_valid;
reg     P3_extra_connect_din_valid;

reg [31:0] s_processor_din_delay;

wire [31:0] P0_extra_connect_dout;
wire [31:0] P1_extra_connect_dout;
wire [31:0] P2_extra_connect_dout;
wire [31:0] P3_extra_connect_dout;

wire    P0_extra_connect_dout_valid;
wire    P1_extra_connect_dout_valid;
wire    P2_extra_connect_dout_valid;
wire    P3_extra_connect_dout_valid;

reg    P0_extra_connect_read_valid;
reg    P1_extra_connect_read_valid;
reg    P2_extra_connect_read_valid;
reg    P3_extra_connect_read_valid;

// connecting wires
wire [31:0] P0_to_P2_dout;
wire [31:0] P0_to_P1_dout;

wire [31:0] P1_to_P3_dout;
wire [31:0] P1_to_P0_dout;

wire [31:0] P2_to_P0_dout;
wire [31:0] P2_to_P3_dout;

wire [31:0] P3_to_P1_dout;
wire [31:0] P3_to_P2_dout;

// intermediate variables
reg start_reg;
wire start_proc;

reg finish_reg;
wire P0_end_proc, P1_end_proc, P2_end_proc, P3_end_proc;

// Processor P0
NTT_processor #(.FILE("E:/Dropbox/FHE/my project/Parallel NTT/hardware/ip_repo/parallel_ntt_2.0/src/data/P0_twiddle_factors_LUT_hex.txt"),
                .CONFIG(2'b00))
P0 (
    .clk(clk),
    .rst_b(rst_b),
    .start(start_proc),
    .finish(P0_end_proc),
    //extra-connection with parallel_NTT_top
    .extra_connect_din(s_processor_din_delay),
    .extra_connect_din_valid(P0_extra_connect_din_valid),
    .extra_connect_dout(P0_extra_connect_dout),
    .extra_connect_dout_valid(P0_extra_connect_dout_valid),
    .extra_connect_read_valid(P0_extra_connect_read_valid),
    //inter-connection No.1, used in round-1
    .inter_connect_0_din(P2_to_P0_dout),
    .inter_connect_0_dout(P0_to_P2_dout),
    //inter-connection No.2, used in round-2
    .inter_connect_1_din(P1_to_P0_dout),
    .inter_connect_1_dout(P0_to_P1_dout)
    );

// Processor P1
NTT_processor #(.FILE("E:/Dropbox/FHE/my project/Parallel NTT/hardware/ip_repo/parallel_ntt_2.0/src/data/P1_twiddle_factors_LUT_hex.txt"),
                .CONFIG(2'b01))
P1 (
    .clk(clk),
    .rst_b(rst_b),
    .start(start_proc),
    .finish(P1_end_proc),
    //extra-connection with parallel_NTT_top
    .extra_connect_din(s_processor_din_delay),
    .extra_connect_din_valid(P1_extra_connect_din_valid),
    .extra_connect_dout(P1_extra_connect_dout),
    .extra_connect_dout_valid(P1_extra_connect_dout_valid),
    .extra_connect_read_valid(P1_extra_connect_read_valid),
    //inter-connection No.1, used in round-1
    .inter_connect_0_din(P3_to_P1_dout),
    .inter_connect_0_dout(P1_to_P3_dout),
    //inter-connection No.2, used in round-2
    .inter_connect_1_din(P0_to_P1_dout),
    .inter_connect_1_dout(P1_to_P0_dout)
    );

// Processor P2
NTT_processor #(.FILE("E:/Dropbox/FHE/my project/Parallel NTT/hardware/ip_repo/parallel_ntt_2.0/src/data/P2_twiddle_factors_LUT_hex.txt"),
                .CONFIG(2'b10))
P2 (
    .clk(clk),
    .rst_b(rst_b),
    .start(start_proc),
    .finish(P2_end_proc),
    //extra-connection with parallel_NTT_top
    .extra_connect_din(s_processor_din_delay),
    .extra_connect_din_valid(P2_extra_connect_din_valid),
    .extra_connect_dout(P2_extra_connect_dout),
    .extra_connect_dout_valid(P2_extra_connect_dout_valid),
    .extra_connect_read_valid(P2_extra_connect_read_valid),
    //inter-connection No.1, used in round-1
    .inter_connect_0_din(P0_to_P2_dout),
    .inter_connect_0_dout(P2_to_P0_dout),
    //inter-connection No.2, used in round-2
    .inter_connect_1_din(P3_to_P2_dout),
    .inter_connect_1_dout(P2_to_P3_dout)
    );

// Processor P3
NTT_processor #(.FILE("E:/Dropbox/FHE/my project/Parallel NTT/hardware/ip_repo/parallel_ntt_2.0/src/data/P3_twiddle_factors_LUT_hex.txt"),
                .CONFIG(2'b11))
P3 (
    .clk(clk),
    .rst_b(rst_b),
    .start(start_proc),
    .finish(P3_end_proc),
    //extra-connection with parallel_NTT_top
    .extra_connect_din(s_processor_din_delay),
    .extra_connect_din_valid(P3_extra_connect_din_valid),
    .extra_connect_dout(P3_extra_connect_dout),
    .extra_connect_dout_valid(P3_extra_connect_dout_valid),
    .extra_connect_read_valid(P3_extra_connect_read_valid),
    //inter-connection No.1, used in round-1
    .inter_connect_0_din(P1_to_P3_dout),
    .inter_connect_0_dout(P3_to_P1_dout),
    //inter-connection No.2, used in round-2
    .inter_connect_1_din(P2_to_P3_dout),
    .inter_connect_1_dout(P3_to_P2_dout)
    );

//  user logic here
/***AXIS protocol***/
/***             ***/
always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        P0_extra_connect_din_valid <= 1'b0;
		P1_extra_connect_din_valid <= 1'b0;
		P2_extra_connect_din_valid <= 1'b0;
		P3_extra_connect_din_valid <= 1'b0;
	 end
    else if (s_processor_din_valid) begin
        case (s_processor_num)
 			2'd0: begin
				P0_extra_connect_din_valid <= 1'b1;
				P1_extra_connect_din_valid <= 1'b0;
				P2_extra_connect_din_valid <= 1'b0;
				P3_extra_connect_din_valid <= 1'b0;
			 end
 			2'd1: begin
				P0_extra_connect_din_valid <= 1'b0;
				P1_extra_connect_din_valid <= 1'b1;
				P2_extra_connect_din_valid <= 1'b0;
				P3_extra_connect_din_valid <= 1'b0;
			 end
 			2'd2: begin
				P0_extra_connect_din_valid <= 1'b0;
				P1_extra_connect_din_valid <= 1'b0;
				P2_extra_connect_din_valid <= 1'b1;
				P3_extra_connect_din_valid <= 1'b0;
			 end
 			2'd3: begin
				P0_extra_connect_din_valid <= 1'b0;
				P1_extra_connect_din_valid <= 1'b0;
				P2_extra_connect_din_valid <= 1'b0;
				P3_extra_connect_din_valid <= 1'b1;
			 end
 			default: begin
				P0_extra_connect_din_valid <= 1'b0;
				P1_extra_connect_din_valid <= 1'b0;
				P2_extra_connect_din_valid <= 1'b0;
				P3_extra_connect_din_valid <= 1'b0;
			 end
		endcase
	end
	else begin
		P0_extra_connect_din_valid <= 1'b0;
		P1_extra_connect_din_valid <= 1'b0;
		P2_extra_connect_din_valid <= 1'b0;
		P3_extra_connect_din_valid <= 1'b0;
	 end
end

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        s_processor_din_delay <= 0;
    end
    else begin
        s_processor_din_delay <= s_processor_din;
    end
end


always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        P0_extra_connect_read_valid <= 1'b0;
		P1_extra_connect_read_valid <= 1'b0;
		P2_extra_connect_read_valid <= 1'b0;
		P3_extra_connect_read_valid <= 1'b0;
	 end
    else if (m_processor_num_valid) begin
        case (m_processor_num)
 			2'd0: begin
				P0_extra_connect_read_valid <= 1'b1;
				P1_extra_connect_read_valid <= 1'b0;
				P2_extra_connect_read_valid <= 1'b0;
				P3_extra_connect_read_valid <= 1'b0;
			 end
 			2'd1: begin
				P0_extra_connect_read_valid <= 1'b0;
				P1_extra_connect_read_valid <= 1'b1;
				P2_extra_connect_read_valid <= 1'b0;
				P3_extra_connect_read_valid <= 1'b0;
			 end
 			2'd2: begin
				P0_extra_connect_read_valid <= 1'b0;
				P1_extra_connect_read_valid <= 1'b0;
				P2_extra_connect_read_valid <= 1'b1;
				P3_extra_connect_read_valid <= 1'b0;
			 end
 			2'd3: begin
				P0_extra_connect_read_valid <= 1'b0;
				P1_extra_connect_read_valid <= 1'b0;
				P2_extra_connect_read_valid <= 1'b0;
				P3_extra_connect_read_valid <= 1'b1;
			 end
 			default: begin
				P0_extra_connect_read_valid <= 1'b0;
				P1_extra_connect_read_valid <= 1'b0;
				P2_extra_connect_read_valid <= 1'b0;
				P3_extra_connect_read_valid <= 1'b0;
			 end
		endcase
	end
	else begin
		P0_extra_connect_read_valid <= 1'b0;
		P1_extra_connect_read_valid <= 1'b0;
		P2_extra_connect_read_valid <= 1'b0;
		P3_extra_connect_read_valid <= 1'b0;
	 end
end

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        m_processor_dout <= 0;
        m_processor_dout_valid <= 0;
    end
    else if (P0_extra_connect_dout_valid) begin
        m_processor_dout <= P0_extra_connect_dout;
        m_processor_dout_valid <= P0_extra_connect_dout_valid;
    end
    else if (P1_extra_connect_dout_valid) begin
        m_processor_dout <= P1_extra_connect_dout;
        m_processor_dout_valid <= P1_extra_connect_dout_valid;
    end
    else if (P2_extra_connect_dout_valid) begin
        m_processor_dout <= P2_extra_connect_dout;
        m_processor_dout_valid <= P2_extra_connect_dout_valid;
    end
    else if (P3_extra_connect_dout_valid) begin
        m_processor_dout <= P3_extra_connect_dout;
        m_processor_dout_valid <= P3_extra_connect_dout_valid;
    end
    else begin
        m_processor_dout <= 0;
        m_processor_dout_valid <= 0;
    end
end

/***NTT protocol***/
/***             ***/
always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        start_reg <= 0;
    end
    else begin
        start_reg <= start;
    end
end

assign start_proc = start_reg == 1'b0 && start == 1'b1 ? 1'b1 : 1'b0;

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        finish_reg <= 0;
    end
    else if (P0_end_proc & P1_end_proc & P2_end_proc & P3_end_proc) begin
        finish_reg <= 1;
    end
end

assign finish = finish_reg;

endmodule
