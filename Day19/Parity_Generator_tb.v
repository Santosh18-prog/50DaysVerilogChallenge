`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:39:35 05/17/2025
// Design Name:   Parity_Generator
// Module Name:   Parity_Generator_tb.v
// Project Name:  Day19
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Parity_Generator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Parity_Generator_tb_v;

	// Inputs
	reg [3:0] data;

	// Outputs
	wire parity;

	// Instantiate the Unit Under Test (UUT)
	Parity_Generator uut (
		.parity(parity), 
		.data(data)
	);

	initial begin
		data = 0;
      data = 4'b0001; #10;
      data = 4'b0011; #10;
      data = 4'b0111; #10;
      data = 4'b1111; #10;

	end
	initial $monitor($time,"parity=%b data=%b",parity,data);
	initial #50 $finish;
      
endmodule

