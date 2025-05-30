`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:22:51 05/30/2025 
// Design Name: 
// Module Name:    gray_counter 
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
module gray_counter(gray, clk, reset);
    output reg [3:0] gray;
    input wire clk;
    input wire reset;
	 reg [3:0] binary;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            binary <= 4'b0000;
            gray <= 4'b0000;
        end else begin
            binary <= binary + 1;
            gray <= binary ^ (binary >> 1);
        end
    end


endmodule
