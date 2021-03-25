`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:41 12/19/2020 
// Design Name: 
// Module Name:    Reg15 
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
module Reg15(
	input[7:0] bias,
	input ld_reg,
    input[20:0] in,
    input clk,
    input init,
    output reg[20:0] out
    );
	 
	reg [15:0] bias_mult_127;
	always@(posedge clk)begin
		if (init)begin
			bias_mult_127 = bias * 127;
			if(bias_mult_127[15] == 1'b0)begin
				out <= {5'b0,bias_mult_127};
			end
			
			else begin
				out <= {5'b11111,bias_mult_127};
			end
			
		end
		
		else begin
			if(ld_reg)
				out <= in;
		end
		
	end
endmodule
