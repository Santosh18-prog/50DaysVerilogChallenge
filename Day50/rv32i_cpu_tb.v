`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:08:54 06/21/2025
// Design Name:   rv32i_cpu
// Module Name:   rv32i_cpu_tb.v
// Project Name:  Day50
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rv32i_cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module rv32i_cpu_tb;

    reg clk;
    reg rst;

    // Instantiate the CPU
    rv32i_cpu uut (
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        rst = 1;
        #20;
        rst = 0;
        #500;
        $finish;
    end

endmodule
