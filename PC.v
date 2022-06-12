module PC (clk,reset,out, en);

input clk, reset;
output reg [5:0] out;
output reg en;

//Start counter from 0.
initial begin
 out=6'b0;
end

always @(posedge clk)
begin
if(reset) //Synchronous reset
begin
    out <= 6'b0;
	 en <= 1'b1;
end
else
begin
	out <= out + 1; // Increment by 1 after every clock cycle
	en <= 1'b1;
end
end
endmodule
