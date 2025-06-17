`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:12:24 06/17/2025
// Design Name:   rv32i_csr_unit
// Module Name:   tb_rv32i_csr_unit.v
// Project Name:  Day46
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rv32i_csr_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_rv32i_csr_unit_v;

	// Inputs
	reg clk;
	reg rst;
	reg csr_en;
	reg [11:0] csr_addr;
	reg [31:0] csr_wdata;
	reg [2:0] csr_cmd;

	// Outputs
	wire [31:0] csr_rdata;

	// Instantiate the Unit Under Test (UUT)
	rv32i_csr_unit uut (
		.clk(clk), 
		.rst(rst), 
		.csr_en(csr_en), 
		.csr_addr(csr_addr), 
		.csr_wdata(csr_wdata), 
		.csr_cmd(csr_cmd), 
		.csr_rdata(csr_rdata)
	);

	initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Starting CSR Unit Simulation");

        // Reset
        rst = 1;
        csr_en = 0;
        csr_addr = 0;
        csr_wdata = 0;
        csr_cmd = 3'b000;
        #10;

        rst = 0;

        // WRITE mstatus (0x300)
        csr_en = 1;
        csr_addr = 12'h300;
        csr_wdata = 32'hCAFEBABE;
        csr_cmd = 3'b001;  // WRITE
        #10;

        // READ mstatus
        csr_cmd = 3'b100;  // READ
        #10;
        $display("mstatus = %h", csr_rdata);

        // SET mtvec (0x305)
        csr_addr = 12'h305;
        csr_wdata = 32'h000000FF;
        csr_cmd = 3'b010;  // SET
        #10;

        // READ mtvec
        csr_cmd = 3'b100;
        #10;
        $display("mtvec = %h", csr_rdata);

        // CLEAR mstatus
        csr_addr = 12'h300;
        csr_wdata = 32'h00FF00FF;
        csr_cmd = 3'b011;  // CLEAR
        #10;

        // READ mstatus
        csr_cmd = 3'b100;
        #10;
        $display("mstatus after CLEAR = %h", csr_rdata);

        // Invalid CSR address test
        csr_addr = 12'hFFF;
        csr_cmd = 3'b100;
        #10;
        $display("unknown csr_rdata = %h", csr_rdata);

        $finish;
    end
      
endmodule

