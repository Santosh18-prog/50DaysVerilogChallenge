`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:43:56 04/30/2025
// Design Name:   HA
// Module Name:   HA_tb.v
// Project Name:  Day2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module HA_tb_v;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire carry;
	wire sum;

	// Instantiate the Unit Under Test (UUT)
	HA uut (
		.carry(carry), 
		.sum(sum), 
		.a(a), 
		.b(b)
	);
	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		#10 {a,b} = 2'b01;
		#10 {a,b} = 2'b10;
		#10 {a,b} = 2'b11;
	end
	initial $monitor($time,"carry=%b,sum=%b,a=%b,b=%b",carry,sum,a,b);
	initial #35 $finish;
      
endmodule

