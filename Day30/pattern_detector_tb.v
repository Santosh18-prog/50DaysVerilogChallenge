`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:16:31 06/01/2025
// Design Name:   pattern_detector
// Module Name:   pattern_detector_tb.v
// Project Name:  Day30
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pattern_detector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pattern_detector_tb_v;
	// Inputs
	reg clk;
	reg reset;
	reg din;
	// Outputs
	wire detected;

	// Instantiate the Unit Under Test (UUT)
	pattern_detector uut (
		.detected(detected), 
		.clk(clk), 
		.reset(reset), 
		.din(din)
	);
	initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    // Input 
    reg [15:0] data = 16'b1011010110111100;
    integer i;

    initial begin
        $display("Time\tDin\tDetected");
        reset = 1; din = 0;
        #10 reset = 0;

        for (i = 15; i >= 0; i = i - 1) begin
            din = data[i];
            #10 $display("%4dns\t%b\t%b", $time, din, detected);
        end
        #20 $finish;
    end
endmodule

