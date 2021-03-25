`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:53 01/07/2021 
// Design Name: 
// Module Name:    ten_neurons 
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
module ten_neurons(
	 input received,start,clk,
	 input [0:79]ten_biases,
	 input [0:495] data,
	 input [0:4959] weights,
    output [0:79] ShiftedOut,
	 output [0:79] NotShiftedOut,
	 output reg ready
    );
	 
	wire Ready_ann,Ready_AF1,Ready_AF2;
	wire [0:9] readys;
	wire [0:209] ShiftedOut_ann,NotShiftedOut_ann,ShiftedOut_AF,NotShiftedOut_AF;
	
  ANN ann1(ten_biases[0:7],data,weights[0:495],start,clk,ShiftedOut_ann[0:20],NotShiftedOut_ann[0:20],Ready_ann);
  ANN ann2(ten_biases[8:15],data,weights[496:991],start,clk,ShiftedOut_ann[21:41],NotShiftedOut_ann[21:41],Ready_ann);
  ANN ann3(ten_biases[16:23],data,weights[992:1487],start,clk,ShiftedOut_ann[42:62],NotShiftedOut_ann[42:62],Ready_ann);
  ANN ann4(ten_biases[24:31],data,weights[1488:1983],start,clk,ShiftedOut_ann[63:83],NotShiftedOut_ann[63:83],Ready_ann);
  ANN ann5(ten_biases[32:39],data,weights[1984:2479],start,clk,ShiftedOut_ann[84:104],NotShiftedOut_ann[84:104],Ready_ann);
  ANN ann6(ten_biases[40:47],data,weights[2480:2975],start,clk,ShiftedOut_ann[105:125],NotShiftedOut_ann[105:125],Ready_ann);
  ANN ann7(ten_biases[48:55],data,weights[2976:3471],start,clk,ShiftedOut_ann[126:146],NotShiftedOut_ann[126:146],Ready_ann);
  ANN ann8(ten_biases[56:63],data,weights[3472:3967],start,clk,ShiftedOut_ann[147:167],NotShiftedOut_ann[147:167],Ready_ann);
  ANN ann9(ten_biases[64:71],data,weights[3968:4463],start,clk,ShiftedOut_ann[168:188],NotShiftedOut_ann[168:188],Ready_ann);
  ANN ann10(ten_biases[72:79],data,weights[4464:4959],start,clk,ShiftedOut_ann[189:209],NotShiftedOut_ann[189:209],Ready_ann);
  
  ActivationFunction AF1(ShiftedOut_ann,Ready_ann,ShiftedOut_AF,Ready_AF1);
  saturation SAT1(received,ShiftedOut_AF,Ready_AF1,ShiftedOut,ready);

	//genvar i;
   //generate
     //  for (i=0; i < 10; i = i+1) begin
       //    ANN ann(ten_biases[8*i +:8],data,weights[496*i +:496],start,clk,ShiftedOut_ann[21*i +:21],NotShiftedOut_ann[21*i +:21],Ready_ann);
			  //ActivationFunction AF1(ShiftedOut_ann[21*i +:21],Ready_ann,ShiftedOut_AF[21*i +:21],Ready_AF1);
			//  saturation SAT1(received,ShiftedOut_AF[21*i +:21],Ready_AF1,ShiftedOut[8*i +:8],readys[i]);
		//end
   //endgenerate
	//ActivationFunction AF1(ShiftedOut_ann,Ready_ann,ShiftedOut_AF,Ready_AF1);
	//integer k;
	//reg change = 0;
	//always@(*)begin
		//if(received == 1'b1)begin
			//ready = 1'b0;
			//change = 0;
		//end
		//else if(readys == 10'b1111111111)begin
	//		ready = 1'b1;
		//	change = 1;
		//end
		//else
			//ready = 1'b0;
//	end
	
endmodule
