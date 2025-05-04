`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:00:37 05/04/2025 
// Design Name: 
// Module Name:    Comparator 
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
module Comparator(EQ, GT, LT, A, B);
    output EQ;
    output GT;
    output LT;
    input A;
    input B;
	 
	 assign EQ = ~(A ^ B);  // A == B
    assign GT = A & ~B;    // A > B
    assign LT = ~A & B;    // A < B


endmodule
