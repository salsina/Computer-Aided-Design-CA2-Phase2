`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:46:16 01/07/2021 
// Design Name: 
// Module Name:    output_layer 
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
module output_layer(
	 input received,start,clk,
    input [0:159] data,
    output reg [0:9] out,
	 output reg ready
    );
	 
	reg [7:0] weights [0:199];
	reg [0:1599] final_weights;
	reg [7:0] biases [0:9];
	reg [0:79] final_biases;
	integer i,j;
	
	//always@(*)begin
		//for(i = 0;i<20;i=i+1)
		  //$display("hidden layer %d : %d",i,data[8*(i) +:8]);
	//end
	initial begin
		ready = 1'b0;
		
		$readmemh("w2_sm.dat",weights);
		$readmemh("bo_sm.dat",biases);
		
		for(i=0;i<200;i = i+1)begin
				
			for(j=0;j<8;j = j+1)begin
				final_weights[8*i+j] = weights[i][7-j];
			end
					
		end
		
		for(i=0;i<10;i = i+1)begin
				
			for(j=0;j<8;j = j+1)begin
				final_biases[8*i+j] = biases[i][7-j];
			end
					
		end
	end
	
	wire [0:79] neuron_out,NotUsed_neuron_out;
	wire R;
	ten_neurons_outputlayer TN(received,start,clk,final_biases,data,final_weights,neuron_out,NotUsed_neuron_out,R);
	integer index = 0;
	always@(*)begin
		if(received == 1'b1)
			ready = 1'b0;
		else
			ready = R;
	end
	
	always@(R)begin
		if(R == 1'b1)begin
			for(i=0;i<9;i=i+1)begin
				//$display("kos : %d",neuron_out[8*(i) +:8]);
				if(neuron_out[8*(i+1) +:8] > neuron_out[8*(i) +:8])
					index = i + 1;
				
			end
			out = 10'b0;
			out[index] = 1'b1;
		end
	end

endmodule
