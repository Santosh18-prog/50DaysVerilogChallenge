`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:13:57 05/22/2025
// Design Name:   jk_flipflop
// Module Name:   jk_flipflop_tb.v
// Project Name:  Day20
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: jk_flipflop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module jk_flipflop_tb_v;

    // Inputs
    reg j;
    reg k;
    reg clk;

    // Output
    wire q;

    // Instantiate the Unit Under Test (UUT)
    jk_flipflop uut (
        .q(q), 
        .j(j), 
        .k(k), 
        .clk(clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        // Initialize Inputs
        j = 0; k = 0; #10;  // No change
        j = 0; k = 1; #10;  // Reset
        j = 1; k = 0; #10;  // Set
        j = 1; k = 1; #10;  // Toggle
        j = 0; k = 0; #10;  // No change
        j = 1; k = 1; #10;  // Toggle again
    end

    // Monitor outputs
    initial $monitor($time, " q=%b clk=%b j=%b k=%b", q, clk, j, k);

    // End simulation
    initial #60 $finish;

endmodule
