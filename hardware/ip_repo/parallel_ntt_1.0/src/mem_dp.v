
/*
 * Dual-ported memory module.
 *
 * Public domain.
 *
 */
`include "clog2.v"

module mem_dp #(parameter WIDTH = 8, DEPTH = 64, FILE = "")(
  input  wire                 clka,
  input  wire                 wea,
  input  wire                 ena,
  input  wire [WIDTH-1:0]     dia,
  input  wire [`CLOG2(DEPTH)-1:0] addra,
  output reg  [WIDTH-1:0]     doa, 

  input  wire                 clkb,
  input  wire                 web,
  input  wire                 enb,
  input  wire [WIDTH-1:0]     dib,
  input  wire [`CLOG2(DEPTH)-1:0] addrb,
  output reg  [WIDTH-1:0]     dob 
);

  reg [WIDTH-1:0] mem [0:DEPTH-1] /* synthesis ramstyle = "M20K" */;

  integer file;
  integer scan;
  integer i;

  initial
    begin
      // read file contents if FILE is given
      if (FILE != "")
        $readmemb(FILE, mem);

      // set all data to 0 if INIT is true
      else
        for (i = 0; i < DEPTH; i = i + 1)
          mem[i] = {WIDTH{1'b0}};
   end

  `ifdef READ_FIRST 
    always @ (posedge clka)
    begin
      if (ena) begin
        if (wea) begin
          mem[addra] <= dia;
          doa <= mem[addra];
        end
        else 
          doa <= mem[addra];
      end
    end
  `else
    always @ (posedge clka)
    begin
      if (ena) begin
        if (wea) begin
          mem[addra] <= dia;
          doa <= dia;
        end
        else 
          doa <= mem[addra];
      end
    end
  `endif


  `ifdef READ_FIRST 
    always @ (posedge clkb)
    begin
      if (enb) begin
        if (web) begin
          mem[addrb] <= dib;
          dob <= mem[addrb];
        end
        else 
          dob <= mem[addrb];
      end
    end
  `else
    always @ (posedge clkb)
    begin
      if (enb) begin
        if (web) begin
          mem[addrb] <= dib;
          dob <= dib;
        end
        else 
          dob <= mem[addrb];
      end
    end
  `endif

 

endmodule

