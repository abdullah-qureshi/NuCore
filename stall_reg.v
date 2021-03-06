module stall_reg (clk, in, out);

input clk;
input [2:0] in;
output reg [2:0] out;

always @(posedge clk)
begin
out <= in;
end

endmodule
