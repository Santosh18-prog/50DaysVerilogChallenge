`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:21:20 06/18/2025 
// Design Name: 
// Module Name:    rv32i_decoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module rv32i_decoder(
    output reg  [6:0]  opcode,
    output reg  [4:0]  rd,
    output reg  [2:0]  funct3,
    output reg  [4:0]  rs1,
    output reg  [4:0]  rs2,
    output reg  [6:0]  funct7,
    output reg  [31:0] imm_I,
    output reg  [31:0] imm_S,
    output reg  [31:0] imm_B,
    output reg  [31:0] imm_U,
    output reg  [31:0] imm_J,
	 input  wire [31:0] instr
);

    always @(*) begin
        opcode = instr[6:0];
        rd     = instr[11:7];
        funct3 = instr[14:12];
        rs1    = instr[19:15];
        rs2    = instr[24:20];
        funct7 = instr[31:25];

        // Immediate values
        imm_I = {{20{instr[31]}}, instr[31:20]};
        imm_S = {{20{instr[31]}}, instr[31:25], instr[11:7]};
        imm_B = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
        imm_U = {instr[31:12], 12'b0};
        imm_J = {{11{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};
    end
endmodule