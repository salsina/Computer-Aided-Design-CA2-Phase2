`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:04:51 12/19/2020 
// Design Name: 
// Module Name:    ANN 
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


module ANN#(parameter n=62)( 
	input[7:0] bias,
    input [0:8*n-1] InputVec,
    input [0:8*n-1] WeightVec,
	 input start,clk,
    output [20:0] ShiftedResult,
	 output [20:0] NotShiftedResult,
	 output Ready
    );
	 wire InputSel,initAcc,ld_reg;
	 controller#(n) cntlr(start,clk,Ready,InputSel,initAcc,ld_reg);
	 DataPath#(n) DP(bias,ld_reg,InputSel,clk,initAcc,Ready,InputVec,WeightVec,NotShiftedResult);
	 assign ShiftedResult = {NotShiftedResult[20],9'b0,NotShiftedResult[19:9]};
endmodule
