`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:48:56 05/23/2025
// Design Name:   sr_flipflop
// Module Name:   sr_flipflop_tb.v
// Project Name:  Day21
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sr_flipflop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module sr_flipflop_tb;

    // Inputs
    reg s;
    reg r;
    reg clk;

    // Output
    wire q;

    // Instantiate the Unit Under Test (UUT)
    sr_flipflop uut (
        .q(q), 
        .s(s), 
        .r(r), 
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
        s = 0; r = 0; #10;  // No change
        s = 1; r = 0; #10;  // Set
        s = 0; r = 1; #10;  // Reset
        s = 1; r = 1; #10;  // Invalid (treated as hold)
        s = 0; r = 0; #10;  // No change
        s = 1; r = 0; #10;  // Set
    end

    // Monitor outputs
    initial $monitor($time, " q=%b clk=%b s=%b r=%b", q, clk, s, r);

    // End simulation
    initial #60 $finish;

endmodule

