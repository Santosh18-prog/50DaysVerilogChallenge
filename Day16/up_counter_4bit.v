`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:45 05/13/2025 
// Design Name: 
// Module Name:    up_counter_4bit 
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
module up_counter_4bit(count, clk, reset_n);
    output reg [3:0] count;
    input wire clk;
    input wire reset_n;
	 always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            count <= 4'b0000;         // Reset counter
        else
            count <= count + 1'b1;    // Increment counter
    end


endmodule
