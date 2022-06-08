`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2021 07:36:31 PM
// Design Name: 
// Module Name: NTT_processor
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

module NTT_processor #(parameter FILE = "", PARAM_MOD = 32'd4294957057, CONFIG = 2'd0)(
    //extra-connection with parallel_NTT_top
    input wire clk,
    input wire rst_b,
    input wire start,
    output wire finish,

    input wire [31:0] extra_connect_din,
    input wire extra_connect_din_valid,

    output wire [31:0] extra_connect_dout,
    output wire extra_connect_dout_valid,
    input wire extra_connect_read_valid, //burst-read request from external
    
    //inter-connection No.1
	input wire [31:0] inter_connect_0_din,
	output wire [31:0] inter_connect_0_dout,
    //inter-connection No.2
    input wire [31:0] inter_connect_1_din,
    output wire [31:0] inter_connect_1_dout
    );
    
// data transfer logic for bram data
reg data_wea, data_ena;
reg [31:0] data_dia;
reg [7:0] data_addra; 

reg data_web, data_enb;
reg [31:0] data_dib;
reg [7:0] data_addrb;
wire [31:0] data_doa;
wire [31:0] data_dob;

reg twiddle_factor_en;
reg [8:0] twiddle_factor_addr, twiddle_factor_addr_delay1;


// Define the states of state machine
// The control state machine oversees the reading block RAM, butterfly computation,
// and outputs the results to block RAM
localparam [1:0] IDLE = 2'd0,        // This is the initial/idle state 

                ADDR_READ  = 1'd1, // In this state addra and addrb are tuned to read block RAM 
                ADDR_WRITE = 2'd2; // In this state addra and addrb are tuned to write bolck RAM


// State variable
reg [1:0] current_state;  
// iteration round variable
reg [3:0] roundi;
// distance variable
reg [7:0] dist;
//  base variable
reg [7:0] base;
// cntb(counter base) variable
reg [6:0] cntb;
// cnt variable
reg [6:0] cnt;

//state transitional signal
wire idle1_done;

// Control state machine implementation
always @(posedge clk) begin  
  if (!rst_b)  // Synchronous reset (active low)   
    current_state <= IDLE;
  else
    case (current_state)
      IDLE: 
        // The sink starts providing correct address control when 
        // the start singnal is asserted
        if (start) begin
          current_state <= ADDR_READ;
        end
        else begin
          current_state <= IDLE;
        end
      ADDR_READ: 
        if (cntb == 127) begin
            current_state <= ADDR_WRITE;
        end 
        else begin
            current_state <= ADDR_READ;
        end
      ADDR_WRITE:
        if (roundi == 9 && cntb == 127) begin // When all iterative rounds are completed, state restores to IDLE
            current_state <= IDLE;
        end
        else if (cntb == 127) begin
            current_state <= ADDR_READ;
        end
        else begin
            current_state <= ADDR_WRITE;
        end
    endcase
end

assign finish = (current_state == ADDR_WRITE && roundi == 9 && cntb == 127) ? 1'b1 : 1'b0;

// logic control for auxillary variables
    always @(posedge clk) begin
        if (!rst_b) begin
            // reset
            cntb <= 0;
        end
        else if (current_state == ADDR_READ) begin
            cntb <= cntb + 1'b1;
        end
        else if (current_state == ADDR_WRITE) begin
            cntb <= cntb + 1'b1;
        end
        else begin
            cntb <= 0;
        end
    end

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        roundi <= 0; 
    end
    else if (current_state == ADDR_WRITE && cntb == 127 && roundi != 9) begin
        roundi <= roundi + 1'b1;
    end
    else if (current_state == ADDR_WRITE) begin
        roundi <= roundi; 
    end
    else if (current_state == ADDR_READ) begin
        roundi <= roundi;
    end
    else begin
        roundi <= 0;
    end
end

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        cnt <= 0;
    end
    else if (current_state == ADDR_READ || current_state == ADDR_WRITE) begin
        if (roundi < 3 && cnt == 127) begin
            cnt <= 0;
        end
        else if (roundi == 3 && cnt == 63) begin
            cnt <= 0;
        end
        else if (roundi == 4 && cnt == 31) begin
            cnt <= 0;
        end
        else if (roundi == 5 && cnt == 15) begin
            cnt <= 0;
        end
        else if (roundi == 6 && cnt == 7) begin
            cnt <= 0;
        end
        else if (roundi == 7 && cnt == 3) begin
            cnt <= 0;
        end
        else if (roundi == 8 && cnt == 1) begin
            cnt <= 0;
        end
        else if (roundi == 9 && cnt == 0) begin
            cnt <= 0;
        end
        else begin
            cnt <= cnt + 1'b1;
        end
    end
    else begin
        cnt <= 0;
    end
end

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        base <= 0;
    end
    else if (current_state == ADDR_READ || current_state == ADDR_WRITE) begin
        if (roundi < 3 && cntb == 127)
            base <= 0;
        else if (roundi == 3 && cntb[5:0] == {6{1'b1}})
            base <= base + 128;
        else if (roundi == 4 && cntb[4:0] == {5{1'b1}})
            base <= base + 64;
        else if (roundi == 5 && cntb[3:0] == {4{1'b1}})
            base <= base + 32;
        else if (roundi == 6 && cntb[2:0] == {3{1'b1}})
            base <= base + 16;
        else if (roundi == 7 && cntb[1:0] == {2{1'b1}})
            base <= base + 8;
        else if (roundi == 8 && cntb[0:0] == {1{1'b1}})
            base <= base + 4;
        else if (roundi == 9)
            base <= base + 2;
        else 
            base <= base;    
    end
    else begin
        base <= 0;
    end
end

// logic control for twiddle factor LUT
always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        twiddle_factor_addr <= 0;
    end
    else if (current_state == ADDR_READ) begin
        if (roundi < 3 && cntb == 127)
            twiddle_factor_addr <= twiddle_factor_addr + 1;
        else if (roundi == 3 && cntb[5:0] == {6{1'b1}})
            twiddle_factor_addr <= twiddle_factor_addr + 1;
        else if (roundi == 4 && cntb[4:0] == {5{1'b1}})
            twiddle_factor_addr <= twiddle_factor_addr + 1;
        else if (roundi == 5 && cntb[3:0] == {4{1'b1}})
            twiddle_factor_addr <= twiddle_factor_addr + 1;
        else if (roundi == 6 && cntb[2:0] == {3{1'b1}})
            twiddle_factor_addr <= twiddle_factor_addr + 1;
        else if (roundi == 7 && cntb[1:0] == {2{1'b1}})
            twiddle_factor_addr <= twiddle_factor_addr + 1;
        else if (roundi == 8 && cntb[0:0] == {1{1'b1}})
            twiddle_factor_addr <= twiddle_factor_addr + 1;
        else if (roundi == 9 && cntb != 127)
            twiddle_factor_addr <= twiddle_factor_addr + 1;
          else 
            twiddle_factor_addr <= twiddle_factor_addr;         
    end
    else if (current_state == ADDR_WRITE)
        twiddle_factor_addr <= twiddle_factor_addr;
    else begin
        twiddle_factor_addr <= 0;
    end
end

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        twiddle_factor_addr_delay1 <= 0;
    end
    else begin
        twiddle_factor_addr_delay1 <= twiddle_factor_addr;
    end
end

always @(posedge clk) begin
    if (!rst_b) begin
        twiddle_factor_en <= 0;
    end
    else if (current_state == ADDR_READ || current_state == ADDR_WRITE) begin
        twiddle_factor_en <= 1;
    end
    else begin
        twiddle_factor_en <= 0;
    end
end

// logic control for block RAM read/write
reg [31:0] butterfly_dout1, butterfly_dout2;
// delay butterfly_dout1, butterfly_dout2 by N/2d - (1+6+17 + 3) = N/2d - 27 clock cycles
reg [31:0] butterfly_dout1_delay1, butterfly_dout1_delay2, butterfly_dout1_delay3,
butterfly_dout1_delay4, butterfly_dout1_delay5, butterfly_dout1_delay6,
butterfly_dout1_delay7, butterfly_dout1_delay8, butterfly_dout1_delay9,
butterfly_dout1_delay10, butterfly_dout1_delay11, butterfly_dout1_delay12,
butterfly_dout1_delay13, butterfly_dout1_delay14, butterfly_dout1_delay15,
butterfly_dout1_delay16, butterfly_dout1_delay17, butterfly_dout1_delay18,
butterfly_dout1_delay19, butterfly_dout1_delay20, butterfly_dout1_delay21,
butterfly_dout1_delay22, butterfly_dout1_delay23, butterfly_dout1_delay24,
butterfly_dout1_delay25, butterfly_dout1_delay26, butterfly_dout1_delay27,
butterfly_dout1_delay28, butterfly_dout1_delay29, butterfly_dout1_delay30,
butterfly_dout1_delay31, butterfly_dout1_delay32, butterfly_dout1_delay33,
butterfly_dout1_delay34, butterfly_dout1_delay35, butterfly_dout1_delay36,
butterfly_dout1_delay37, butterfly_dout1_delay38, butterfly_dout1_delay39,
butterfly_dout1_delay40, butterfly_dout1_delay41, butterfly_dout1_delay42,
butterfly_dout1_delay43, butterfly_dout1_delay44, butterfly_dout1_delay45,
butterfly_dout1_delay46, butterfly_dout1_delay47, butterfly_dout1_delay48,
butterfly_dout1_delay49, butterfly_dout1_delay50, butterfly_dout1_delay51,
butterfly_dout1_delay52, butterfly_dout1_delay53, butterfly_dout1_delay54,
butterfly_dout1_delay55, butterfly_dout1_delay56, butterfly_dout1_delay57,
butterfly_dout1_delay58, butterfly_dout1_delay59, butterfly_dout1_delay60,
butterfly_dout1_delay61, butterfly_dout1_delay62, butterfly_dout1_delay63,
butterfly_dout1_delay64, butterfly_dout1_delay65, butterfly_dout1_delay66,
butterfly_dout1_delay67, butterfly_dout1_delay68, butterfly_dout1_delay69,
butterfly_dout1_delay70, butterfly_dout1_delay71, butterfly_dout1_delay72,
butterfly_dout1_delay73, butterfly_dout1_delay74, butterfly_dout1_delay75,
butterfly_dout1_delay76, butterfly_dout1_delay77, butterfly_dout1_delay78,
butterfly_dout1_delay79, butterfly_dout1_delay80, butterfly_dout1_delay81,
butterfly_dout1_delay82, butterfly_dout1_delay83, butterfly_dout1_delay84,
butterfly_dout1_delay85, butterfly_dout1_delay86, butterfly_dout1_delay87,
butterfly_dout1_delay88, butterfly_dout1_delay89, butterfly_dout1_delay90,
butterfly_dout1_delay91, butterfly_dout1_delay92, butterfly_dout1_delay93,
butterfly_dout1_delay94, butterfly_dout1_delay95, butterfly_dout1_delay96,
butterfly_dout1_delay97, butterfly_dout1_delay98, butterfly_dout1_delay99,
butterfly_dout1_delay100, butterfly_dout1_delay101;

reg [31:0] butterfly_dout2_delay1, butterfly_dout2_delay2, butterfly_dout2_delay3,
butterfly_dout2_delay4, butterfly_dout2_delay5, butterfly_dout2_delay6,
butterfly_dout2_delay7, butterfly_dout2_delay8, butterfly_dout2_delay9,
butterfly_dout2_delay10, butterfly_dout2_delay11, butterfly_dout2_delay12,
butterfly_dout2_delay13, butterfly_dout2_delay14, butterfly_dout2_delay15,
butterfly_dout2_delay16, butterfly_dout2_delay17, butterfly_dout2_delay18,
butterfly_dout2_delay19, butterfly_dout2_delay20, butterfly_dout2_delay21,
butterfly_dout2_delay22, butterfly_dout2_delay23, butterfly_dout2_delay24,
butterfly_dout2_delay25, butterfly_dout2_delay26, butterfly_dout2_delay27,
butterfly_dout2_delay28, butterfly_dout2_delay29, butterfly_dout2_delay30,
butterfly_dout2_delay31, butterfly_dout2_delay32, butterfly_dout2_delay33,
butterfly_dout2_delay34, butterfly_dout2_delay35, butterfly_dout2_delay36,
butterfly_dout2_delay37, butterfly_dout2_delay38, butterfly_dout2_delay39,
butterfly_dout2_delay40, butterfly_dout2_delay41, butterfly_dout2_delay42,
butterfly_dout2_delay43, butterfly_dout2_delay44, butterfly_dout2_delay45,
butterfly_dout2_delay46, butterfly_dout2_delay47, butterfly_dout2_delay48,
butterfly_dout2_delay49, butterfly_dout2_delay50, butterfly_dout2_delay51,
butterfly_dout2_delay52, butterfly_dout2_delay53, butterfly_dout2_delay54,
butterfly_dout2_delay55, butterfly_dout2_delay56, butterfly_dout2_delay57,
butterfly_dout2_delay58, butterfly_dout2_delay59, butterfly_dout2_delay60,
butterfly_dout2_delay61, butterfly_dout2_delay62, butterfly_dout2_delay63,
butterfly_dout2_delay64, butterfly_dout2_delay65, butterfly_dout2_delay66,
butterfly_dout2_delay67, butterfly_dout2_delay68, butterfly_dout2_delay69,
butterfly_dout2_delay70, butterfly_dout2_delay71, butterfly_dout2_delay72,
butterfly_dout2_delay73, butterfly_dout2_delay74, butterfly_dout2_delay75,
butterfly_dout2_delay76, butterfly_dout2_delay77, butterfly_dout2_delay78,
butterfly_dout2_delay79, butterfly_dout2_delay80, butterfly_dout2_delay81,
butterfly_dout2_delay82, butterfly_dout2_delay83, butterfly_dout2_delay84,
butterfly_dout2_delay85, butterfly_dout2_delay86, butterfly_dout2_delay87,
butterfly_dout2_delay88, butterfly_dout2_delay89, butterfly_dout2_delay90,
butterfly_dout2_delay91, butterfly_dout2_delay92, butterfly_dout2_delay93,
butterfly_dout2_delay94, butterfly_dout2_delay95, butterfly_dout2_delay96,
butterfly_dout2_delay97, butterfly_dout2_delay98, butterfly_dout2_delay99,
butterfly_dout2_delay100, butterfly_dout2_delay101;

wire        butterfly_dout_valid;

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        data_wea <= 0;
        data_ena <= 0;
        data_dia <= 0;
        data_addra <= -1;

        data_web <= 0;
        data_enb <= 0;
        data_dib <= 0;
        data_addrb <= -1;
    end
    else if (extra_connect_din_valid) begin // use PORT-A to write
        data_wea <= 1;
        data_ena <= 1;
        data_dia <= extra_connect_din;
        data_addra <= data_addra + 1'b1;
    end
    else if (extra_connect_read_valid) begin // use PORT-B to read, keep 'extra_connect_read_valid' high to enable burst-read mode
        data_web <= 0;
        data_enb <= 1;
        data_dib <= 0;
        data_addrb <= data_addrb + 1'b1;
    end
    else if (current_state == ADDR_READ) begin // Butterfly computation: use both PORT-A and PORT-B to read data from block RAM 'data'
        data_wea <= 0;
        data_ena <= 1;
        data_dia <= 0;
        data_addra <= base + cnt;

        data_web <= 0;
        data_enb <= 1;
        data_dib <= 0;
        data_addrb <= base + cnt + dist;
    end
    else if (current_state == ADDR_WRITE) begin
        data_wea <= 1;
        data_ena <= 1;
        data_dia <= butterfly_dout1_delay101;
        data_addra <= base + cnt;

        data_web <= 1;
        data_enb <= 1;
        data_dib <= butterfly_dout2_delay101;
        data_addrb <= base + cnt + dist;
    end
    else begin 
        data_wea <= 0;
        data_ena <= 0;
        data_dia <= 0;
        data_addra <= -1;

        data_web <= 0;
        data_enb <= 0;
        data_dib <= 0;
        data_addrb <= -1;
    end

end

// logic for data out to master AXI interface
reg extra_connect_read_valid_delay1;
reg extra_connect_read_valid_delay2;

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        extra_connect_read_valid_delay1 <= 0;
        extra_connect_read_valid_delay2 <= 0;
    end
    else begin
        extra_connect_read_valid_delay1 <= extra_connect_read_valid;
        extra_connect_read_valid_delay2 <= extra_connect_read_valid_delay1;
    end
end

assign extra_connect_dout_valid = extra_connect_read_valid_delay2;
assign extra_connect_dout = data_dob;


// butterfly structure
reg [31:0]  butterfly_din1_delay1, butterfly_din1_delay2, butterfly_din1_delay3,
			butterfly_din1_delay4, butterfly_din1_delay5, butterfly_din1_delay6,
			butterfly_din1_delay7, butterfly_din1_delay8, butterfly_din1_delay9,
			butterfly_din1_delay10, butterfly_din1_delay11, butterfly_din1_delay12,
			butterfly_din1_delay13, butterfly_din1_delay14, butterfly_din1_delay15,
			butterfly_din1_delay16, butterfly_din1_delay17, butterfly_din1_delay18,
			butterfly_din1_delay19, butterfly_din1_delay20, butterfly_din1_delay21,
			butterfly_din1_delay22, butterfly_din1_delay23, butterfly_din1_delay24;

reg [1:0] sel, sel_delay1; // 1 <-> inter_connect_0    2 <-> inter_connect_1    3 <-> block ram DATA

wire [31:0] butterfly_din1;
wire [31:0] butterfly_din2;
wire [31:0] twiddle_factor_din;

generate
    if (CONFIG == 2'b00) begin //the processor node is always in the first-half zone
        assign inter_connect_0_dout = data_dob;
        assign inter_connect_1_dout = data_dob;
	end
    else if (CONFIG == 2'b01) begin
        assign inter_connect_0_dout = data_dob;
        assign inter_connect_1_dout = data_doa;
	end
    else if (CONFIG == 2'b10) begin
        assign inter_connect_0_dout = data_doa;
        assign inter_connect_1_dout = data_dob;
	end
    else begin //the processor is always in the second-half zone
        assign inter_connect_0_dout = data_doa;
        assign inter_connect_1_dout = data_doa;
	end
endgenerate

generate
    if (CONFIG == 2'b00) begin
		assign butterfly_din1 = sel_delay1 == 1 ? data_doa :
								sel_delay1 == 2 ? data_doa :
                                sel_delay1 == 3 ? data_doa :
                                32'd0;
		assign butterfly_din2 = sel_delay1 == 1 ? inter_connect_0_din :
								sel_delay1 == 2 ? inter_connect_1_din :
                                sel_delay1 == 3 ? data_dob :
                                32'd0;
	end
    else if (CONFIG == 2'b01) begin
		assign butterfly_din1 = sel_delay1 == 1 ? data_doa :
								sel_delay1 == 2 ? inter_connect_1_din :
                                sel_delay1 == 3 ? data_doa :
                                32'd0;
		assign butterfly_din2 = sel_delay1 == 1 ? inter_connect_0_din :
								sel_delay1 == 2 ? data_dob :
                                sel_delay1 == 3 ? data_dob :
                                32'd0;
	end
    else if (CONFIG == 2'b10) begin
		assign butterfly_din1 = sel_delay1 == 1 ? inter_connect_0_din :
								sel_delay1 == 2 ? data_doa :
                                sel_delay1 == 3 ? data_doa :
                                32'd0;
		assign butterfly_din2 = sel_delay1 == 1 ? data_dob :
								sel_delay1 == 2 ? inter_connect_1_din :
                                sel_delay1 == 3 ? data_dob :
                                32'd0;
	end
    else begin
		assign butterfly_din1 = sel_delay1 == 1 ? inter_connect_0_din :
								sel_delay1 == 2 ? inter_connect_1_din :
                                sel_delay1 == 3 ? data_doa :
                                32'd0;
		assign butterfly_din2 = sel_delay1 == 1 ? data_dob :
								sel_delay1 == 2 ? data_dob :
                                sel_delay1 == 3 ? data_dob :
                                32'd0;
	end
endgenerate

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        sel <= 0;
    end
    else if (current_state == ADDR_READ) begin
        if (roundi < 2 && cntb == 0)
            sel <= sel + 1;
        else if (roundi == 2 && cntb == 0)
            sel <= 1;
        else if (roundi == 3 && cntb == 0)
            sel <= 3;
        else 
            sel <= sel;            
    end
    else if (current_state == IDLE) begin
        sel <= 0; 
    end
    else begin
        sel <= sel;
    end
end

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        sel_delay1 <= 0;
    end
    else begin
        sel_delay1 <= sel;
    end
end

always @(posedge clk) begin // delay = 1 + 6 + 17 (butterfly_din delay + MUL delay + BarretReduce delay)
    if (!rst_b) begin
        // reset
        butterfly_din1_delay1 <= 0;
        butterfly_din1_delay2 <= 0;
        butterfly_din1_delay3 <= 0;
        butterfly_din1_delay4 <= 0;
        butterfly_din1_delay5 <= 0;
        butterfly_din1_delay6 <= 0;
        butterfly_din1_delay7 <= 0;
        butterfly_din1_delay8 <= 0;
        butterfly_din1_delay9 <= 0;
        butterfly_din1_delay10 <= 0;
        butterfly_din1_delay11 <= 0;
        butterfly_din1_delay12 <= 0;
        butterfly_din1_delay13 <= 0;
        butterfly_din1_delay14 <= 0;
        butterfly_din1_delay15 <= 0;
        butterfly_din1_delay16 <= 0;
        butterfly_din1_delay17 <= 0;
        butterfly_din1_delay18 <= 0;
        butterfly_din1_delay19 <= 0;
        butterfly_din1_delay20 <= 0;
        butterfly_din1_delay21 <= 0;
        butterfly_din1_delay22 <= 0;
        butterfly_din1_delay23 <= 0;
        butterfly_din1_delay24 <= 0;
	end
	else begin
        butterfly_din1_delay1 <= butterfly_din1;
        butterfly_din1_delay2 <= butterfly_din1_delay1;
        butterfly_din1_delay3 <= butterfly_din1_delay2;
        butterfly_din1_delay4 <= butterfly_din1_delay3;
        butterfly_din1_delay5 <= butterfly_din1_delay4;
        butterfly_din1_delay6 <= butterfly_din1_delay5;
        butterfly_din1_delay7 <= butterfly_din1_delay6;
        butterfly_din1_delay8 <= butterfly_din1_delay7;
        butterfly_din1_delay9 <= butterfly_din1_delay8;
        butterfly_din1_delay10 <= butterfly_din1_delay9;
        butterfly_din1_delay11 <= butterfly_din1_delay10;
        butterfly_din1_delay12 <= butterfly_din1_delay11;
        butterfly_din1_delay13 <= butterfly_din1_delay12;
        butterfly_din1_delay14 <= butterfly_din1_delay13;
        butterfly_din1_delay15 <= butterfly_din1_delay14;
        butterfly_din1_delay16 <= butterfly_din1_delay15;
        butterfly_din1_delay17 <= butterfly_din1_delay16;
        butterfly_din1_delay18 <= butterfly_din1_delay17;
        butterfly_din1_delay19 <= butterfly_din1_delay18;
        butterfly_din1_delay20 <= butterfly_din1_delay19;
        butterfly_din1_delay21 <= butterfly_din1_delay20;
        butterfly_din1_delay22 <= butterfly_din1_delay21;
        butterfly_din1_delay23 <= butterfly_din1_delay22;
        butterfly_din1_delay24 <= butterfly_din1_delay23;
	end
end

always @(posedge clk) begin // delay = 2048 - 27 = 101 (N/2d - (butterfly_din delay + MUL delay + BarretReduce delay + 1) = N/2d - (1+6+17 + 3))
    if (!rst_b) begin
        // reset
        butterfly_dout1_delay1 <= 0;
        butterfly_dout1_delay2 <= 0;
        butterfly_dout1_delay3 <= 0;
        butterfly_dout1_delay4 <= 0;
        butterfly_dout1_delay5 <= 0;
        butterfly_dout1_delay6 <= 0;
        butterfly_dout1_delay7 <= 0;
        butterfly_dout1_delay8 <= 0;
        butterfly_dout1_delay9 <= 0;
        butterfly_dout1_delay10 <= 0;
        butterfly_dout1_delay11 <= 0;
        butterfly_dout1_delay12 <= 0;
        butterfly_dout1_delay13 <= 0;
        butterfly_dout1_delay14 <= 0;
        butterfly_dout1_delay15 <= 0;
        butterfly_dout1_delay16 <= 0;
        butterfly_dout1_delay17 <= 0;
        butterfly_dout1_delay18 <= 0;
        butterfly_dout1_delay19 <= 0;
        butterfly_dout1_delay20 <= 0;
        butterfly_dout1_delay21 <= 0;
        butterfly_dout1_delay22 <= 0;
        butterfly_dout1_delay23 <= 0;
        butterfly_dout1_delay24 <= 0;
        butterfly_dout1_delay25 <= 0;
        butterfly_dout1_delay26 <= 0;
        butterfly_dout1_delay27 <= 0;
        butterfly_dout1_delay28 <= 0;
        butterfly_dout1_delay29 <= 0;
        butterfly_dout1_delay30 <= 0;
        butterfly_dout1_delay31 <= 0;
        butterfly_dout1_delay32 <= 0;
        butterfly_dout1_delay33 <= 0;
        butterfly_dout1_delay34 <= 0;
        butterfly_dout1_delay35 <= 0;
        butterfly_dout1_delay36 <= 0;
        butterfly_dout1_delay37 <= 0;
        butterfly_dout1_delay38 <= 0;
        butterfly_dout1_delay39 <= 0;
        butterfly_dout1_delay40 <= 0;
        butterfly_dout1_delay41 <= 0;
        butterfly_dout1_delay42 <= 0;
        butterfly_dout1_delay43 <= 0;
        butterfly_dout1_delay44 <= 0;
        butterfly_dout1_delay45 <= 0;
        butterfly_dout1_delay46 <= 0;
        butterfly_dout1_delay47 <= 0;
        butterfly_dout1_delay48 <= 0;
        butterfly_dout1_delay49 <= 0;
        butterfly_dout1_delay50 <= 0;
        butterfly_dout1_delay51 <= 0;
        butterfly_dout1_delay52 <= 0;
        butterfly_dout1_delay53 <= 0;
        butterfly_dout1_delay54 <= 0;
        butterfly_dout1_delay55 <= 0;
        butterfly_dout1_delay56 <= 0;
        butterfly_dout1_delay57 <= 0;
        butterfly_dout1_delay58 <= 0;
        butterfly_dout1_delay59 <= 0;
        butterfly_dout1_delay60 <= 0;
        butterfly_dout1_delay61 <= 0;
        butterfly_dout1_delay62 <= 0;
        butterfly_dout1_delay63 <= 0;
        butterfly_dout1_delay64 <= 0;
        butterfly_dout1_delay65 <= 0;
        butterfly_dout1_delay66 <= 0;
        butterfly_dout1_delay67 <= 0;
        butterfly_dout1_delay68 <= 0;
        butterfly_dout1_delay69 <= 0;
        butterfly_dout1_delay70 <= 0;
        butterfly_dout1_delay71 <= 0;
        butterfly_dout1_delay72 <= 0;
        butterfly_dout1_delay73 <= 0;
        butterfly_dout1_delay74 <= 0;
        butterfly_dout1_delay75 <= 0;
        butterfly_dout1_delay76 <= 0;
        butterfly_dout1_delay77 <= 0;
        butterfly_dout1_delay78 <= 0;
        butterfly_dout1_delay79 <= 0;
        butterfly_dout1_delay80 <= 0;
        butterfly_dout1_delay81 <= 0;
        butterfly_dout1_delay82 <= 0;
        butterfly_dout1_delay83 <= 0;
        butterfly_dout1_delay84 <= 0;
        butterfly_dout1_delay85 <= 0;
        butterfly_dout1_delay86 <= 0;
        butterfly_dout1_delay87 <= 0;
        butterfly_dout1_delay88 <= 0;
        butterfly_dout1_delay89 <= 0;
        butterfly_dout1_delay90 <= 0;
        butterfly_dout1_delay91 <= 0;
        butterfly_dout1_delay92 <= 0;
        butterfly_dout1_delay93 <= 0;
        butterfly_dout1_delay94 <= 0;
        butterfly_dout1_delay95 <= 0;
        butterfly_dout1_delay96 <= 0;
        butterfly_dout1_delay97 <= 0;
        butterfly_dout1_delay98 <= 0;
        butterfly_dout1_delay99 <= 0;
        butterfly_dout1_delay100 <= 0;
        butterfly_dout1_delay101 <= 0;

        butterfly_dout2_delay1 <= 0;
        butterfly_dout2_delay2 <= 0;
        butterfly_dout2_delay3 <= 0;
        butterfly_dout2_delay4 <= 0;
        butterfly_dout2_delay5 <= 0;
        butterfly_dout2_delay6 <= 0;
        butterfly_dout2_delay7 <= 0;
        butterfly_dout2_delay8 <= 0;
        butterfly_dout2_delay9 <= 0;
        butterfly_dout2_delay10 <= 0;
        butterfly_dout2_delay11 <= 0;
        butterfly_dout2_delay12 <= 0;
        butterfly_dout2_delay13 <= 0;
        butterfly_dout2_delay14 <= 0;
        butterfly_dout2_delay15 <= 0;
        butterfly_dout2_delay16 <= 0;
        butterfly_dout2_delay17 <= 0;
        butterfly_dout2_delay18 <= 0;
        butterfly_dout2_delay19 <= 0;
        butterfly_dout2_delay20 <= 0;
        butterfly_dout2_delay21 <= 0;
        butterfly_dout2_delay22 <= 0;
        butterfly_dout2_delay23 <= 0;
        butterfly_dout2_delay24 <= 0;
        butterfly_dout2_delay25 <= 0;
        butterfly_dout2_delay26 <= 0;
        butterfly_dout2_delay27 <= 0;
        butterfly_dout2_delay28 <= 0;
        butterfly_dout2_delay29 <= 0;
        butterfly_dout2_delay30 <= 0;
        butterfly_dout2_delay31 <= 0;
        butterfly_dout2_delay32 <= 0;
        butterfly_dout2_delay33 <= 0;
        butterfly_dout2_delay34 <= 0;
        butterfly_dout2_delay35 <= 0;
        butterfly_dout2_delay36 <= 0;
        butterfly_dout2_delay37 <= 0;
        butterfly_dout2_delay38 <= 0;
        butterfly_dout2_delay39 <= 0;
        butterfly_dout2_delay40 <= 0;
        butterfly_dout2_delay41 <= 0;
        butterfly_dout2_delay42 <= 0;
        butterfly_dout2_delay43 <= 0;
        butterfly_dout2_delay44 <= 0;
        butterfly_dout2_delay45 <= 0;
        butterfly_dout2_delay46 <= 0;
        butterfly_dout2_delay47 <= 0;
        butterfly_dout2_delay48 <= 0;
        butterfly_dout2_delay49 <= 0;
        butterfly_dout2_delay50 <= 0;
        butterfly_dout2_delay51 <= 0;
        butterfly_dout2_delay52 <= 0;
        butterfly_dout2_delay53 <= 0;
        butterfly_dout2_delay54 <= 0;
        butterfly_dout2_delay55 <= 0;
        butterfly_dout2_delay56 <= 0;
        butterfly_dout2_delay57 <= 0;
        butterfly_dout2_delay58 <= 0;
        butterfly_dout2_delay59 <= 0;
        butterfly_dout2_delay60 <= 0;
        butterfly_dout2_delay61 <= 0;
        butterfly_dout2_delay62 <= 0;
        butterfly_dout2_delay63 <= 0;
        butterfly_dout2_delay64 <= 0;
        butterfly_dout2_delay65 <= 0;
        butterfly_dout2_delay66 <= 0;
        butterfly_dout2_delay67 <= 0;
        butterfly_dout2_delay68 <= 0;
        butterfly_dout2_delay69 <= 0;
        butterfly_dout2_delay70 <= 0;
        butterfly_dout2_delay71 <= 0;
        butterfly_dout2_delay72 <= 0;
        butterfly_dout2_delay73 <= 0;
        butterfly_dout2_delay74 <= 0;
        butterfly_dout2_delay75 <= 0;
        butterfly_dout2_delay76 <= 0;
        butterfly_dout2_delay77 <= 0;
        butterfly_dout2_delay78 <= 0;
        butterfly_dout2_delay79 <= 0;
        butterfly_dout2_delay80 <= 0;
        butterfly_dout2_delay81 <= 0;
        butterfly_dout2_delay82 <= 0;
        butterfly_dout2_delay83 <= 0;
        butterfly_dout2_delay84 <= 0;
        butterfly_dout2_delay85 <= 0;
        butterfly_dout2_delay86 <= 0;
        butterfly_dout2_delay87 <= 0;
        butterfly_dout2_delay88 <= 0;
        butterfly_dout2_delay89 <= 0;
        butterfly_dout2_delay90 <= 0;
        butterfly_dout2_delay91 <= 0;
        butterfly_dout2_delay92 <= 0;
        butterfly_dout2_delay93 <= 0;
        butterfly_dout2_delay94 <= 0;
        butterfly_dout2_delay95 <= 0;
        butterfly_dout2_delay96 <= 0;
        butterfly_dout2_delay97 <= 0;
        butterfly_dout2_delay98 <= 0;
        butterfly_dout2_delay99 <= 0;
        butterfly_dout2_delay100 <= 0;
        butterfly_dout2_delay101 <= 0;
	end
	else begin
        butterfly_dout1_delay1 <= butterfly_dout1;
        butterfly_dout1_delay2 <= butterfly_dout1_delay1;
        butterfly_dout1_delay3 <= butterfly_dout1_delay2;
        butterfly_dout1_delay4 <= butterfly_dout1_delay3;
        butterfly_dout1_delay5 <= butterfly_dout1_delay4;
        butterfly_dout1_delay6 <= butterfly_dout1_delay5;
        butterfly_dout1_delay7 <= butterfly_dout1_delay6;
        butterfly_dout1_delay8 <= butterfly_dout1_delay7;
        butterfly_dout1_delay9 <= butterfly_dout1_delay8;
        butterfly_dout1_delay10 <= butterfly_dout1_delay9;
        butterfly_dout1_delay11 <= butterfly_dout1_delay10;
        butterfly_dout1_delay12 <= butterfly_dout1_delay11;
        butterfly_dout1_delay13 <= butterfly_dout1_delay12;
        butterfly_dout1_delay14 <= butterfly_dout1_delay13;
        butterfly_dout1_delay15 <= butterfly_dout1_delay14;
        butterfly_dout1_delay16 <= butterfly_dout1_delay15;
        butterfly_dout1_delay17 <= butterfly_dout1_delay16;
        butterfly_dout1_delay18 <= butterfly_dout1_delay17;
        butterfly_dout1_delay19 <= butterfly_dout1_delay18;
        butterfly_dout1_delay20 <= butterfly_dout1_delay19;
        butterfly_dout1_delay21 <= butterfly_dout1_delay20;
        butterfly_dout1_delay22 <= butterfly_dout1_delay21;
        butterfly_dout1_delay23 <= butterfly_dout1_delay22;
        butterfly_dout1_delay24 <= butterfly_dout1_delay23;
        butterfly_dout1_delay25 <= butterfly_dout1_delay24;
        butterfly_dout1_delay26 <= butterfly_dout1_delay25;
        butterfly_dout1_delay27 <= butterfly_dout1_delay26;
        butterfly_dout1_delay28 <= butterfly_dout1_delay27;
        butterfly_dout1_delay29 <= butterfly_dout1_delay28;
        butterfly_dout1_delay30 <= butterfly_dout1_delay29;
        butterfly_dout1_delay31 <= butterfly_dout1_delay30;
        butterfly_dout1_delay32 <= butterfly_dout1_delay31;
        butterfly_dout1_delay33 <= butterfly_dout1_delay32;
        butterfly_dout1_delay34 <= butterfly_dout1_delay33;
        butterfly_dout1_delay35 <= butterfly_dout1_delay34;
        butterfly_dout1_delay36 <= butterfly_dout1_delay35;
        butterfly_dout1_delay37 <= butterfly_dout1_delay36;
        butterfly_dout1_delay38 <= butterfly_dout1_delay37;
        butterfly_dout1_delay39 <= butterfly_dout1_delay38;
        butterfly_dout1_delay40 <= butterfly_dout1_delay39;
        butterfly_dout1_delay41 <= butterfly_dout1_delay40;
        butterfly_dout1_delay42 <= butterfly_dout1_delay41;
        butterfly_dout1_delay43 <= butterfly_dout1_delay42;
        butterfly_dout1_delay44 <= butterfly_dout1_delay43;
        butterfly_dout1_delay45 <= butterfly_dout1_delay44;
        butterfly_dout1_delay46 <= butterfly_dout1_delay45;
        butterfly_dout1_delay47 <= butterfly_dout1_delay46;
        butterfly_dout1_delay48 <= butterfly_dout1_delay47;
        butterfly_dout1_delay49 <= butterfly_dout1_delay48;
        butterfly_dout1_delay50 <= butterfly_dout1_delay49;
        butterfly_dout1_delay51 <= butterfly_dout1_delay50;
        butterfly_dout1_delay52 <= butterfly_dout1_delay51;
        butterfly_dout1_delay53 <= butterfly_dout1_delay52;
        butterfly_dout1_delay54 <= butterfly_dout1_delay53;
        butterfly_dout1_delay55 <= butterfly_dout1_delay54;
        butterfly_dout1_delay56 <= butterfly_dout1_delay55;
        butterfly_dout1_delay57 <= butterfly_dout1_delay56;
        butterfly_dout1_delay58 <= butterfly_dout1_delay57;
        butterfly_dout1_delay59 <= butterfly_dout1_delay58;
        butterfly_dout1_delay60 <= butterfly_dout1_delay59;
        butterfly_dout1_delay61 <= butterfly_dout1_delay60;
        butterfly_dout1_delay62 <= butterfly_dout1_delay61;
        butterfly_dout1_delay63 <= butterfly_dout1_delay62;
        butterfly_dout1_delay64 <= butterfly_dout1_delay63;
        butterfly_dout1_delay65 <= butterfly_dout1_delay64;
        butterfly_dout1_delay66 <= butterfly_dout1_delay65;
        butterfly_dout1_delay67 <= butterfly_dout1_delay66;
        butterfly_dout1_delay68 <= butterfly_dout1_delay67;
        butterfly_dout1_delay69 <= butterfly_dout1_delay68;
        butterfly_dout1_delay70 <= butterfly_dout1_delay69;
        butterfly_dout1_delay71 <= butterfly_dout1_delay70;
        butterfly_dout1_delay72 <= butterfly_dout1_delay71;
        butterfly_dout1_delay73 <= butterfly_dout1_delay72;
        butterfly_dout1_delay74 <= butterfly_dout1_delay73;
        butterfly_dout1_delay75 <= butterfly_dout1_delay74;
        butterfly_dout1_delay76 <= butterfly_dout1_delay75;
        butterfly_dout1_delay77 <= butterfly_dout1_delay76;
        butterfly_dout1_delay78 <= butterfly_dout1_delay77;
        butterfly_dout1_delay79 <= butterfly_dout1_delay78;
        butterfly_dout1_delay80 <= butterfly_dout1_delay79;
        butterfly_dout1_delay81 <= butterfly_dout1_delay80;
        butterfly_dout1_delay82 <= butterfly_dout1_delay81;
        butterfly_dout1_delay83 <= butterfly_dout1_delay82;
        butterfly_dout1_delay84 <= butterfly_dout1_delay83;
        butterfly_dout1_delay85 <= butterfly_dout1_delay84;
        butterfly_dout1_delay86 <= butterfly_dout1_delay85;
        butterfly_dout1_delay87 <= butterfly_dout1_delay86;
        butterfly_dout1_delay88 <= butterfly_dout1_delay87;
        butterfly_dout1_delay89 <= butterfly_dout1_delay88;
        butterfly_dout1_delay90 <= butterfly_dout1_delay89;
        butterfly_dout1_delay91 <= butterfly_dout1_delay90;
        butterfly_dout1_delay92 <= butterfly_dout1_delay91;
        butterfly_dout1_delay93 <= butterfly_dout1_delay92;
        butterfly_dout1_delay94 <= butterfly_dout1_delay93;
        butterfly_dout1_delay95 <= butterfly_dout1_delay94;
        butterfly_dout1_delay96 <= butterfly_dout1_delay95;
        butterfly_dout1_delay97 <= butterfly_dout1_delay96;
        butterfly_dout1_delay98 <= butterfly_dout1_delay97;
        butterfly_dout1_delay99 <= butterfly_dout1_delay98;
        butterfly_dout1_delay100 <= butterfly_dout1_delay99;
        butterfly_dout1_delay101 <= butterfly_dout1_delay100;

        butterfly_dout2_delay1 <= butterfly_dout2;
        butterfly_dout2_delay2 <= butterfly_dout2_delay1;
        butterfly_dout2_delay3 <= butterfly_dout2_delay2;
        butterfly_dout2_delay4 <= butterfly_dout2_delay3;
        butterfly_dout2_delay5 <= butterfly_dout2_delay4;
        butterfly_dout2_delay6 <= butterfly_dout2_delay5;
        butterfly_dout2_delay7 <= butterfly_dout2_delay6;
        butterfly_dout2_delay8 <= butterfly_dout2_delay7;
        butterfly_dout2_delay9 <= butterfly_dout2_delay8;
        butterfly_dout2_delay10 <= butterfly_dout2_delay9;
        butterfly_dout2_delay11 <= butterfly_dout2_delay10;
        butterfly_dout2_delay12 <= butterfly_dout2_delay11;
        butterfly_dout2_delay13 <= butterfly_dout2_delay12;
        butterfly_dout2_delay14 <= butterfly_dout2_delay13;
        butterfly_dout2_delay15 <= butterfly_dout2_delay14;
        butterfly_dout2_delay16 <= butterfly_dout2_delay15;
        butterfly_dout2_delay17 <= butterfly_dout2_delay16;
        butterfly_dout2_delay18 <= butterfly_dout2_delay17;
        butterfly_dout2_delay19 <= butterfly_dout2_delay18;
        butterfly_dout2_delay20 <= butterfly_dout2_delay19;
        butterfly_dout2_delay21 <= butterfly_dout2_delay20;
        butterfly_dout2_delay22 <= butterfly_dout2_delay21;
        butterfly_dout2_delay23 <= butterfly_dout2_delay22;
        butterfly_dout2_delay24 <= butterfly_dout2_delay23;
        butterfly_dout2_delay25 <= butterfly_dout2_delay24;
        butterfly_dout2_delay26 <= butterfly_dout2_delay25;
        butterfly_dout2_delay27 <= butterfly_dout2_delay26;
        butterfly_dout2_delay28 <= butterfly_dout2_delay27;
        butterfly_dout2_delay29 <= butterfly_dout2_delay28;
        butterfly_dout2_delay30 <= butterfly_dout2_delay29;
        butterfly_dout2_delay31 <= butterfly_dout2_delay30;
        butterfly_dout2_delay32 <= butterfly_dout2_delay31;
        butterfly_dout2_delay33 <= butterfly_dout2_delay32;
        butterfly_dout2_delay34 <= butterfly_dout2_delay33;
        butterfly_dout2_delay35 <= butterfly_dout2_delay34;
        butterfly_dout2_delay36 <= butterfly_dout2_delay35;
        butterfly_dout2_delay37 <= butterfly_dout2_delay36;
        butterfly_dout2_delay38 <= butterfly_dout2_delay37;
        butterfly_dout2_delay39 <= butterfly_dout2_delay38;
        butterfly_dout2_delay40 <= butterfly_dout2_delay39;
        butterfly_dout2_delay41 <= butterfly_dout2_delay40;
        butterfly_dout2_delay42 <= butterfly_dout2_delay41;
        butterfly_dout2_delay43 <= butterfly_dout2_delay42;
        butterfly_dout2_delay44 <= butterfly_dout2_delay43;
        butterfly_dout2_delay45 <= butterfly_dout2_delay44;
        butterfly_dout2_delay46 <= butterfly_dout2_delay45;
        butterfly_dout2_delay47 <= butterfly_dout2_delay46;
        butterfly_dout2_delay48 <= butterfly_dout2_delay47;
        butterfly_dout2_delay49 <= butterfly_dout2_delay48;
        butterfly_dout2_delay50 <= butterfly_dout2_delay49;
        butterfly_dout2_delay51 <= butterfly_dout2_delay50;
        butterfly_dout2_delay52 <= butterfly_dout2_delay51;
        butterfly_dout2_delay53 <= butterfly_dout2_delay52;
        butterfly_dout2_delay54 <= butterfly_dout2_delay53;
        butterfly_dout2_delay55 <= butterfly_dout2_delay54;
        butterfly_dout2_delay56 <= butterfly_dout2_delay55;
        butterfly_dout2_delay57 <= butterfly_dout2_delay56;
        butterfly_dout2_delay58 <= butterfly_dout2_delay57;
        butterfly_dout2_delay59 <= butterfly_dout2_delay58;
        butterfly_dout2_delay60 <= butterfly_dout2_delay59;
        butterfly_dout2_delay61 <= butterfly_dout2_delay60;
        butterfly_dout2_delay62 <= butterfly_dout2_delay61;
        butterfly_dout2_delay63 <= butterfly_dout2_delay62;
        butterfly_dout2_delay64 <= butterfly_dout2_delay63;
        butterfly_dout2_delay65 <= butterfly_dout2_delay64;
        butterfly_dout2_delay66 <= butterfly_dout2_delay65;
        butterfly_dout2_delay67 <= butterfly_dout2_delay66;
        butterfly_dout2_delay68 <= butterfly_dout2_delay67;
        butterfly_dout2_delay69 <= butterfly_dout2_delay68;
        butterfly_dout2_delay70 <= butterfly_dout2_delay69;
        butterfly_dout2_delay71 <= butterfly_dout2_delay70;
        butterfly_dout2_delay72 <= butterfly_dout2_delay71;
        butterfly_dout2_delay73 <= butterfly_dout2_delay72;
        butterfly_dout2_delay74 <= butterfly_dout2_delay73;
        butterfly_dout2_delay75 <= butterfly_dout2_delay74;
        butterfly_dout2_delay76 <= butterfly_dout2_delay75;
        butterfly_dout2_delay77 <= butterfly_dout2_delay76;
        butterfly_dout2_delay78 <= butterfly_dout2_delay77;
        butterfly_dout2_delay79 <= butterfly_dout2_delay78;
        butterfly_dout2_delay80 <= butterfly_dout2_delay79;
        butterfly_dout2_delay81 <= butterfly_dout2_delay80;
        butterfly_dout2_delay82 <= butterfly_dout2_delay81;
        butterfly_dout2_delay83 <= butterfly_dout2_delay82;
        butterfly_dout2_delay84 <= butterfly_dout2_delay83;
        butterfly_dout2_delay85 <= butterfly_dout2_delay84;
        butterfly_dout2_delay86 <= butterfly_dout2_delay85;
        butterfly_dout2_delay87 <= butterfly_dout2_delay86;
        butterfly_dout2_delay88 <= butterfly_dout2_delay87;
        butterfly_dout2_delay89 <= butterfly_dout2_delay88;
        butterfly_dout2_delay90 <= butterfly_dout2_delay89;
        butterfly_dout2_delay91 <= butterfly_dout2_delay90;
        butterfly_dout2_delay92 <= butterfly_dout2_delay91;
        butterfly_dout2_delay93 <= butterfly_dout2_delay92;
        butterfly_dout2_delay94 <= butterfly_dout2_delay93;
        butterfly_dout2_delay95 <= butterfly_dout2_delay94;
        butterfly_dout2_delay96 <= butterfly_dout2_delay95;
        butterfly_dout2_delay97 <= butterfly_dout2_delay96;
        butterfly_dout2_delay98 <= butterfly_dout2_delay97;
        butterfly_dout2_delay99 <= butterfly_dout2_delay98;
        butterfly_dout2_delay100 <= butterfly_dout2_delay99;
        butterfly_dout2_delay101 <= butterfly_dout2_delay100;
	end
end

wire [31+1:0] add; // len(add) = len(mod_add) + 1
wire [31:0] sub, mod_add, mod_sub;
wire [31:0] mod_add_dia, mod_add_dib, mod_sub_dia, mod_sub_dib;

//32-bit mod_add
assign add = mod_add_dia + mod_add_dib; 
assign mod_add = add < PARAM_MOD ? add : add - PARAM_MOD;

//32-bit mod_sub
assign sub = mod_sub_dia - mod_sub_dib;
assign mod_sub = (mod_sub_dia > mod_sub_dib) | (mod_sub_dia == mod_sub_dib) ? sub : sub + PARAM_MOD;

//32-bit mod_mul, driven by DSP
reg [31:0] mul_dina, mul_dinb;
wire [63:0] mul_dout;
wire [31:0] mod_mul;

//32-bit butterfly output
always @(posedge clk) begin
     if (~rst_b) begin
         // reset
         butterfly_dout1 <= 0;
         butterfly_dout2 <= 0;
     end
     else begin
         butterfly_dout1 <= mod_add;
         butterfly_dout2 <= mod_sub;
     end
 end 

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        mul_dina <= 0;
        mul_dinb <= 0;
    end
    else begin
        mul_dina <= butterfly_din2;
        mul_dinb <= twiddle_factor_din;        
    end
end



//32bit*32bit integer multiplication, delay = 6 clock cycles
mult_gen_32x32 mul32x32(
    .CLK        (clk),
    .A          (mul_dina),
    .B          (mul_dinb),
    .P          (mul_dout)
    );

//Barret modular reduction   Barret params: r = 816642, k = 32, delay = 17 clock cycles
wire [63:0] barret_din;
wire [31:0] barret_dout;
wire barret_din_valid, barret_dout_valid;

reg [1:0]   current_state_delay1, current_state_delay2, current_state_delay3,
			current_state_delay4, current_state_delay5, current_state_delay6,
			current_state_delay7, current_state_delay8, current_state_delay9;// delay curret_state by 3+MUL_delay cycles to output barret_din_valid

assign barret_din = mul_dout;
assign barret_din_valid = current_state_delay9 == 2'd1 ? 1'b1 : 1'b0;

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        current_state_delay1 <= 0;
        current_state_delay2 <= 0;
        current_state_delay3 <= 0;
        current_state_delay4 <= 0;
        current_state_delay5 <= 0;
        current_state_delay6 <= 0;
        current_state_delay7 <= 0;
        current_state_delay8 <= 0;
        current_state_delay9 <= 0;
	end
	else begin
        current_state_delay1 <= current_state;
        current_state_delay2 <= current_state_delay1;
        current_state_delay3 <= current_state_delay2;
        current_state_delay4 <= current_state_delay3;
        current_state_delay5 <= current_state_delay4;
        current_state_delay6 <= current_state_delay5;
        current_state_delay7 <= current_state_delay6;
        current_state_delay8 <= current_state_delay7;
        current_state_delay9 <= current_state_delay8;
	end
end

assign mod_add_dia = butterfly_din1_delay24;
assign mod_add_dib = barret_dout;

assign mod_sub_dia = butterfly_din1_delay24;
assign mod_sub_dib = barret_dout;

assign idle1_done = barret_dout_valid;
assign butterfly_dout_valid = barret_dout_valid;

Barret_reduce #(
    .PARAM_R(33'd4294977535),
    .PARAM_K(32),
    .PARAM_MOD(32'd4294957057))
    Barret(
    .clk        (clk),
    .rst_b      (rst_b),
    .din        (barret_din),
    .din_valid  (barret_din_valid),
    .dout       (barret_dout),
    .dout_valid (barret_dout_valid)
);


/*********************
 * Memory part
 ********************/    

mem_dp #( 
        .WIDTH(32),
        .DEPTH(1024/4)
    )
data(
  .clka     (clk),
  .wea      (data_wea),
  .ena      (data_ena),
  .dina      (data_dia),
  .addra    (data_addra),
  .douta      (data_doa), 

  .clkb     (clk),
  .web      (data_web),
  .enb      (data_enb),
  .dinb      (data_dib),
  .addrb    (data_addrb),
  .doutb      (data_dob) 
);

mem_sp #(
    .WIDTH(32), 
    .DEPTH(257),  // 1+1+1+2+4+8+16+32+64+128
    .FILE(FILE))
twiddle_factor(
  .clk      (clk),
  .di       (32'b0),
  .addr     (twiddle_factor_addr_delay1),
  .en       (twiddle_factor_en),
  .we       (1'b0),
  .do       (twiddle_factor_din)
);

// distance LUT
always@(roundi) begin
    case(roundi)
       4'd0: dist <= 128;
       4'd1: dist <= 128;
       4'd2: dist <= 128;
       4'd3: dist <= 64;
       4'd4: dist <= 32;
       4'd5: dist <= 16;
       4'd6: dist <= 8;
       4'd7: dist <= 4;
       4'd8: dist <= 2;
       4'd9: dist <= 1;
       default: dist <= 0;
	endcase
end

endmodule
