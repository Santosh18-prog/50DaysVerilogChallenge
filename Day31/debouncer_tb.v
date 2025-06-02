`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:02:19 06/03/2025
// Design Name:   debouncer
// Module Name:   debouncer_tb.v
// Project Name:  Day31
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debouncer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module debouncer_tb;
    reg clk;
    reg rst;
    reg noisy_in;
    wire clean_out;
    // Instantiate the debouncer
    debouncer #(4) uut (  // WIDTH = 4 for faster simulation
        .clean_out(clean_out),
        .clk(clk),
        .rst(rst),
        .noisy_in(noisy_in)
    );
    // Generate a 10ns clock
    always #5 clk = ~clk;
    initial begin
        $display("Time\tnoisy_in\tclean_out");
        $monitor("%dns\t%b\t\t%b", $time, noisy_in, clean_out);
        // Initialize
        clk = 0;
        rst = 1;
        noisy_in = 0;
        #15 rst = 0;
        // Bouncing 
        #20 noisy_in = 1;
        #10 noisy_in = 0;
        #10 noisy_in = 1;
        #10 noisy_in = 0;
        #10 noisy_in = 1;
		  
        // Hold HIGH stably
        #200 noisy_in = 1;
		  
        // Hold LOW to check it returns to 0
        #100 noisy_in = 0;
        #100 $finish;
    end
endmodule


