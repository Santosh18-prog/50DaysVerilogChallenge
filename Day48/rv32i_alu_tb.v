`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:47:01 06/19/2025
// Design Name:   rv32i_alu
// Module Name:   rv32i_alu_tb.v
// Project Name:  Day48
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rv32i_alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module rv32i_alu_tb;
    reg [31:0] op1, op2;
    reg [3:0] alu_ctrl;
    wire [31:0] result;
    wire zero;

    rv32i_alu uut (
        .op1(op1),
        .op2(op2),
        .alu_ctrl(alu_ctrl),
        .result(result),
        .zero(zero)
    );

    initial begin
        $display("Time | op1 | op2 | ctrl | result | zero");
        op1 = 32'd10; op2 = 32'd5; alu_ctrl = 4'b0010; #10; // ADD
        $display("%t | %d | %d | %b | %d | %b", $time, op1, op2, alu_ctrl, result, zero);

        alu_ctrl = 4'b0110; #10; // SUB
        $display("%t | %d | %d | %b | %d | %b", $time, op1, op2, alu_ctrl, result, zero);

        alu_ctrl = 4'b0000; #10; // AND
        $display("%t | %d | %d | %b | %d | %b", $time, op1, op2, alu_ctrl, result, zero);

        alu_ctrl = 4'b0001; #10; // OR
        $display("%t | %d | %d | %b | %d | %b", $time, op1, op2, alu_ctrl, result, zero);

        op1 = 32'd5; op2 = 32'd5; alu_ctrl = 4'b0110; #10; // SUB (zero flag)
        $display("%t | %d | %d | %b | %d | %b", $time, op1, op2, alu_ctrl, result, zero);

        $finish;
    end
endmodule


