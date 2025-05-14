`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:30:36 05/13/2025
// Design Name:   up_counter_4bit
// Module Name:   up_counter_4bit_tb.v
// Project Name:  Day16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: up_counter_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module up_counter_4bit_tb;

    // Inputs
    reg clk;
    reg reset_n;

    // Outputs
    wire [3:0] count;

    // Instantiate the Unit Under Test (UUT)
    up_counter_4bit uut (
        .count(count), 
        .clk(clk), 
        .reset_n(reset_n)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        #12 reset_n = 0;    
        #20 reset_n = 1;   
        #10 reset_n = 0;    
        #20 reset_n = 1;     
        $finish;
    end

    // Display output
    initial begin
        $monitor($time, " count=%b clk=%b reset_n=%b", count, clk, reset_n);
    end

endmodule


