`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:23:59 05/30/2025
// Design Name:   gray_counter
// Module Name:   gray_counter_tb.v
// Project Name:  Day28
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gray_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gray_counter_tb_v;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] gray;

	// Instantiate the Unit Under Test (UUT)
	gray_counter uut (
		.gray(gray), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Stimulus
    initial begin
        $monitor("Time=%0dns, Gray=%b", $time, gray);

        reset = 1; #10;
        reset = 0;
        #160; 
        $finish;
    end
      
endmodule

