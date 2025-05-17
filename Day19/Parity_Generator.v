`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:37:56 05/17/2025 
// Design Name: 
// Module Name:    Parity_Generator 
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
module Parity_Generator(parity, data);
    output parity;
    input wire [3:0] data;
	 assign parity = data[0] ^ data[1] ^ data[2] ^ data[3];


endmodule
