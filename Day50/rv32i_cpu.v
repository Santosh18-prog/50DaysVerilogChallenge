`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:49:56 06/21/2025 
// Design Name: 
// Module Name:    rv32i_cpu 
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
module rv32i_cpu(
    input wire clk,
    input wire rst
);
    reg [31:0] pc;
    reg [31:0] instr_mem [0:255];
    wire [31:0] instr = instr_mem[pc[9:2]];

    wire [4:0] rs1 = instr[19:15];
    wire [4:0] rs2 = instr[24:20];
    wire [4:0] rd  = instr[11:7];
    wire [31:0] imm;
    wire [31:0] a, b;
    wire [31:0] alu_out;
    wire reg_write = 1'b1; // Simplified for ADDI, ADD
    wire [3:0] alu_ctrl = (instr[6:0] == 7'b0110011) ? 4'b0010 : 4'b0010; // ADD only

    imm_gen ig(.instr(instr), .imm(imm));
    regfile rf(.clk(clk), .we(reg_write), .rs1(rs1), .rs2(rs2), .rd(rd), .wd(alu_out), .rd1(a), .rd2(b));
    alu core_alu(.a(a), .b((instr[6:0] == 7'b0010011) ? imm : b), .alu_ctrl(alu_ctrl), .result(alu_out));

    always @(posedge clk or posedge rst) begin
        if (rst)
            pc <= 0;
        else
            pc <= pc + 4;
    end
endmodule
