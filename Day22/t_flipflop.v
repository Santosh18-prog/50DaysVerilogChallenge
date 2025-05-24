`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:05:18 05/24/2025 
// Design Name: 
// Module Name:    t_flipflop 
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
module t_flipflop(q, t, clk);
    output reg q;
    input wire t;
    input wire clk;
	 initial q = 1'b0;

    always @(posedge clk) begin
        case (t)
            1'b0: q <= q;         // No toggle
            1'b1: q <= ~q;        // Toggle
        endcase
    end


endmodule
