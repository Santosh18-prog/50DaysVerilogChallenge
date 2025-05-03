`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:40:20 05/03/2025
// Design Name:   Full_Sub
// Module Name:   Full_sub_tb.v
// Project Name:  Day5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Full_Sub
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Full_sub_tb_v;

	// Inputs
	reg A;
	reg B;
	reg Bin;

	// Outputs
	wire D;
	wire Bout;

	// Instantiate the Unit Under Test (UUT)
	Full_Sub uut (
		.D(D), 
		.Bout(Bout), 
		.A(A), 
		.B(B), 
		.Bin(Bin)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Bin = 0;

		#2 {A,B,Bin} = 3'b001;
		#2 {A,B,Bin} = 3'b010;
		#2 {A,B,Bin} = 3'b011;
		#2 {A,B,Bin} = 3'b100;
		#2 {A,B,Bin} = 3'b101;
		#2 {A,B,Bin} = 3'b110;
		#2 {A,B,Bin} = 3'b111;

	end
	initial $monitor($time,"D=%b Bout=%b A=%b B=%b Bin=%b",D,Bout,A,B,Bin);
	initial #16 $finish;
      
endmodule

