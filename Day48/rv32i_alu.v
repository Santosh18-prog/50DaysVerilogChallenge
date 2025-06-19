`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:45:16 06/19/2025 
// Design Name: 
// Module Name:    rv32i_alu 
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
module rv32i_alu(
    output reg [31:0] result,
    output reg zero,
    input wire [31:0] op1,
    input wire [31:0] op2,
    input wire [3:0] alu_ctrl
    
);
    always @(*) begin
        case (alu_ctrl)
            4'b0000: result = op1 & op2;         // AND
            4'b0001: result = op1 | op2;         // OR
            4'b0010: result = op1 + op2;         // ADD
            4'b0110: result = op1 - op2;         // SUB
            4'b0011: result = op1 ^ op2;         // XOR
            4'b0100: result = op1 << op2[4:0];   // SLL
            4'b0101: result = op1 >> op2[4:0];   // SRL
            4'b1101: result = $signed(op1) >>> op2[4:0]; // SRA
            4'b0111: result = ($signed(op1) < $signed(op2)) ? 1 : 0; // SLT
            4'b1000: result = (op1 < op2) ? 1 : 0;   // SLTU
            default: result = 0;
        endcase

        zero = (result == 0);
    end
endmodule
