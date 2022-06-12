//Output register; the output of ALU is stored in this register.
module out_reg (clk, reset, reg_reset ,in, out);

input clk,reset,reg_reset;
input [31:0] in;
output reg [31:0] out;
assign rst = reset | reg_reset;

always @(posedge clk)
begin

if (rst)
out <= 32'b0;
else
out [31:0] <= in [31:0];
end

endmodule
