`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:00 12/19/2020 
// Design Name: 
// Module Name:    Adder 
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
module Adder(
    input[20:0] A,
    input[20:0] B,
    output reg[20:0] out
    );
	 initial begin
	 out = 21'b0;
	 end
	 
	always@(A,B)begin
		if(A[20] == 1'b1 && B[20] == 1'b1)begin
			out = {1'b1,(A[19:0]+B[19:0])};
		end
		
		else if(A[20] == 1'b0 && B[20] == 1'b0)begin
			out = {1'b0,(A[19:0]+B[19:0])};
		end
		
		else begin
		
			if(A[20] == 1'b1)begin
			
				if(A[19:0] > B[19:0])
					out = {1'b1,(A[19:0]-B[19:0])};
				else 
					out = {1'b0,(B[19:0]-A[19:0])};
			end
			
			else begin
			
				if(B[19:0] > A[19:0])
					out = {1'b1,(B[19:0]-A[19:0])};
				else 
					out = {1'b0,(A[19:0]-B[19:0])};
					
			end
			
		end
		
	end

endmodule
