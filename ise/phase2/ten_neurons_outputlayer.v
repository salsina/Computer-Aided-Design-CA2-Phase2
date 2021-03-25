`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:35:57 01/08/2021 
// Design Name: 
// Module Name:    ten_neurons_outputlayer 
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
module ten_neurons_outputlayer(
	 input received,start,clk,
	 input [0:79]ten_biases,
	 input [0:159] data,
	 input [0:1599] weights,
    output [0:79] ShiftedOut,
	 output [0:79] NotShiftedOut,
	 output reg ready
    );
	 
	 wire Ready_ann,Ready_AF1,Ready_AF2;
	 wire [0:209] ShiftedOut_ann,NotShiftedOut_ann,ShiftedOut_AF,NotShiftedOut_AF;
	 wire [0:9] readys;
	//genvar i;
   //generate
     //  for (i=0; i < 10; i = i+1) begin
       //    ANN#(20) ann(ten_biases[8*i +:8],data,weights[160*i +:160],start,clk,ShiftedOut_ann[21*i +:21],NotShiftedOut_ann[21*i +:21],Ready_ann);
			  //ActivationFunction AF1(ShiftedOut_ann[21*i +:21],Ready_ann,ShiftedOut_AF[21*i +:21],Ready_AF1);
			//  saturation SAT1(received,ShiftedOut_AF[21*i +:21],Ready_AF1,ShiftedOut[8*i +:8],readys[i]);
		//end
   //endgenerate
	//ActivationFunction AF1(ShiftedOut_ann,Ready_ann,ShiftedOut_AF,Ready_AF1);

  ANN #(20) ann1(ten_biases[0:7],data,weights[0:159],start,clk,ShiftedOut_ann[0:20],NotShiftedOut_ann[0:20],Ready_ann);
  ANN #(20)ann2(ten_biases[8:15],data,weights[160:319],start,clk,ShiftedOut_ann[21:41],NotShiftedOut_ann[21:41],Ready_ann);
  ANN #(20)ann3(ten_biases[16:23],data,weights[320:479],start,clk,ShiftedOut_ann[42:62],NotShiftedOut_ann[42:62],Ready_ann);
  ANN #(20)ann4(ten_biases[24:31],data,weights[480:639],start,clk,ShiftedOut_ann[63:83],NotShiftedOut_ann[63:83],Ready_ann);
  ANN #(20)ann5(ten_biases[32:39],data,weights[640:799],start,clk,ShiftedOut_ann[84:104],NotShiftedOut_ann[84:104],Ready_ann);
  ANN #(20)ann6(ten_biases[40:47],data,weights[800:959],start,clk,ShiftedOut_ann[105:125],NotShiftedOut_ann[105:125],Ready_ann);
  ANN #(20)ann7(ten_biases[48:55],data,weights[960:1119],start,clk,ShiftedOut_ann[126:146],NotShiftedOut_ann[126:146],Ready_ann);
  ANN #(20)ann8(ten_biases[56:63],data,weights[1120:1279],start,clk,ShiftedOut_ann[147:167],NotShiftedOut_ann[147:167],Ready_ann);
  ANN #(20)ann9(ten_biases[64:71],data,weights[1280:1439],start,clk,ShiftedOut_ann[168:188],NotShiftedOut_ann[168:188],Ready_ann);
  ANN #(20)ann10(ten_biases[72:79],data,weights[1440:1599],start,clk,ShiftedOut_ann[189:209],NotShiftedOut_ann[189:209],Ready_ann);

  ActivationFunction AF1(ShiftedOut_ann,Ready_ann,ShiftedOut_AF,Ready_AF1);
  saturation SAT1(received,ShiftedOut_AF,Ready_AF1,ShiftedOut,ready);



	//always@(*)begin
		//if(received == 1'b1)
		//	ready = 1'b0;
		//else if(readys == 10'b1111111111)
			//ready = 1'b1;
		//else
			//ready = 1'b0;
	//end
	
endmodule 