`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:26:19 05/12/2025
// Design Name:   ripple_carry_adder_4bit
// Module Name:   ripple_carry_adder_4bit_tb.v
// Project Name:  Day14
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ripple_carry_adder_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ripple_carry_adder_4bit_tb_v;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg Cin;

	// Outputs
	wire Cout;
	wire [3:0] Sum;

	// Instantiate the Unit Under Test (UUT)
	ripple_carry_adder_4bit uut (
		.Cout(Cout), 
		.Sum(Sum), 
		.A(A), 
		.B(B), 
		.Cin(Cin)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Cin = 0;

      #2 A = 4'b0001; B = 4'b0010; Cin = 0; 
      #2 A = 4'b0101; B = 4'b0011; Cin = 0; 
      #2 A = 4'b1111; B = 4'b0001; Cin = 1; 
	end
	initial $monitor($time,"Sum=%b Cout=%b A=%b B=%b Cin=%b",Sum,Cout,A,B,Cin);
	initial #8 $finish;
      
endmodule

