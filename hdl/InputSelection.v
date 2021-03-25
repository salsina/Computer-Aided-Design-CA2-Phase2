`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:47:58 12/19/2020 
// Design Name: 
// Module Name:    InputSelection 
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
module InputSelection#(parameter n = 2)(
		input clk,
		input inc,
		input[0:8*n-1] InputVec,
		input[0:8*n-1] WeightVec,
		output reg[7:0] out1,out2
    );
	 initial begin
		out1 = 8'b0;
		out2 = 8'b0;
	 end
	integer count = 0;
	always@(posedge clk)begin
		if(inc)begin
			out1 = InputVec[8*count +:8];
			out2 = WeightVec[8*count +:8];
			count = count + 1;
		end
	end

endmodule
