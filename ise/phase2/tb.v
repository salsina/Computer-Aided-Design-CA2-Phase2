`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:59:40 01/07/2021
// Design Name:   InputSelector
// Module Name:   C:/Users/Sina/Downloads/Videos/CAD/ca2.2/ISE/phase2/tb.v
// Project Name:  phase2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InputSelector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;
    reg clk,start; 
    wire [0:9] out;

  TOP topModule (clk,start,out);

    initial begin
        clk = 0;
        start = 1;
        #10 clk=1;
        #10 clk = 0;
        #10 start = 0;
    repeat(10000)#10 clk = ~clk;
    end 
endmodule
