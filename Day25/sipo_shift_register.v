`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:56:34 05/27/2025 
// Design Name: 
// Module Name:    sipo_shift_register 
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
module sipo_shift_register(q, d, clk, reset);
    output reg [3:0] q;
    input wire d;
    input wire clk;
    input wire reset;
	 initial q = 4'b0000;

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= {q[2:0], d}; 
    end
endmodule
