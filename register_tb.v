module register_tb;

reg[4:0] rreg;
reg[4:0] wreg;
reg clk;
reg w_en;
reg [31:0] in;
wire [31:0] out;

register_file regA (clk, rreg, wreg, in, w_en, out);

initial begin
clk = 0; rreg =5'b00001; wreg = 5'b00001; w_en = 1; in = 32'd69;
#50 rreg =5'b00001; wreg = 5'b00001; w_en = 0; in = 32'd69;
end


always 
#10  clk =  ! clk;

endmodule