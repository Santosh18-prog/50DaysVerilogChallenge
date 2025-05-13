`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:18:16 05/13/2025
// Design Name:   cla_4bit
// Module Name:   cla_4bit_tb.v
// Project Name:  Day15
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cla_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla_4bit_tb_v;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg Cin;

	// Outputs
	wire [3:0] Sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	cla_4bit uut (
		.Sum(Sum), 
		.Cout(Cout), 
		.A(A), 
		.B(B), 
		.Cin(Cin)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Cin = 0;

		#2 A = 4'b0001; B = 4'b0001; Cin = 0;
		#2 A = 4'b0010; B = 4'b0101; Cin = 0;
		#2 A = 4'b1111; B = 4'b1111; Cin = 1;

	end
	initial $monitor($time,"Sum=%b Cout=%b A=%b B=%b Cin=%b",Sum,Cout,A,B,Cin);
	initial #8 $finish;
      
endmodule

