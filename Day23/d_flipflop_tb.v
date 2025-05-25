`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:38:20 05/25/2025
// Design Name:   d_flipflop
// Module Name:   d_flipflop_tb.v
// Project Name:  Day23
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: d_flipflop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module d_flipflop_tb_v;

	// Inputs
	reg d;
	reg clk;

	// Outputs
	wire q;

	// Instantiate the Unit Under Test (UUT)
	d_flipflop uut (
		.q(q), 
		.d(d), 
		.clk(clk)
	);

	 initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // Stimulus
    initial begin
        $monitor("Time = %0dns, d = %b, q = %b", $time, d, q);
        // Initialize input
        d = 0;

        #12; d = 1;
        #10; d = 0;
        #10; d = 1;
        #10; d = 1;
        #10; d = 0;
		  
        #10;
        $finish;
    end
endmodule

