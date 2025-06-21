`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:49:11 06/21/2025 
// Design Name: 
// Module Name:    imm_gen 
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
module imm_gen(
    input wire [31:0] instr,
    output reg [31:0] imm
);
    always @(*) begin
        case (instr[6:0])
            7'b0010011: imm = {{20{instr[31]}}, instr[31:20]}; // I-type
            7'b0100011: imm = {{20{instr[31]}}, instr[31:25], instr[11:7]}; // S-type
            7'b1100011: imm = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0}; // B-type
            default: imm = 32'd0;
        endcase
    end
endmodule
