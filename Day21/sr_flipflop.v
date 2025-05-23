`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:20 05/23/2025 
// Design Name: 
// Module Name:    sr_flipflop 
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
module sr_flipflop(q, s, r, clk);
    output reg q;
    input wire s;
    input wire r;
    input wire clk;

    initial q = 1'b0;

    always @(posedge clk) begin
        case ({s, r})
            2'b00: q <= q;     // No change
            2'b01: q <= 1'b0;  // Reset
            2'b10: q <= 1'b1;  // Set
            2'b11: q <= q;     // Invalid (hold)
        endcase
    end
endmodule


