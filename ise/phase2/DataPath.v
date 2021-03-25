`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:13 12/19/2020 
// Design Name: 
// Module Name:    DataPath 
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


module DataPath#(parameter n=2)(
	input [7:0]bias, 
	 input ld_reg,inc,clk,init,ready,
    input [0:8*n-1] InputVec,
    input [0:8*n-1] WeightVec,
    output [20:0] Result
    );
	 wire [7:0] IS_out1,IS_out2;
	 wire [20:0] mac_out;
	 InputSelection#(n) IS(clk,inc,InputVec,WeightVec,IS_out1,IS_out2);
	 MAC2 mac(bias,ld_reg,inc,IS_out1,IS_out2,clk,init,Result);
	 //ActivationFunction AF(mac_out,ready,Result);
endmodule
