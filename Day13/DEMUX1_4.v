`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:29:36 05/11/2025 
// Design Name: 
// Module Name:    DEMUX1_4 
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
module DEMUX1_4(dout, din, sel);
    output [3:0] dout;
    input din;
    input [1:0] sel;
	 
	 assign dout[0] = din & ~sel[1] & ~sel[0];
    assign dout[1] = din & ~sel[1] &  sel[0];
    assign dout[2] = din &  sel[1] & ~sel[0];
    assign dout[3] = din &  sel[1] &  sel[0];

endmodule
