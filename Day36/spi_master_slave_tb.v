`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:19:30 06/07/2025
// Design Name:   spi_master
// Module Name:   spi_master_slave_tb.v
// Project Name:  Day36
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: spi_master
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module spi_master_slave_tb;

reg clk;
reg rst;
reg start;
reg [15:0] data_in;

wire sclk;
wire mosi;
wire cs;
wire busy;
wire data_ready;

// Instantiate SPI Master
spi_master master (
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .sclk(sclk),
    .mosi(mosi),
    .cs(cs),
    .busy(busy),
    .data_ready(data_ready)  // connect data_ready output
);

// Instantiate SPI Slave Register Bank
spi_slave_regbank slave (
    .clk(clk),
    .rst(rst),
    .sclk(sclk),
    .mosi(mosi),
    .cs(cs),
    .data_ready()           // not connected here if unused
);

// Clock generation: 10 time units period
initial clk = 0;
always #5 clk = ~clk;

// Task to display slave regfile content
task display_regfile;
    integer j;
    begin
        for (j = 0; j < 16; j = j + 1) begin
            $display("regfile[%0d] = %h", j, slave.regfile[j]);
        end
    end
endtask

initial begin
    // Initialize
    rst = 1;
    start = 0;
    data_in = 16'b0;

    #20;
    rst = 0;

    // Give some time before starting transfer
    #20;

    // Load data to write: addr=3, data=0xAB
    data_in = 16'b0011_0000_1010_1011;

    // Start SPI transfer
    start = 1;
    #10;
    start = 0;

    // Wait until master is done
    wait (busy == 0);

    // Wait some time to allow slave to update regfile
    #50;

    // Display regfile contents
    display_regfile;  // call without parentheses

    #50;

    $finish;
end

endmodule

