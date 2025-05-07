`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:49:01 05/07/2025
// Design Name:   Encoder8_3
// Module Name:   Encoder8_3_tb.v
// Project Name:  Day9
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Encoder8_3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Encoder8_3_tb_v;

	// Inputs
	reg [7:0] in;

	// Outputs
	wire [2:0] out;

	// Instantiate the Unit Under Test (UUT)
	Encoder8_3 uut (
		.out(out), 
		.in(in)
	);

	initial begin
		// Initialize Inputs
		 in = 0;

		  #2 in = 8'b00000001; 
        #2 in = 8'b00000010; 
        #2 in = 8'b00000100; 
        #2 in = 8'b00001000;  
        #2 in = 8'b00010000; 
        #2 in = 8'b00100000; 
        #2 in = 8'b01000000;
        #2 in = 8'b10000000; 

	end
      initial $monitor($time,"out=%b in=%b",out,in);
		initial #18 $finish;
endmodule

