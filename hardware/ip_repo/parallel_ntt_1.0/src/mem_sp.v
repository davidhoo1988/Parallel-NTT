
/*
 * Single-ported memory module.
 *
 * Public domain.
 *
 */
`include "clog2.v"

module mem_sp #(parameter WIDTH = 8, DEPTH = 64, FILE = "")(
  input  wire                 clk,
  input  wire [WIDTH-1:0]     di,
  input  wire [`CLOG2(DEPTH)-1:0] addr,
  input  wire                 en,
  input  wire                 we,
  output reg  [WIDTH-1:0]     do
);

(* ram_style = "block" *)  reg [WIDTH-1:0] mem [0:DEPTH-1] /* synthesis ramstyle = "M20K" */;

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
    always @ (posedge clk)
    begin
      if (en) begin
        if (we) begin
          mem[addr] <= di;
          do <= mem[addr];
        end
        else 
          do <= mem[addr];
      end
    end
  `else
    always @ (posedge clk)
    begin
      if (en) begin
        if (we) begin
          mem[addr] <= di;
          do <= di;
        end
        else 
          do <= mem[addr];
      end
    end
  `endif

endmodule

