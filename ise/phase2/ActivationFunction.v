`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:50 12/19/2020 
// Design Name: 
// Module Name:    ActivationFunction 
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
module ActivationFunction(
    input [0:209] in,
    input ready,
    output reg[0:209] out,
     output reg Ready_AF
    );
     integer i;
     reg [20:0] tmp;
     always@(ready)begin
         if(ready)begin

            for(i=0;i<10;i = i+1)begin
                tmp = in[21*i +: 21];

                if (tmp[20] == 1'b1)begin
                out[21*i +: 21] = 21'b0;
                end

                else begin
                    if (tmp > 21'b0) out[21*i +: 21] = tmp;
                    else out[21*i +: 21] = 21'b0;
                end

            end
            Ready_AF = 1'b1;

         end
         else
            Ready_AF = 1'b0;
     end
endmodule 