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

module NTT_processor #(parameter FILE = "", PARAM_MOD = 32'd4294966657, CONFIG = 2'd0)(
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
reg [2:0] data_addra; 

reg data_web, data_enb;
reg [31:0] data_dib;
reg [2:0] data_addrb;
wire [31:0] data_doa;
wire [31:0] data_dob;

reg twiddle_factor_en;
reg [3:0] twiddle_factor_addr, twiddle_factor_addr_delay1;


// Define the states of state machine
// The control state machine oversees the reading block RAM, butterfly computation,
// and outputs the results to block RAM
localparam [1:0] IDLE = 2'd0,        // This is the initial/idle state 

                ADDR_READ  = 1'd1, // In this state addra and addrb are tuned to read block RAM 
                ADDR_WRITE = 2'd2, // In this state addra and addrb are tuned to write bolck RAM
                IDLE1 = 2'd3; // pause state between ADDR_READ and ADDR_WRITE

// State variable
reg [1:0] current_state;  
// iteration round variable
reg [2:0] roundi;
// distance variable
reg [2:0] dist;
//  base variable
reg [2:0] base;
// cntb(counter base) variable
reg [1:0] cntb;
// cnt variable
reg [1:0] cnt;

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
        if (cntb == 3) begin
            current_state <= IDLE1;
        end 
        else begin
            current_state <= ADDR_READ;
        end
      ADDR_WRITE:
        if (roundi == 4 && cntb == 3) begin // When all iterative rounds are completed, state restores to IDLE
            current_state <= IDLE;
        end
        else if (cntb == 3) begin
            current_state <= ADDR_READ;
        end
        else begin
            current_state <= ADDR_WRITE;
        end
      IDLE1:
        if (idle1_done) begin
            current_state <= ADDR_WRITE;
        end 
        else begin
            current_state <= IDLE1;
        end
    endcase
end

assign finish = (current_state == ADDR_WRITE && roundi == 4 && cntb == 3) ? 1'b1 : 1'b0;

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
    else if (current_state == ADDR_WRITE && cntb == 3 && roundi != 4) begin
        roundi <= roundi + 1'b1;
    end
    else if (current_state == ADDR_WRITE) begin
        roundi <= roundi; 
    end
    else if (current_state == ADDR_READ) begin
        roundi <= roundi;
    end
    else if (current_state == IDLE1) begin
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
        if (roundi < 3 && cnt == 3) begin
            cnt <= 0;
        end
        else if (roundi == 3 && cnt == 1) begin
            cnt <= 0;
        end
        else if (roundi == 4 && cnt == 0) begin
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
        if (roundi < 3 && cntb == 3)
            base <= 0;
        else if (roundi == 3 && cntb[0] == 1)
            base <= base + 4;
        else if (roundi == 4)
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
        if (roundi < 3 && cntb == 3)
            twiddle_factor_addr <= twiddle_factor_addr + 1;
        else if (roundi == 3 && cntb[0] == 1)
            twiddle_factor_addr <= twiddle_factor_addr + 1;
        else if (roundi == 4 && cntb != 3)
            twiddle_factor_addr <= twiddle_factor_addr + 1;   
        else 
            twiddle_factor_addr <= twiddle_factor_addr;         
    end
    else if (current_state == ADDR_WRITE || current_state == IDLE1)
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
        data_dia <= butterfly_dout1;
        data_addra <= base + cnt;

        data_web <= 1;
        data_enb <= 1;
        data_dib <= butterfly_dout2;
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

/*reg [31:0]  butterfly_din2_delay1, butterfly_din2_delay2, butterfly_din2_delay3,
            butterfly_din2_delay4, butterfly_din2_delay5, butterfly_din2_delay6,
            butterfly_din2_delay7, butterfly_din2_delay8, butterfly_din2_delay9,
            butterfly_din2_delay10, butterfly_din2_delay11, butterfly_din2_delay12,
            butterfly_din2_delay13, butterfly_din2_delay14, butterfly_din2_delay15,
            butterfly_din2_delay16, butterfly_din2_delay17;*/

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
    else if (current_state == ADDR_READ || current_state == ADDR_WRITE) begin
        if (roundi < 2 && cntb == 0)
            sel <= sel + 1;
        else if (roundi == 2 && cntb == 0)
            sel <= 1;
        else if (roundi == 3 && cntb == 0)
            sel <= 3;
        else 
            sel <= sel;            
    end
    else begin
        sel <= 0;
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
            current_state_delay7, current_state_delay8, current_state_delay9; // delay curret_state by 3+MUL_delay cycles to output barret_din_valid

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
    .PARAM_R(33'd4294967935),
    .PARAM_K(32),
    .PARAM_MOD(32'd4294966657))
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
        .DEPTH(32/4)
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
    .DEPTH(9),  // 1+1+1+2+4=9
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
       3'd0: dist <= 4;
       3'd1: dist <= 4;
       3'd2: dist <= 4;
       3'd3: dist <= 2;
       3'd4: dist <= 1;
       default: dist <= 0;  
    endcase
end

endmodule
