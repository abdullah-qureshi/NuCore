module nucore_tb;
reg [1:0] key;
wire [31:0] out;
wire zero;
//wire [31:0] regA;
//wire [31:0] regB;
//wire [38:0] inst;
wire [6:0] hex0;
wire [6:0] hex1;
wire [6:0] hex2;
wire [6:0] hex3;
wire [6:0] hex4;
wire [6:0] hex5;
nucore Core1 (key,hex0,hex1,hex2,hex3,hex4,hex5, out, zero);

initial begin
key [0] = 0; key [1] = 1;
#200 key [1] = 0;
end


always 
#100  key [0] =  ! key [0];


endmodule