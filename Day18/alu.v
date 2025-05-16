`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:57:16 05/16/2025 
// Design Name: 
// Module Name:    alu 
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
module alu(y, cout, op, a, b);
    output reg [3:0] y;
    output reg cout;
    input [1:0] op;
    input [3:0] a;
    input [3:0] b;
	 always @(*) begin
    case (op)
        2'b00: begin {cout, y} = a + b; end
        2'b01: begin cout = 0; y = a - b; end
        2'b10: begin cout = 0; y = a & b; end
        2'b11: begin cout = 0; y = a | b; end
        default: begin cout = 0; y = 4'b0000; end
    endcase
	 end


endmodule
