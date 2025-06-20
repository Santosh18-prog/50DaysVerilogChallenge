`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:14:16 06/20/2025
// Design Name:   aes_core
// Module Name:   aes_core_tb.v
// Project Name:  Day49
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: aes_core
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module aes_core_tb_v;

	// Inputs
	reg clk;
	reg rst;
	reg start;
	reg [127:0] plaintext;
	reg [127:0] key;

	// Outputs
	wire [127:0] ciphertext;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	aes_core uut (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.plaintext(plaintext), 
		.key(key), 
		.ciphertext(ciphertext), 
		.done(done)
	);

	always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        start = 0;
        plaintext = 128'h00112233445566778899aabbccddeeff;
        key       = 128'h000102030405060708090a0b0c0d0e0f;
        #10;
        rst = 0;

        #10 start = 1;
        #10 start = 0;

        wait(done);
        #10;
        $display("Ciphertext: %h", ciphertext);
        $finish;
    end
      
endmodule

