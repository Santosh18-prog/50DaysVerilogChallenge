`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:30:01 06/06/2025
// Design Name:   spi_master
// Module Name:   spi_master_tb.v
// Project Name:  Day35
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

module spi_master_tb_v;

	// Inputs
	reg clk;
	reg rst;
	reg start;
	reg [7:0] data_in;

	// Outputs
	wire busy;
	wire sclk;
	wire mosi;
	wire cs;

	// Instantiate the Unit Under Test (UUT)
	spi_master uut (
		.busy(busy), 
		.sclk(sclk), 
		.mosi(mosi), 
		.cs(cs), 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.data_in(data_in)
	);

	initial begin
    clk = 0;
    forever #10 clk = ~clk; // 50 MHz clock
end

initial begin
    rst = 1; start = 0; data_in = 0;
    #100;
    rst = 0;
    #100;

    data_in = 8'hA5;
    start = 1;
    #20;
    start = 0;

    wait(busy == 0);

    #200;
    data_in = 8'h3C;
    start = 1;
    #20;
    start = 0;

    wait(busy == 0);

    #500;
    $stop;
end
      
endmodule

