`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:22:14 06/18/2025
// Design Name:   rv32i_decoder
// Module Name:   rv32i_decoder_tb.v
// Project Name:  Day47
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rv32i_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rv32i_decoder_tb_v;

	// Inputs
	reg [31:0] instr;

	// Outputs
	wire [6:0] opcode;
	wire [4:0] rd;
	wire [2:0] funct3;
	wire [4:0] rs1;
	wire [4:0] rs2;
	wire [6:0] funct7;
	wire [31:0] imm_I;
	wire [31:0] imm_S;
	wire [31:0] imm_B;
	wire [31:0] imm_U;
	wire [31:0] imm_J;

	// Instantiate the Unit Under Test (UUT)
	rv32i_decoder uut (
		.instr(instr), 
		.opcode(opcode), 
		.rd(rd), 
		.funct3(funct3), 
		.rs1(rs1), 
		.rs2(rs2), 
		.funct7(funct7), 
		.imm_I(imm_I), 
		.imm_S(imm_S), 
		.imm_B(imm_B), 
		.imm_U(imm_U), 
		.imm_J(imm_J)
	);

	initial begin
        // ADD x1, x2, x3 => 0x003100B3
        instr = 32'h003100B3;
        #10;
        $display("ADD: opcode=%b, rd=%d, rs1=%d, rs2=%d, funct3=%b, funct7=%b", opcode, rd, rs1, rs2, funct3, funct7);

        // LW x5, 12(x1) => 0x00C12083
        instr = 32'h00C12083;
        #10;
        $display("LW: opcode=%b, rd=%d, rs1=%d, imm_I=%d", opcode, rd, rs1, imm_I);

        // SW x5, 8(x1) => 0x00512023
        instr = 32'h00512023;
        #10;
        $display("SW: opcode=%b, rs1=%d, rs2=%d, imm_S=%d", opcode, rs1, rs2, imm_S);

        // BEQ x1, x2, 16 => 0x00208663
        instr = 32'h00208663;
        #10;
        $display("BEQ: opcode=%b, rs1=%d, rs2=%d, imm_B=%d", opcode, rs1, rs2, imm_B);

        // JAL x1, 32 => 0x020000EF
        instr = 32'h020000EF;
        #10;
        $display("JAL: opcode=%b, rd=%d, imm_J=%d", opcode, rd, imm_J);

        $finish;
    end
      
endmodule

