`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:43 12/19/2020 
// Design Name: 
// Module Name:    controller 
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
module controller#(parameter n =2)(
    input start,
    input clk,
    output reg Ready,
    output reg inc,
	 output reg init,
	 output reg ld_reg
    );
	 
	 parameter[2:0] idle = 3'b000, initialize = 3'b001, increment = 3'b010,Multiply = 3'b011 ,Loading = 3'b100, End = 3'b101;
	 reg[2:0] ps,ns;
	 reg change;
	 integer i =0;
	 //reg s = 1;
	always@(posedge clk)begin
		if (start==1'b1)begin
			ps <= 3'b000;
			ns <= 3'b001;
			//s = 1'b0;
			change <= 1'b0;
		end
		else begin
			change <= ~change;
			ps <= ns;
			end
	end
	
	always@(ps,change)begin
		{inc,Ready,init,ld_reg} = 4'b000;
		case(ps)
		idle: begin
			//Ready = 1'b0;
			if(start)	ns = initialize;
		end
		initialize: begin
			i = 0;
			init = 1'b1;
			ns = increment;
		end
		
		increment: begin
			if(i < n)begin
				i = i+1;
				inc = 1'b1;
				ns = Multiply;
			end
			else begin
				ld_reg = 1'b1;
				ns = End;
			end
		end
		
		Multiply:begin

			ld_reg = 1'b1;
			if (n == 1)
				ns = Loading;
			else
				ns = increment;
		end
		
		Loading:begin
			ld_reg = 1'b1;
			ns = increment;
		end
		
		End: begin
			Ready = 1'b1;
			ns = idle;
		end
		
		endcase
	end
endmodule
