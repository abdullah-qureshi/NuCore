module register_file (clk, reset, reg_reset, readreg, writereg, writedata, write_en, readdata);

  input [3:0] readreg, writereg; // Address of the register to read/write
  input [31:0] writedata; // Data to wrie
  input reg_reset;// Reset registers instruction control
  input reset; // FSM reset
  // write_en = 0, READ Operation
  // write_en = 1, WRITE Operation
  input clk, write_en;
  output reg [31:0] readdata;

  reg [15:0] regfile [31:0]; // 16 deep 32 bit register size
  integer i;
  
  // Intializing registers with random values.
  /*initial begin
      for (i=1; i<16; i=i+1)   
	begin
         regfile[i]= 32'b0;
	end
end*/

  always @(posedge clk)
  begin
  
  if (reset | reg_reset)
  begin
  for (i=1; i<16; i=i+1)   
	begin
         regfile[i]= 32'b0;
	end
  end
	
	if (write_en) 
	 	regfile[writereg] = writedata;
	readdata = regfile[readreg];
   end

  //assign readdata = regfile[readreg];
  
endmodule