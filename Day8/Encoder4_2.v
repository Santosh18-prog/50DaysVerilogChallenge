`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:13:52 05/06/2025 
// Design Name: 
// Module Name:    Encoder4_2 
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
module Encoder4_2(out, in);
    output [1:0] out;
    input [3:0] in;
	 
	 assign out[1] = in[3] | in[2];
    assign out[0] = in[3] | in[1];


endmodule
