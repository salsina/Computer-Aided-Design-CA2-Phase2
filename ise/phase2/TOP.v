`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:22 01/15/2021 
// Design Name: 
// Module Name:    TOP 
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
module TOP(input clk,start,output [0:9] out
    );

    wire [0:495] IS_out;
    wire [0:159] HL_out;
    wire load_data,start1_ann,start2_ann,start3_ann,hidden_ready1,hidden_ready2,out_ready,received;

    main_controller Main_cntrlr(
    clk,start,hidden_ready1,hidden_ready2,out_ready,
    load_data,
    start1_ann,
    start2_ann,
    start3_ann,
    received 
    );

    InputSelector IS(clk,load_data,IS_out);
    hidden_layer HL(received,start1_ann,start2_ann,clk,IS_out,HL_out,hidden_ready1,hidden_ready2);
    output_layer OL(received,start3_ann,clk,HL_out,out,out_ready);


endmodule 