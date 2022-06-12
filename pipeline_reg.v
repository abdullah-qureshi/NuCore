module pipeline_reg # (
    parameter WIDTH = 32
  )
  (
    input                  clk,
    input                  resetn,
    input [WIDTH-1:0]      in,
    output reg [WIDTH-1:0] out
  );


    always @ (posedge clk)
    begin
      if (resetn)
      begin
        out <= 0;
      end
      else
      begin
        out <= in;
      end
    end
	 
endmodule
