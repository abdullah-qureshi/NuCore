module InstQueue (input memread, input [5:0] address, output reg [38:0] readdata);
 
  reg [38:0] mem_array [63:0]; // 64 Deep 39 bit instructions
  reg [38:0]temp;
  integer i;
  // Intializing instruction queue with zeros.
  initial begin
    for (i=11; i<64; i=i+1)   
	begin
       	mem_array[i]=39'b0;
	end
  end
  
  always@(*)
  begin
    if(memread)
	 begin
      temp=address;
      readdata=mem_array[temp];
    end
	 
	//TESTBENCH
    //////////////////////////////////////////////////////////////////////////////////////////////////////// Test Bench
	//lvl 1
	
	mem_array[0]={3'b000,4'b0001,32'd1};// Reset and clear registers
	mem_array[1]={3'b001,4'b0001,32'd1};// Store 1 in memory location 1
	mem_array[2]={3'b001,4'b0010,32'd2};// Store 2 in memory location 2
	mem_array[3]={3'b001,4'b0011,32'd3};// Store 3 in memory location 3
	mem_array[4]={3'b001,4'b0100,32'd4};// Store 4 in memory location 4
	mem_array[5]={3'b001,4'b0101,32'd5};// Store 5 in memory location 5
	mem_array[6]={3'b001,4'b0110,32'd6};// Store 6 in memory location 6
	mem_array[7]={3'b001,4'b0111,32'd7};// Store 7 in memory location 7
	mem_array[8]={3'b001,4'b1000,32'd8};// Store 8 in memory locaation 8
	mem_array[9]={3'b001,4'b1001,32'd9};// Store 9 in memory locaation 9
	mem_array[10]={3'b001,4'b1011,32'd10};// Store 10 in memory locaation 10
	///////////////////////////////////////////////////////////////////////
	//lvl 2
	mem_array[11]={3'b010,4'b0001,32'd10};// Store 1 in memory locaation 11
	mem_array[12]={3'b010,4'b0010,32'd9};// Store 2 in memory locaation 12
	mem_array[13]={3'b010,4'b0011,32'd8};// Store 3 in memory locaation 13
	mem_array[14]={3'b010,4'b0100,32'd7};// Store 4 in memory locaation 14
	mem_array[15]={3'b010,4'b0101,32'd6};// Store 5 in memory locaation 15
	mem_array[16]={3'b010,4'b0110,32'd5};// Store 6 in memory locaation 16
	mem_array[17]={3'b010,4'b0111,32'd4};// Store 7 in memory locaation 17
	mem_array[18]={3'b010,4'b1000,32'd3};// Store 8 in memory locaation 18
	mem_array[19]={3'b010,4'b1001,32'd2};// Store 9 in memory locaation 19
	mem_array[20]={3'b010,4'b1011,32'd1};// Store 10 in memory locaation 20
	
	///////////////////////////////////////////////////////////////////////
	//lvl 3
	mem_array[21]={3'b011,4'b0001,4'b0001,28'd0};// ADD RegA and RegB
	mem_array[22]={3'b011,4'b0010,4'b0010,28'd0};// ADD RegA and RegB
	mem_array[23]={3'b011,4'b0011,4'b0011,28'd0};// ADD RegA and RegB
	mem_array[24]={3'b011,4'b0100,4'b0100,28'd0};// ADD RegA and RegB
	mem_array[25]={3'b011,4'b0101,4'b0101,28'd0};// ADD RegA and RegB
	mem_array[26]={3'b011,4'b0110,4'b0110,28'd0};// ADD RegA and RegB
	mem_array[27]={3'b011,4'b0111,4'b0111,28'd0};// ADD RegA and RegB
	mem_array[28]={3'b011,4'b1000,4'b1000,28'd0};// ADD RegA and RegB
	mem_array[29]={3'b011,4'b1001,4'b1001,28'd0};// ADD RegA and RegB
	mem_array[30]={3'b011,4'b1010,4'b1010,28'd0};// ADD RegA and RegB
	
	
		///////////////////////////////////////////////////////////////////////
	//lvl 4
	mem_array[31]={3'b110,4'b0001,4'b0001,28'd0};// AND RegA and RegB
	mem_array[32]={3'b110,4'b0010,4'b0010,28'd0};// AND RegA and RegB
	mem_array[33]={3'b110,4'b0011,4'b0011,28'd0};// AND RegA and RegB
	mem_array[34]={3'b110,4'b0100,4'b0100,28'd0};// AND RegA and RegB
	mem_array[35]={3'b110,4'b0101,4'b0101,28'd0};// AND RegA and RegB
	mem_array[36]={3'b110,4'b0110,4'b0110,28'd0};// AND RegA and RegB
	mem_array[37]={3'b110,4'b0111,4'b0111,28'd0};// AND RegA and RegB
	mem_array[38]={3'b110,4'b1000,4'b1000,28'd0};// AND RegA and RegB
	mem_array[39]={3'b110,4'b1001,4'b1001,28'd0};// AND RegA and RegB
	mem_array[40]={3'b110,4'b1010,4'b1010,28'd0};// AND RegA and RegB
	
  end
endmodule

