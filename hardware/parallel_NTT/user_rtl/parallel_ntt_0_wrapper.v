`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2021 12:24:48 PM
// Design Name: 
// Module Name: parallel_ntt_0_wrapper
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


module parallel_ntt_0_wrapper(
  input wire    start,
  output wire    finish,

  output wire   [31:0] m_axis_tdata,
  output wire   [3:0] m_axis_tstrb,
  output wire   m_axis_tlast,
  output wire   m_axis_tvalid,
  input wire    m_axis_tready,
  input wire    m_axis_aclk,
  input wire    m_axis_aresetn,

  input wire    [31:0] s_axis_tdata,
  input wire    [3:0] s_axis_tstrb,
  input wire    s_axis_tlast,
  input wire    s_axis_tvalid,
  output wire   s_axis_tready,
  input wire    s_axis_aclk,
  input wire    s_axis_aresetn
    );

// instantiation of the parallel_ntt design below
parallel_ntt_0 parallel_ntt_0_instance(
        // Users to add ports here
        .start              (start),
        .finish             (finish),
        // User ports ends
        // Do not modify the ports beyond this line

        // Ports of Axi Slave Bus Interface S_AXIS
        .s_axis_aclk        (s_axis_aclk),
        .s_axis_aresetn     (s_axis_aresetn),
        .s_axis_tready      (s_axis_tready),
        .s_axis_tdata       (s_axis_tdata),
        .s_axis_tstrb       (s_axis_tstrb),
        .s_axis_tlast       (s_axis_tlast),
        .s_axis_tvalid      (s_axis_tvalid),

        // Ports of Axi Master Bus Interface M_AXIS
        .m_axis_aclk        (m_axis_aclk),
        .m_axis_aresetn     (m_axis_aresetn),
        .m_axis_tvalid      (m_axis_tvalid),
        .m_axis_tdata       (m_axis_tdata),
        .m_axis_tstrb       (m_axis_tstrb),
        .m_axis_tlast       (m_axis_tlast),
        .m_axis_tready      (m_axis_tready)
    );

endmodule
