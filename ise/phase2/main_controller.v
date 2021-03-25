`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:08:24 01/08/2021 
// Design Name: 
// Module Name:    main_controller 
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
module main_controller#(parameter n =750)(
	input clk,start,hidden_ready1,hidden_ready2,out_ready,
	output reg load_data,
	output reg start1_ann,
	output reg start2_ann,
	output reg start3_ann,
	output reg received

    );
	
	parameter[2:0] idle = 3'b000, initialize = 3'b001, loading = 3'b010,hidden = 3'b011 ,out = 3'b100, End = 3'b101,wait_for_hidden_ready1 = 3'b110 , wait_for_hidden_ready2 = 3'b111;
	 reg[2:0] ps,ns;
	 reg change;
	 integer i = 0;
	 integer input_count = 0;

	always@(posedge clk)begin
		if (start==1'b1)begin
			ps <= 3'b000;
			change <= 1'b0;
		end
		else begin
			change <= ~change;
			ps <= ns;
			end
	end
	
	always@(ps,change)begin
		{load_data,start1_ann,start2_ann,start3_ann,received} = 5'b000;
		case(ps)
		idle: begin
			input_count = 0;
			if(start)	ns = initialize;
		end
		initialize: begin
			i = 0;
			input_count = input_count + 1;
			ns = loading;
		end
		
		loading: begin
			if(input_count < n)begin
				load_data = 1'b1;
				input_count = input_count + 1;
				ns = hidden;
			end
			else begin
				ns = End;
			end
		end
		
		hidden:begin
			//if (hidden_ready2 == 1'b1)begin
				//start3_ann = 1'b1;
				//ns = out;
			//end
			//else if(hidden_ready1 == 1'b1)begin
				//start2_ann = 1'b1;
				//ns = wait_for_hidden_ready2;
			//end
			//else begin
				start1_ann = 1'b1;
				ns = wait_for_hidden_ready1;
			//end
		end
		
		wait_for_hidden_ready1:begin
			start1_ann = 1'b0;
			if(hidden_ready1 == 1'b1) begin 
				start2_ann = 1'b1;
				ns = wait_for_hidden_ready2;
			end
			else ns = wait_for_hidden_ready1;
		end
		
		wait_for_hidden_ready2:begin
			start2_ann = 1'b0;
			if(hidden_ready2 == 1'b1) begin 
				start3_ann = 1'b1;
				ns = out;
			end
			else ns = wait_for_hidden_ready2;
		end
		
		out:begin
			start3_ann = 1'b0;
			if(out_ready == 1'b1) ns = End;
			else ns = out;
		end
		
		End: begin
			received = 1'b1;
			ns = initialize;			
		end
		
		endcase
	end

endmodule
