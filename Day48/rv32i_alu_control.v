`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:46:04 06/19/2025 
// Design Name: 
// Module Name:    rv32i_alu_control 
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
module rv32i_alu_control(
    output reg [3:0] alu_ctrl,
    input wire [1:0] ALUOp,
    input wire [2:0] funct3,
    input wire [6:0] funct7
    
);
    always @(*) begin
        case (ALUOp)
            2'b00: alu_ctrl = 4'b0010; // ADD (load/store)
            2'b01: alu_ctrl = 4'b0110; // SUB (branch)
            2'b10: begin // R-type or I-type
                case ({funct7[5], funct3})
                    4'b0000: alu_ctrl = 4'b0010; // ADD
                    4'b1000: alu_ctrl = 4'b0110; // SUB
                    4'b0111: alu_ctrl = 4'b0000; // AND
                    4'b0110: alu_ctrl = 4'b0001; // OR
                    4'b0100: alu_ctrl = 4'b0011; // XOR
                    4'b0001: alu_ctrl = 4'b0100; // SLL
                    4'b0101: alu_ctrl = (funct7[5] ? 4'b1101 : 4'b0101); // SRA or SRL
                    4'b0010: alu_ctrl = 4'b0111; // SLT
                    4'b0011: alu_ctrl = 4'b1000; // SLTU
                    default: alu_ctrl = 4'b0000;
                endcase
            end
            default: alu_ctrl = 4'b0000;
        endcase
    end
endmodule