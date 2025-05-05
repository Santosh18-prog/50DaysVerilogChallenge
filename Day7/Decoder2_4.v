`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:33:11 05/05/2025 
// Design Name: 
// Module Name:    Decoder2_4 
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
module Decoder2_4(out, in, en);
    output [3:0] out;
    input [1:0] in;
    input en;

	 assign out[0] = en & ~in[1] & ~in[0];
    assign out[1] = en & ~in[1] &  in[0];
    assign out[2] = en &  in[1] & ~in[0];
    assign out[3] = en &  in[1] &  in[0];

endmodule
