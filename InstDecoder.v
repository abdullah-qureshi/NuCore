module InstDecoder (inst,reg_reset, ALU_control,regA,regB,write_A,write_B,read_A,read_B,store_value);
input [38:0] inst;
output reg reg_reset;
output reg [2:0] ALU_control;
output reg [3:0] regA;
output reg [3:0] regB;
output reg write_A;
output reg write_B;
output reg read_A;
output reg read_B;
output reg [31:0] store_value;

assign opcode = inst[38:36];

always @(*)
begin
  
	if(inst[38:36]==3'b000)
	begin
	ALU_control <= 3'b000;
	regA <= 4'b0;
	regB <= 4'b0;
	write_A <= 1'b1;
	write_B <= 1'b1;
	read_A <= 1'b0;
	read_B <= 1'b0;
	store_value <= 32'b0;
	reg_reset <= 1'b1;
	end
	
	else if (inst[38:36] == 3'b001)
	begin
	ALU_control <= 3'b000;
	regA <= inst [35:32];
	regB <= 4'b0;
	write_A <= 1'b1;
	write_B <= 1'b0;
	read_A <= 1'b0;
	read_B <= 1'b0;
	store_value <= inst [31:0];
	reg_reset <= 1'b0;
	end
	
	else if (inst[38:36]==3'b010)
	begin
	ALU_control <= 3'b000;
	regB <= inst [35:32];
	regA <= 4'b0;
	write_A <= 1'b0;
	write_B <= 1'b1;
	read_A <= 1'b0;
	read_B <= 1'b0;
	store_value <= inst [31:0];
	end
		
	
	else
	begin
	ALU_control <= inst[38:36];
	regA <= inst [35:32];
	regB <= inst [31:28];
	write_A <= 1'b0;
	write_B <= 1'b0;
	read_A <= 1'b1;
	read_B <= 1'b1;
	store_value <= 32'b0;
	reg_reset <= 1'b0;
	end

end

endmodule


