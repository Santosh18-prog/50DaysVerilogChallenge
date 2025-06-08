`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:52:45 06/08/2025
// Design Name:   i2c_master
// Module Name:   i2c_tb.v
// Project Name:  Day37
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: i2c_master
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

// Testbench
module i2c_tb;

    reg clk;
    reg rst;
    reg start;
    wire scl;
    wire sda;
    wire busy;
    wire done;

    i2c_master uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .scl(scl),
        .sda(sda),
        .busy(busy),
        .done(done)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        rst = 1;
        start = 0;

        #100;
        rst = 0;

        #100;
        start = 1;
        #20;
        start = 0;

        wait (done == 1);

        #100;

        $finish;
    end

endmodule