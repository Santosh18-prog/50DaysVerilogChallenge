`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:49:12 04/28/2025
// Design Name:   BasicGates
// Module Name:   BasicGates_tb.v
// Project Name:  Day1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BasicGates
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BasicGates_tb_v;

	// Inputs
	reg X;
	reg Y;

	// Outputs
	wire AND;
	wire OR;
	wire NOT;
	wire NAND;
	wire NOR;

	// Instantiate the Unit Under Test (UUT)
	BasicGates uut (
		.AND(AND), 
		.OR(OR), 
		.NOT(NOT), 
		.NAND(NAND), 
		.NOR(NOR), 
		.X(X), 
		.Y(Y)
	);

	
		// Initialize Inputs
		initial {X,Y}=2'b00;
   always #5 {X,Y}={X,Y}+1'b1;

	initial $monitor($time,"AND=%b OR=%b NOT=%b NAND=%b NOR=%b",AND,OR,NOT,NAND,NOR);
	initial #18 $finish;
      
endmodule

