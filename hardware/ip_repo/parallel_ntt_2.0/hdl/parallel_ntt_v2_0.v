
`timescale 1 ns / 1 ps

	module parallel_ntt_v2_0 #
	(
		// Users to add parameters here


		// User parameters ends
		// Do not modify the parameters beyond this line

		// Parameters of Axi Slave Bus Interface S_AXIS
		parameter integer C_S_AXIS_TDATA_WIDTH	= 32,

		// Parameters of Axi Master Bus Interface M_AXIS
		parameter integer C_M_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M_AXIS_START_COUNT	= 32
	)
	(
		// Users to add ports here
		input wire 	start,
		output wire finish,

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S_AXIS
		input wire  s_axis_aclk,
		input wire  s_axis_aresetn,
		output wire  s_axis_tready,
		input wire [C_S_AXIS_TDATA_WIDTH-1 : 0] s_axis_tdata,
		input wire [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0] s_axis_tstrb,
		input wire  s_axis_tlast,
		input wire  s_axis_tvalid,

		// Ports of Axi Master Bus Interface M_AXIS
		input wire  m_axis_aclk,
		input wire  m_axis_aresetn,
		output wire  m_axis_tvalid,
		output wire [C_M_AXIS_TDATA_WIDTH-1 : 0] m_axis_tdata,
		output wire [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] m_axis_tstrb,
		output wire  m_axis_tlast,
		input wire  m_axis_tready
	);

	parameter integer PROCESSOR_NUM_WIDTH = 2;
	parameter integer NTT_POINTS_NUM = 1024;

// ports of parallel_NTT_top
	wire [31:0] s_processor_din;
	wire [PROCESSOR_NUM_WIDTH-1:0] s_processor_num;
	wire s_processor_din_valid;

	wire [31:0] m_processor_dout;
	wire m_processor_dout_valid;
	wire [PROCESSOR_NUM_WIDTH-1:0] m_processor_num;
	wire m_processor_num_valid;	


// Instantiation of Axi Bus Interface S_AXIS
	parallel_ntt_v2_0_S_AXIS # ( 
		.C_S_AXIS_TDATA_WIDTH(C_S_AXIS_TDATA_WIDTH),
		.NTT_POINTS_NUM(NTT_POINTS_NUM),
		.PROCESSOR_NUM_WIDTH(PROCESSOR_NUM_WIDTH)
	) parallel_ntt_v2_0_S_AXIS_inst (
		.S_AXIS_ACLK(s_axis_aclk),
		.S_AXIS_ARESETN(s_axis_aresetn),
		.S_AXIS_TREADY(s_axis_tready),
		.S_AXIS_TDATA(s_axis_tdata),
		.S_AXIS_TSTRB(s_axis_tstrb),
		.S_AXIS_TLAST(s_axis_tlast),
		.S_AXIS_TVALID(s_axis_tvalid),
		.processor_num(s_processor_num), //send data to the RAM within processors
		.processor_dout(s_processor_din),
		.processor_dout_valid(s_processor_din_valid)
	);

// Instantiation of Axi Bus Interface M_AXIS
	parallel_ntt_v2_0_M_AXIS # ( 
		.C_M_AXIS_TDATA_WIDTH(C_M_AXIS_TDATA_WIDTH),
		.C_M_START_COUNT(C_M_AXIS_START_COUNT),
		.NTT_POINTS_NUM(NTT_POINTS_NUM),
		.PROCESSOR_NUM_WIDTH(PROCESSOR_NUM_WIDTH)
	) parallel_ntt_v2_0_M_AXIS_inst (
		.M_AXIS_ACLK(m_axis_aclk),
		.M_AXIS_ARESETN(m_axis_aresetn),
		.M_AXIS_TVALID(m_axis_tvalid),
		.M_AXIS_TDATA(m_axis_tdata),
		.M_AXIS_TSTRB(m_axis_tstrb),
		.M_AXIS_TLAST(m_axis_tlast),
		.M_AXIS_TREADY(m_axis_tready),
		.processor_din(m_processor_dout), // request data from the RAM within processors
		.processor_din_valid(m_processor_dout_valid),
		.processor_num(m_processor_num),
		.processor_num_valid(m_processor_num_valid)
	);

	// Add user logic here

	// instantiate the core module --- parallel_NTT_top
	parallel_NTT_top parallel_NTT_top_inst(
    .clk 	(s_axis_aclk),
    .rst_b 	(s_axis_aresetn),
    .start 	(start),
    .finish	(finish),
    //send data into the RAM within processors
    .s_processor_din 	(s_processor_din),
    .s_processor_num (s_processor_num),
    .s_processor_din_valid (s_processor_din_valid),
    //request data out from the RAM within processors
    .m_processor_dout (m_processor_dout),
    .m_processor_dout_valid(m_processor_dout_valid),
    .m_processor_num (m_processor_num),
    .m_processor_num_valid (m_processor_num_valid)
    );
	// User logic ends

	endmodule
