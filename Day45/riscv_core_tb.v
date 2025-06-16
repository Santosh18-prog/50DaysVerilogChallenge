`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:06:37 06/16/2025
// Design Name:   riscv_core
// Module Name:   riscv_core_tb.v
// Project Name:  Day45
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: riscv_core
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module riscv_core_tb;

    reg clk, rst;
    wire [31:0] pc_out;

    riscv_core uut (
        .clk(clk),
        .rst(rst),
        .pc_out(pc_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #10;
        rst = 0;

        #100;

        $display("Final PC: %d", pc_out);
        $finish;
    end
endmodule
