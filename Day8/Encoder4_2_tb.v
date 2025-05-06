`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:16:00 05/06/2025
// Design Name:   Encoder4_2
// Module Name:   Encoder4_2_tb.v
// Project Name:  Day8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Encoder4_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Encoder4_2_tb_v;

	// Inputs
	reg [3:0] in;

	// Outputs
	wire [1:0] out;

	// Instantiate the Unit Under Test (UUT)
	Encoder4_2 uut (
		.out(out), 
		.in(in)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		#2 in = 4'b0001;
		#2 in = 4'b0010;
		#2 in = 4'b0100;
		#2 in = 4'b1000;

	end
	initial $monitor($time,"out=%b in=%b",out,in);
	initial #10 $finish;
      
endmodule

