`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:55 12/19/2020 
// Design Name: 
// Module Name:    MAC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MAC2(
	input [7:0] bias,
	input ld_reg,inc,
	input[7:0] A,
	input[7:0] B,
	input clk,
	input init,
	output wire [20:0] out
    );
	 
	//always@(posedge clk)begin
		//if(init == 1'b1)
			//out <= 21'b0;
	//end
	wire[20:0] reg_out;
	wire [15:0] mult_out;
	wire [20:0] se_mult_out;
	wire [20:0] add_out;
	Mult mult(clk,A,B,mult_out);
	assign se_mult_out = (mult_out[15]==1'b1)?{5'b11111,mult_out}:{5'b00000,mult_out} ;
	Adder adder(se_mult_out,reg_out,add_out);
	Reg15 register15(bias,ld_reg,add_out,clk,init,reg_out);
	assign out = reg_out;
endmodule
