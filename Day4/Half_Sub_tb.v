`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:41:55 05/02/2025
// Design Name:   Half_Sub
// Module Name:   Half_Sub_tb.v
// Project Name:  Day4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Half_Sub
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Half_Sub_tb_v;

	// Inputs
	reg A;
	reg B;

	// Outputs
	wire D;
	wire Bout;

	// Instantiate the Unit Under Test (UUT)
	Half_Sub uut (
		.D(D), 
		.Bout(Bout), 
		.A(A), 
		.B(B)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		#10 {A,B} = 2'b01;
		#10 {A,B} = 2'b10;
		#10 {A,B} = 2'b11;
		
	end
	
	initial $monitor($time,"D=%b Bout=%b A=%b B=%b",D,Bout,A,B);
	initial #35 $finish;
      
endmodule

