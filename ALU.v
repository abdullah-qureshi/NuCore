module ALU(data1,data2, aluoperation, result, zero);

input [31:0] data1, data2;
input [2:0] aluoperation;
output reg [31:0] result;
output reg zero;

// Combinational block
  always@(*)
  begin 
	   case (aluoperation)
      3'b011 : result <= data1 + data2; // ADD
      3'b100 : result <= data1 - data2; // SUB
      3'b101 : result <= data1 | data2; // OR
      3'b110 : result <= data1 & data2; // AND
      3'b111 : result <= data1 << data2; // shift left
      
      default : result <= data1 + data2; // ADD
    endcase
   
    if (result==32'd0) 
		 zero<=1'b1;
    else
		 zero<=1'b0;
  end

endmodule

