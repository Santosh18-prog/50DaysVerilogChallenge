`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:16:49 05/13/2025 
// Design Name: 
// Module Name:    cla_4bit 
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
module cla_4bit(Sum, Cout, A, B, Cin);
    output [3:0] Sum;
    output Cout;
    input [3:0] A;
    input [3:0] B;
    input Cin;
	  wire [3:0] P, G; // Propagate and Generate
    wire [3:0] C;    // Carry

    // Propagate and Generate
    assign P = A ^ B;
    assign G = A & B;

    // Carry Lookahead Logic
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) |
                  (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);

    // Sum Calculation
    assign Sum = P ^ C;


endmodule
