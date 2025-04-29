`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:47:07 04/28/2025 
// Design Name: 
// Module Name:    BasicGates 
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
module BasicGates(AND, OR, NOT, NAND, NOR, X, Y);
    output AND;
    output OR;
    output NOT;
    output NAND;
    output NOR;
    input X;
    input Y;
	 
	 and g1(AND,X,Y);
	 or g2(OR,X,Y);
	 not g3(NOT,X);
	 nand g4(NAND,X,Y);
	 nor g5(NOR,X,Y);


endmodule
