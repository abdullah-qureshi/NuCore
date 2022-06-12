module nucore (KEY,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,LEDR, nucore_out, z_flag);
input [1:0] KEY;
output [9:0] LEDR;
output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
wire clk, reset;
output [31:0] nucore_out;
output z_flag;

assign LEDR[0] = z_flag;
assign clk = ~KEY[0];
assign reset = ~KEY[1];

wire[31:0] out_A, out_B;
wire [5:0] count;
wire [38:0] inst_out;
wire [38:0] inst_in;
wire[2:0] ALU_control_in, ALU_control_out;
wire [3:0] address_A_in,address_A_out;
wire [3:0] address_B_in, address_B_out;
wire [31:0] val_in, val_out;
wire wrt_A_in, wrt_A_out;
wire wrt_B_in, wrt_B_out;

wire [31:0] ALU_out;

PC program_counter (clk, reset, count, pc_enable);
InstQueue IQ (pc_enable, count, inst_in);
//Pipelining for instruction queue output
pipeline_reg #(39) p1 (clk, reset, inst_in, inst_out);
////////////////////////////////////////
InstDecoder ID (inst_out, reg_reset_in, ALU_control_in, address_A_in, address_B_in, wrt_A_in, wrt_B_in,rd_A_in, rd_B_in, val_in);
//Pipelining for instruction decoder output
pipeline_reg #(1) p3 (clk, reset, reg_reset_in, reg_reset_out);
pipeline_reg #(3) p4 (clk, reset, ALU_control_in, ALU_control_out);
pipeline_reg #(4) p5 (clk, reset, address_A_in, address_A_out);
pipeline_reg #(4) p6 (clk, reset, address_B_in, address_B_out);
pipeline_reg #(1) p7 (clk, reset, wrt_A_in, wrt_A_out);
pipeline_reg #(1) p8 (clk, reset, wrt_B_in, wrt_B_out);
pipeline_reg #(32) p9 (clk, reset, val_in, val_out);
//////////////////////////////////////////////////
register_file regA (clk, reset,reg_reset_out, address_A_out, address_A_out, val_out, wrt_A_out, out_A);
register_file regB (clk,reset,reg_reset_out, address_B_out, address_B_out, val_out, wrt_B_out, out_B);

ALU alu (out_A, out_B, ALU_control_out, ALU_out, zero);
out_reg output_register (clk, reset, reg_reset, ALU_out, nucore_out);

zero_reg ZF_register (clk, reset, reg_reset, zero, z_flag);

//Output output values on 7-segment display

display_binary_to_HEX disp1(nucore_out[3:0], HEX0);
display_binary_to_HEX disp2(nucore_out[7:4], HEX1);
display_binary_to_HEX disp3(out_A[3:0], HEX2);
display_binary_to_HEX disp4(out_A[7:4], HEX3);
display_binary_to_HEX disp5(out_B[3:0], HEX4);
display_binary_to_HEX disp6(out_B[7:4], HEX5);
endmodule

module display_binary_to_HEX (A, Disp);
input [3:0] A;
output reg [6:0] Disp;
always @(*) begin
case (A)
4'd0 : Disp = 7'b1000000;
4'd1 : Disp = 7'b1111001;
4'd2 : Disp = 7'b0100100;
4'd3 : Disp = 7'b0110000;
4'd4 : Disp = 7'b0011001;
4'd5 : Disp = 7'b0010010;
4'd6 : Disp = 7'b0000010;
4'd7 : Disp = 7'b1111000;
4'd8 : Disp = 7'b0000000;
4'd9 : Disp = 7'b0010000;
4'd10 : Disp = 7'b0001000;
4'd11 : Disp = 7'b0000011;
4'd12 : Disp = 7'b1000110;
4'd13 : Disp = 7'b0100001;
4'd14 : Disp = 7'b0000110;
4'd15 : Disp = 7'b0001110;

default: Disp = 7'b1000000;
endcase
end
endmodule

