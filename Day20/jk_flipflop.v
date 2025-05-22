`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:11:42 05/22/2025 
// Design Name: 
// Module Name:    jk_flipflop 
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
module jk_flipflop(q, j, k, clk);
    output reg q;
    input wire j;
    input wire k;
    input wire clk;
	 initial q = 1'b0;
	 always @(posedge clk) begin
	 
        case ({j, k})
            2'b00: q <= q;         // No change
            2'b01: q <= 0;         // Reset
            2'b10: q <= 1;         // Set
            2'b11: q <= ~q;        // Toggle
        endcase
	 end

endmodule
