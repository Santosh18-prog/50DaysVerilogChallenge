`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:34:07 05/05/2025
// Design Name:   Decoder2_4
// Module Name:   Decoder2_4_tb.v
// Project Name:  Day7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decoder2_4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Decoder2_4_tb_v;

	// Inputs
	reg [1:0] in;
	reg en;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	Decoder2_4 uut (
		.out(out), 
		.in(in), 
		.en(en)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		en = 1;
		
      #2 in = 2'b01;
      #2 in = 2'b10;
      #2 in = 2'b11;
		
		

	end
	initial $monitor($time,"in=%b out=%b",in,out);
	initial #8 $finish;
      
endmodule

