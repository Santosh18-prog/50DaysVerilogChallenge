`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:58:44 05/16/2025
// Design Name:   alu
// Module Name:   alu_tb.v
// Project Name:  Day18
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb_v;

	// Inputs
	reg [1:0] op;
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [3:0] y;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.y(y), 
		.cout(cout), 
		.op(op), 
		.a(a), 
		.b(b)
	);

	initial begin
	    // Test ADD
	    a = 4'b0101; b = 4'b0011; op = 2'b00; #10;  // 5 + 3 = 8

	    // Test SUB
	    a = 4'b1000; b = 4'b0011; op = 2'b01; #10;  // 8 - 3 = 5

	    // Test AND
	    a = 4'b1100; b = 4'b1010; op = 2'b10; #10;  // 1100 & 1010 = 1000

	    // Test OR
	    a = 4'b1100; b = 4'b1010; op = 2'b11; #10;  // 1100 | 1010 = 1110
	end

	initial
	    $monitor($time," y=%b cout=%b a=%b b=%b op=%b", y, cout, a, b, op);

	initial
	    #50 $finish;

endmodule

