`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:39:32 05/31/2025
// Design Name:   gray_fsm
// Module Name:   gray_fsm_tb.v
// Project Name:  Day29
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gray_fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gray_fsm_tb_v;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [1:0] state;
	wire out;

	// Instantiate the Unit Under Test (UUT)
	gray_fsm uut (
		.state(state), 
		.out(out), 
		.clk(clk), 
		.reset(reset)
	);

	 initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $display("Time(ns)\tState\tOutput");
        $monitor("%d\t\t%b\t%b", $time, state, out);

        reset = 1; #10;
        reset = 0;

        #80;
        $finish;
    end
      
endmodule

