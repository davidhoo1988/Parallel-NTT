`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2021 03:09:39 PM
// Design Name: 
// Module Name: Barret_reduce
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


module Barret_reduce #(parameter PARAM_R = 816642, PARAM_K = 32, PARAM_MOD = 4294966657)(
    input wire clk,
    input wire rst_b,
    input wire [63:0] din,
    input wire din_valid,
    output reg [31:0] dout,
    output wire dout_valid
);

// ports for the multiplier mul64x32
wire [95:0] mul1_dout;

// ports for the multiplier mul32x32
wire [31:0] mul2_din;
wire [63:0] mul2_dout;

reg dout_valid_delay1, dout_valid_delay2, dout_valid_delay3,
    dout_valid_delay4, dout_valid_delay5, dout_valid_delay6,
    dout_valid_delay7, dout_valid_delay8, dout_valid_delay9,
    dout_valid_delay10, dout_valid_delay11, dout_valid_delay12,
    dout_valid_delay13; // first mul takes 6 cycles, second mul takes 6 cycles, and final conditional substract takes 1 cycle

wire [32:0] t;

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        dout_valid_delay1 <= 0;
        dout_valid_delay2 <= 0;
        dout_valid_delay3 <= 0;
        dout_valid_delay4 <= 0;
        dout_valid_delay5 <= 0;
        dout_valid_delay6 <= 0;
        dout_valid_delay7 <= 0;
        dout_valid_delay8 <= 0;
        dout_valid_delay9 <= 0;
        dout_valid_delay10 <= 0;
        dout_valid_delay11 <= 0;
        dout_valid_delay12 <= 0;
        dout_valid_delay13 <= 0;
    end
    else begin
        dout_valid_delay1 <= din_valid;
        dout_valid_delay2 <= dout_valid_delay1;
        dout_valid_delay3 <= dout_valid_delay2;
        dout_valid_delay4 <= dout_valid_delay3;
        dout_valid_delay5 <= dout_valid_delay4;
        dout_valid_delay6 <= dout_valid_delay5;
        dout_valid_delay7 <= dout_valid_delay6;
        dout_valid_delay8 <= dout_valid_delay7;
        dout_valid_delay9 <= dout_valid_delay8;
        dout_valid_delay10 <= dout_valid_delay9;
        dout_valid_delay11 <= dout_valid_delay10;
        dout_valid_delay12 <= dout_valid_delay11;
        dout_valid_delay13 <= dout_valid_delay12;
    end
end

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        dout <= 0;
    end
    else if (t < PARAM_MOD) begin
        dout <= t;
    end
    else begin
        dout <= t - PARAM_MOD;
    end
end

assign dout_valid = dout_valid_delay13;
//first do 2k-by-k bit multiplication, 6 clock cycles delay
mult_gen_64x32 mul64x32(
    .CLK        (clk),
    .A          (din),
    .B          (PARAM_R),
    .P          (mul1_dout)
    );

//second do k-by-k bit multiplication, 6 clock cycles delay
assign mul2_din = mul1_dout[96-1:2*PARAM_K];
assign t = din - mul2_dout;

mult_gen_32x32 mul32x32(
    .CLK        (clk),
    .A          (mul2_din),
    .B          (PARAM_MOD),
    .P          (mul2_dout)
    );




endmodule
