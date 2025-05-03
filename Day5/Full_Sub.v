`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:01 05/03/2025 
// Design Name: 
// Module Name:    Full_Sub 
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
module Full_Sub(D, Bout, A, B, Bin);
    output D;
    output Bout;
    input A;
    input B;
    input Bin;
	 
	 assign D = A ^ B ^ Bin;
	 assign Bout = (~A & B) | ((~(A ^ B)) & Bin);


endmodule
