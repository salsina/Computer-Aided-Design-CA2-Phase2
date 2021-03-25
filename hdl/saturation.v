`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:49 01/08/2021 
// Design Name: 
// Module Name:    saturation 
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
module saturation(
    input received,input[0:209] in,
    input ready,
    output reg[0:79] out,
     output reg Rdy
    );

     reg [20:0] tmp;
	  integer i;
     always@(ready,received)begin
        if(received)
            Rdy = 1'b0;

        else if(ready)begin

            for(i=0;i<10;i = i+1)begin

                tmp = in[21*i +: 21];

                if (tmp > 127)
                    out[8*i +: 8] = 8'b01111111;
                else 
                 out[8*i +: 8] = tmp[7:0];

            end

            Rdy = 1'b1;

         end
         else 
            Rdy = 1'b0;
     end

endmodule 