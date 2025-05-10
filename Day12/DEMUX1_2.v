`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:52 05/10/2025 
// Design Name: 
// Module Name:    DEMUX1_2 
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
module DEMUX1_2(y, din, sel);
    output [1:0] y;
    input din;
    input sel;

	assign y[0] = (~sel) & din ;
	assign y[1] = sel & din ;

endmodule
