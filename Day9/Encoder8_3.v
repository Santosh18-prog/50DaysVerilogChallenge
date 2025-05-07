`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:14 05/07/2025 
// Design Name: 
// Module Name:    Encoder8_3 
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
module Encoder8_3(out, in);
    output [2:0] out;
    input [7:0] in;
	 
	 assign out[2] = in[7] | in[6] | in[5] | in[4];
    assign out[1] = in[7] | in[6] | in[3] | in[2];
    assign out[0] = in[7] | in[5] | in[3] | in[1];


endmodule
