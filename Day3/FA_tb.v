`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:32:25 05/01/2025
// Design Name:   FA
// Module Name:   FA_tb.v
// Project Name:  Day3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FA_tb_v;

	// Inputs
	reg A;
	reg B;
	reg Cin;

	// Outputs
	wire Sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	FA uut (
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

	 #2 {A,B,Cin} = 3'b001;
	 #2 {A,B,Cin} = 3'b010;
	 #2 {A,B,Cin} = 3'b011;
	 #2 {A,B,Cin} = 3'b100;
	 #2 {A,B,Cin} = 3'b101;
	 #2 {A,B,Cin} = 3'b110;
	 #2 {A,B,Cin} = 3'b111;

	end
	initial $monitor($time,"Sum=%b Cout=%b A=%b B=%b Cin=%b",Sum,Cout,A,B,Cin);
	initial #18 $finish;
      
endmodule

