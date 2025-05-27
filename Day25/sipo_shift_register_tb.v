`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:58:29 05/27/2025
// Design Name:   sipo_shift_register
// Module Name:   sipo_shift_register_tb.v
// Project Name:  Day25
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sipo_shift_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sipo_shift_register_tb_v;

	// Inputs
	reg d;
	reg clk;
	reg reset;
	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	sipo_shift_register uut (
		.q(q), 
		.d(d), 
		.clk(clk), 
		.reset(reset));
	initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $monitor("Time=%0dns, d=%b, q=%b", $time, d, q);

        reset = 1; d = 0; #10;
        reset = 0;
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 1; #10;
        d = 0; #20;

        $finish;
    end     
endmodule

