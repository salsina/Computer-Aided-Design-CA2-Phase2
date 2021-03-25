`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:12 12/19/2020 
// Design Name: 
// Module Name:    Mult 
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
module Mult(
	 input clk,
    input [7:0] A,
    input [7:0] B,
    output reg [15:0] out
    );
	initial begin
	out = 16'b0;
	end
		
	wire sign;
	reg[13:0] tmp;
	xor xor1(sign,A[7],B[7]);
	always@(posedge clk)begin
	 tmp = A[6:0]*B[6:0];
	 out <= {sign,1'b0,tmp};
	end

endmodule
