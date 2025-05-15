`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:08:01 05/15/2025 
// Design Name: 
// Module Name:    Down_Asynchronous_Counter_4bit 
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
module Down_Asynchronous_Counter_4bit(q, rst, clk);
    output reg [3:0] q;
    input wire rst;
    input wire clk;
	 
	 always @(posedge clk or posedge rst)begin
			if(rst)
				q[0] <= 1'b1;
			else
				q[0] <= ~q[0];
	 end
	 always @(negedge q[0] or posedge rst)begin
			if(rst)
				q[1] <= 1'b1;
			else
				q[1] <= ~q[1];
	 end
	 always @(negedge q[1] or posedge rst)begin
			if(rst)
				q[2] <= 1'b1;
			else
				q[2] <= ~q[2];
	 end
	 always @(negedge q[2] or posedge rst)begin
			if(rst)
				q[3] <= 1'b1;
			else
				q[3] <= ~q[3];
	 end
		


endmodule
