`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:23 05/02/2025 
// Design Name: 
// Module Name:    Half_Sub 
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
module Half_Sub(D, Bout, A, B);
    output D;
    output Bout;
    input A;
    input B;
	 
	 assign D = A ^ B ;
	 assign Bout = ~A & B ;


endmodule
