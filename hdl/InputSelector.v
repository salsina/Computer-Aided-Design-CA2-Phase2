`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:13 01/07/2021 
// Design Name: 
// Module Name:    InputSelector 
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
module InputSelector(
    input clk,
	 input load,
    output reg[0:495] out
    );	 
	 
	integer i,j;
	reg [7:0] all_data [0:46499];
	initial begin
		$readmemh("test_data_sm.dat",all_data);
	end
		 
	 integer count = 0;
	 always@(posedge clk)begin
		 if(load)begin
				for(i=62*count;i<62*count+62;i = i+1)begin
				
					for(j=0;j<8;j = j+1)begin
						out[((i%62)*8)+j] = all_data[i][7-j];
					end
					
				end
				
				count = count + 1;
		 end
	 end


endmodule
