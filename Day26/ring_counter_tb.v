`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:55:08 05/28/2025
// Design Name:   ring_counter
// Module Name:   ring_counter_tb.v
// Project Name:  Day26
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ring_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ring_counter_tb_v;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	ring_counter uut (
		.q(q), 
		.clk(clk), 
		.reset(reset));
	initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $monitor("Time=%0dns, q=%b", $time, q);
        
        reset = 1; #10;
        reset = 0;

        #50; 

        $finish;
    end
      
endmodule

