//Zero flag register; the output of ZF is stored in this register.
module zero_reg (clk, reset, reg_reset, in, out);

input clk,reset,reg_reset;
input in;
output reg out;

always @(posedge clk)
begin

if (reset | reg_reset)
out <= 1'b0;
else
out <= in;
end

endmodule
