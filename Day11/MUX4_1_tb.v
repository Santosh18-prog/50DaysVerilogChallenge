`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:13:55 05/09/2025
// Design Name:   MUX4_1
// Module Name:   MUX4_1_tb.v
// Project Name:  Day11
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX4_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX4_1_tb_v;

	// Inputs
	reg a;
	reg b;
	reg c;
	reg d;
	reg [1:0] sel;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	MUX4_1 uut (
		.y(y), 
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.sel(sel)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 1;
		c = 0;
		d = 1;
		sel = 0;

		#2 sel = 2'b01;
		#2 sel = 2'b10;
		#2 sel = 2'b11;

	end
	initial $monitor($time,"y=%b a=%b b=%b c=%b d=%b sel=%b",y,a,b,c,d,sel);
	initial #8 $finish;
      
endmodule

