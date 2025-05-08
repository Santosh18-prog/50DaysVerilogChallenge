`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:30:07 05/08/2025
// Design Name:   MUX2_1
// Module Name:   MUX2_1_tb.v
// Project Name:  Day10
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX2_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX2_1_tb_v;

	// Inputs
	reg a;
	reg b;
	reg sel;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	MUX2_1 uut (
		.y(y), 
		.a(a), 
		.b(b), 
		.sel(sel)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		sel = 0;
		
		#2 a = 0; b = 1; sel = 0; 
      #2 a = 0; b = 1; sel = 1; 
      #2 a = 1; b = 0; sel = 0; 
      #2 a = 1; b = 0; sel = 1; 

	end
	initial $monitor($time,"y=%b sel =%b a=%b b=%b",y,sel,a,b);
	initial #10 $finish;
      
endmodule

