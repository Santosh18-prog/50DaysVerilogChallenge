`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:20:15 05/26/2025
// Design Name:   shift_register
// Module Name:   shift_register_tb.v
// Project Name:  Day24
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shift_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shift_register_tb_v;

	// Inputs
	reg d;
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	shift_register uut (
		.q(q), 
		.d(d), 
		.clk(clk), 
		.reset(reset)
	);
	    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        $monitor("Time=%0dns, d=%b, q=%b", $time, d, q);

        // Initialize
        reset = 1; d = 0; #10;
        reset = 0;

        // Serially input bits: 1, 0, 1, 1
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 1; #10;

        // Hold last state
        d = 0; #20;

        $finish;
    end

endmodule

