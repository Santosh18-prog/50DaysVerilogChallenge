`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:12:57 05/15/2025
// Design Name:   Down_Asynchronous_Counter_4bit
// Module Name:   Down_Asynchronous_Counter_4bit_tb.v
// Project Name:  Day17
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Down_Asynchronous_Counter_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Down_Asynchronous_Counter_4bit_tb_v;

	// Inputs
	reg rst;
	reg clk;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	Down_Asynchronous_Counter_4bit uut (
		.q(q), 
		.rst(rst), 
		.clk(clk)
	);

	// Clock generation: 20 ns period (50 MHz)
	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end

	// Stimulus
	initial begin
		// Apply reset after some time
		rst = 1;          // Apply reset (start at 1111)
		#25;
		rst = 0;          // Release reset, start counting down

		#350;             // Wait for 350 ns to observe output
		$finish;          // End simulation
	end

	// Display output changes
	initial begin
		$monitor($time, " | q = %b | rst = %b | clk = %b", q, rst, clk);
	end

endmodule

