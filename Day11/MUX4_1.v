`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:12:20 05/09/2025 
// Design Name: 
// Module Name:    MUX4_1 
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
module MUX4_1(y, a, b, c, d, sel);
    output y;
    input a;
    input b;
    input c;
    input d;
    input [1:0] sel;
	 
	 assign y = (sel == 2'b00) ? a :
					(sel == 2'b01) ? b :
					(sel == 2'b10) ? c : d ;

endmodule
