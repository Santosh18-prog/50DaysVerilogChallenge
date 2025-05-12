`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:24:57 05/12/2025 
// Design Name: 
// Module Name:    ripple_carry_adder_4bit 
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
module ripple_carry_adder_4bit(Cout, Sum, A, B, Cin);
    output Cout;
    output [3:0] Sum;
    input [3:0] A;
    input [3:0] B;
    input Cin;
	 
	 wire [2:0] carry;

    full_adder fa0 (.a(A[0]), .b(B[0]), .cin(Cin),     .sum(Sum[0]), .cout(carry[0]));
    full_adder fa1 (.a(A[1]), .b(B[1]), .cin(carry[0]), .sum(Sum[1]), .cout(carry[1]));
    full_adder fa2 (.a(A[2]), .b(B[2]), .cin(carry[1]), .sum(Sum[2]), .cout(carry[2]));
    full_adder fa3 (.a(A[3]), .b(B[3]), .cin(carry[2]), .sum(Sum[3]), .cout(Cout));


endmodule
