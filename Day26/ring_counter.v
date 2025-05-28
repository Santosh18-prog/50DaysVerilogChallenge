`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:53:55 05/28/2025 
// Design Name: 
// Module Name:    ring_counter 
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
module ring_counter(q, clk, reset);
    output reg [3:0] q;
    input wire clk;
    input wire reset;
	 initial q = 4'b0001;
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0001;
        else
            q <= {q[2:0], q[3]}; 
    end
endmodule
