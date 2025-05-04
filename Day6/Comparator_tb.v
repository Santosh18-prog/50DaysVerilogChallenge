`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:01:34 05/04/2025
// Design Name:   Comparator
// Module Name:   Comparator_tb.v
// Project Name:  Day6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Comparator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Comparator_tb_v;

	// Inputs
	reg A;
	reg B;

	// Outputs
	wire EQ;
	wire GT;
	wire LT;

	// Instantiate the Unit Under Test (UUT)
	Comparator uut (
		.EQ(EQ), 
		.GT(GT), 
		.LT(LT), 
		.A(A), 
		.B(B)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		#2 {A,B} = 2'b01;
		#2 {A,B} = 2'b10;
		#2 {A,B} = 2'b11;

	end
	initial $monitor($time,"EQ=%b GT=%b LT=%b A=%b B=%b",EQ,GT,LT,A,B);
	initial #8 $finish;
      
endmodule

