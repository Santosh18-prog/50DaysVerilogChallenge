`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:31:07 06/14/2025
// Design Name:   tilelink_ul_slave
// Module Name:   tilelink_tb.v
// Project Name:  Day43
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tilelink_ul_slave
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tilelink_tb_v;

	// Inputs
	reg clk;
	reg rst;
	reg a_valid;
	reg [2:0] a_opcode;
	reg [31:0] a_address;
	reg [31:0] a_data;
	reg [2:0] a_size;
	reg d_ready;

	// Outputs
	wire a_ready;
	wire d_valid;
	wire [1:0] d_opcode;
	wire [31:0] d_data;

	// Instantiate the Unit Under Test (UUT)
	tilelink_ul_slave uut (
		.clk(clk), 
		.rst(rst), 
		.a_valid(a_valid), 
		.a_ready(a_ready), 
		.a_opcode(a_opcode), 
		.a_address(a_address), 
		.a_data(a_data), 
		.a_size(a_size), 
		.d_valid(d_valid), 
		.d_ready(d_ready), 
		.d_opcode(d_opcode), 
		.d_data(d_data)
	);

	initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initial values
        rst = 1;
        a_valid = 0;
        a_opcode = 0;
        a_address = 0;
        a_data = 0;
        a_size = 3'b010; // 4 bytes
        d_ready = 1;

        #20;
        rst = 0;
        #10;

        // Write 32'hDEADBEEF to address 4
        @(posedge clk);
        a_valid = 1;
        a_opcode = 3'b000; // PutFullData
        a_address = 32'h00000004;
        a_data = 32'hDEADBEEF;

        @(posedge clk);
        a_valid = 0;

        // Wait for d_valid
        wait (d_valid);
        @(posedge clk);

        // Read from address 4
        a_valid = 1;
        a_opcode = 3'b100; // Get
        a_address = 32'h00000004;

        @(posedge clk);
        a_valid = 0;

        wait (d_valid);
        $display("Read Data = 0x%08X", d_data); // Expect 0xDEADBEEF

        #20;
        $finish;
    end
      
endmodule

