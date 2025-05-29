`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:23:27 05/29/2025
// Design Name:   johnson_counter
// Module Name:   johnson_counter_tb.v
// Project Name:  Day27
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: johnson_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module johnson_counter_tb_v;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	johnson_counter uut (
		.q(q), 
		.clk(clk), 
		.reset(reset)
	);
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        $monitor("Time=%0dns, q=%b", $time, q);

        reset = 1; #10; 
        reset = 0;
        #100; 
        $finish;
    end
      
endmodule

