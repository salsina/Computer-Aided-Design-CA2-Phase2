`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:24 01/07/2021 
// Design Name: 
// Module Name:    hidden_layer 
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
module hidden_layer(
	 input received,start1,start2,
	 input clk,
    input [0:495] data,
    output [0:159] out,
	 output reg ready1,ready2
    );
	 integer k;
	 
	reg [7:0] weights [0:1239];
	reg [0:9919] final_weights;
	reg [7:0] biases [0:19];
	reg [0:159] final_biases;
	integer i,j;
	initial begin
		ready1 = 1'b0;
		ready2 = 1'b0;
		$readmemh("w1_sm.dat",weights);
		$readmemh("bh_sm.dat",biases);
		
		for(i=0;i<1240;i = i+1)begin
				
			for(j=0;j<8;j = j+1)begin
				final_weights[i*8+j] = weights[i][7-j];
			end
					
		end
		
		for(i=0;i<20;i = i+1)begin
				
			for(j=0;j<8;j = j+1)begin
				final_biases[i*8+j] = biases[i][7-j];
			end
					
		end
		
	end
	//always@(*)begin
		//for(k=0;k<62;k=k+1)
			//$display("hidden data %d: %b %b",k,data[8*k +:8],final_weights[8*k +:8]);
	 //end
	//reg start = 1;
	wire [0:79] neuron_out1,neuron_out2;
	wire [0:79] notused_neuron_out1,notused_neuron_out2;
	wire R1,R2;
	ten_neurons TN1(received,start1,clk,final_biases[0:79],data,final_weights[0:4959],neuron_out1,notused_neuron_out1,R1);
	ten_neurons TN2(received,start2,clk,final_biases[80:159],data,final_weights[4960:9919],neuron_out2,notused_neuron_out2,R2);
	always@(*)begin
		if(received == 1'b1)begin
			ready1 = 1'b0;;
			ready2 = 1'b0;
		end
		else begin
			ready1 = R1;
			ready2 = R2;
		end
	end
	assign out = {neuron_out1,neuron_out2};
endmodule
