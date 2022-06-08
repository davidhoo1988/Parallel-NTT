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


module Barret_reduce #(parameter PARAM_R = 33'd4294967935, PARAM_K = 32, PARAM_MOD = 32'd4294966657)(
    input wire clk,
    input wire rst_b,
    input wire [63:0] din,
    input wire din_valid,
    output reg [31:0] dout,
    output wire dout_valid
);

// din delay
reg [63:0]  din_delay1, din_delay2, din_delay3,
            din_delay4, din_delay5, din_delay6,
            din_delay7, din_delay8, din_delay9,
            din_delay10, din_delay11, din_delay12,
            din_delay13, din_delay14, din_delay15,
            din_delay16;

// (3k+1 bits) ports for the multiplier mul64x32
wire [96:0] mul1_dout;

// ports for the multiplier mul32x32
wire [31:0] mul2_din;
wire [63:0] mul2_dout;

reg dout_valid_delay1, dout_valid_delay2, dout_valid_delay3,
    dout_valid_delay4, dout_valid_delay5, dout_valid_delay6,
    dout_valid_delay7, dout_valid_delay8, dout_valid_delay9,
    dout_valid_delay10, dout_valid_delay11, dout_valid_delay12,
    dout_valid_delay13, dout_valid_delay14, dout_valid_delay15,
    dout_valid_delay16, dout_valid_delay17; // mul64x32 takes 10 cycles, mul32x32 takes 6 cycles, and final conditional substract takes 1 cycle -> Total = 10 + 6 + 1

wire [32:0] t;

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        din_delay1 <= 0;
        din_delay2 <= 0;
        din_delay3 <= 0;
        din_delay4 <= 0;
        din_delay5 <= 0;
        din_delay6 <= 0;
        din_delay7 <= 0;
        din_delay8 <= 0;
        din_delay9 <= 0;
        din_delay10 <= 0;
        din_delay11 <= 0;
        din_delay12 <= 0;
        din_delay13 <= 0;
        din_delay14 <= 0;
        din_delay15 <= 0;
        din_delay16 <= 0;
    end
    else begin
        din_delay1 <= din;
        din_delay2 <= din_delay1;
        din_delay3 <= din_delay2;
        din_delay4 <= din_delay3;
        din_delay5 <= din_delay4;
        din_delay6 <= din_delay5;
        din_delay7 <= din_delay6;
        din_delay8 <= din_delay7;
        din_delay9 <= din_delay8;
        din_delay10 <= din_delay9;
        din_delay11 <= din_delay10;
        din_delay12 <= din_delay11;
        din_delay13 <= din_delay12;
        din_delay14 <= din_delay13;
        din_delay15 <= din_delay14;
        din_delay16 <= din_delay15;        
    end
end

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
        dout_valid_delay14 <= 0;
        dout_valid_delay15 <= 0;
        dout_valid_delay16 <= 0;
        dout_valid_delay17 <= 0;
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
        dout_valid_delay14 <= dout_valid_delay13;
        dout_valid_delay15 <= dout_valid_delay14;
        dout_valid_delay16 <= dout_valid_delay15;
        dout_valid_delay17 <= dout_valid_delay16;
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

assign dout_valid = dout_valid_delay17;
//first do 2k-by-(k+1) bit multiplication, 10 clock cycles delay
mult_gen_64x33 mul64x33(
    .CLK        (clk),
    .A          (din),
    .B          (PARAM_R),
    .P          (mul1_dout)
    );

//second do k-by-k bit multiplication, 6 clock cycles delay
assign mul2_din = mul1_dout[96-1:2*PARAM_K];
assign t = din_delay16 - mul2_dout;

mult_gen_32x32 mul32x32(
    .CLK        (clk),
    .A          (mul2_din),
    .B          (PARAM_MOD),
    .P          (mul2_dout)
    );

endmodule
