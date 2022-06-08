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


module NTT_processor #(parameter FILE = "", PARAM_MOD = 32'd4294966657)(
    //extra-connection with parallel_NTT_top
    input wire clk,
    input wire rst_b,
    input wire start,
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

// Define the states of state machine
// The control state machine oversees the reading block RAM, butterfly computation,
// and outputs the results to block RAM
parameter [1:0] IDLE = 1'b0,        // This is the initial/idle state 

                ADDR_CTRL  = 1'b1; // In this state addra and addrb are tuned to read/write block RAM 

// State variable
reg current_state;  
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

// Control state machine implementation
always @(posedge clk) 
begin  
  if (!rst_b) 
  // Synchronous reset (active low)
    begin
      current_state <= IDLE;
    end  
  else
    case (current_state)
      IDLE: 
        // The sink starts providing correct address control when 
        // the start singnal is asserted
          if (start)
            begin
              current_state <= ADDR_CTRL;
            end
          else
            begin
              current_state <= IDLE;
            end
      ADDR_CTRL: 
        // When all interative rounds are completed,
        // state restores to IDLE
        if (roundi == 4 && cntb == 3)
          begin
            current_state <= IDLE;
          end
        else
          begin
            current_state <= ADDR_CTRL;
          end
    endcase
end

// logic control for auxillary variables
always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        cntb <= 0;
    end
    else if (current_state == ADDR_CTRL) begin
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
    else if (current_state == ADDR_CTRL && cntb == 3) begin
        roundi <= roundi + 1'b1;
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
    else if (current_state == ADDR_CTRL) begin
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
    else if (current_state == ADDR_CTRL) begin
        if (cntb == 3)
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

// logic control for block RAM read/write
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
    else if (current_state == ADDR_CTRL) begin // use both PORT-A and PORT-B to read data from block RAM 'data'
        data_wea <= 0;
        data_ena <= 0;
        data_dia <= 0;
        data_addra <= base + cnt;

        data_web <= 0;
        data_enb <= 0;
        data_dib <= 0;
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
reg [31:0] butterfly_dout1;
reg [31:0] butterfly_dout2;
reg [1:0] sel;

wire [31:0] butterfly_din1;
wire [31:0] butterfly_din2;
wire [31:0] twiddle_factor_din;

assign butterfly_din1 = sel == 1 ? inter_connect_0_din : 
                        sel == 2 ? inter_connect_1_din :
                        sel == 3 ? data_doa :
                        32'd0;

assign butterfly_din2 = sel == 1 ? inter_connect_0_din : 
                        sel == 2 ? inter_connect_1_din :
                        sel == 3 ? data_doa :
                        32'd0;

always @(posedge clk) begin
    if (!rst_b) begin
        // reset
        butterfly_dout1 <= 0;
        butterfly_dout2 <= 0;
    end
    else begin
        butterfly_dout1 <= butterfly_din1 + butterfly_din2*twiddle_factor_din;
        butterfly_dout2 <= butterfly_din1 - butterfly_din2*twiddle_factor_din;
    end
end

wire [31:0] add, mod_add, sub, mod_sub;
wire [31:0] mod_add_dia, mod_add_dib, mod_sub_dia, mod_sub_dib;
//32-bit mod_add
assign add = mod_add_dia + mod_add_dib; 
assign mod_add = add < PARAM_MOD ? add : add - PARAM_MOD;

//32-bit mod_sub
assign sub = mod_sub_dia - mod_sub_dib;
assign mod_sub = sub[31] == 0 ? sub : sub + PARAM_MOD;

//32-bit mod_mul, driven by DSP
wire [31:0] mul_dina, mul_dinb;
wire [63:0] mul_dout;
wire [31:0] mod_mul, barret_dout;

assign mod_mul = barret_dout;
//32bit*32bit integer multiplication
mult_gen_32x32 mul32x32(
    .CLK        (clk),
    .A          (mul_dina),
    .B          (mul_dinb),
    .P          (mul_dout)
    );

//Barret modular reduction   Barret params: r = 816642, k = 32
Barret_reduce #(
    .PARAM_R(816642),
    .PARAM_K(32),
    .PARAM_MOD(4294966657))
    Barret(
    .clk        (clk),
    .rst_b      (rst_b),
    .din        (mul_dout),
    .din_valid  (),
    .dout       (barret_dout),
    .dout_valid ()
);

mem_dp #( 
        .WIDTH(32),
        .DEPTH(32/4)
    ) data(
  .clka     (clk),
  .wea      (data_wea),
  .ena      (data_ena),
  .dia      (data_dia),
  .addra    (data_addra),
  .doa      (data_doa), 

  .clkb     (clk),
  .web      (data_web),
  .enb      (data_enb),
  .dib      (data_dib),
  .addrb    (data_addrb),
  .dob      (data_dob) 
);

mem_sp #(
    .WIDTH(32), 
    .DEPTH(9),  // 1+1+1+2+4=9
    .FILE(FILE))
twiddle_factor(
  .clk      (),
  .di       (),
  .addr     (),
  .en       (),
  .we       (),
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
