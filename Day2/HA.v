`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:31:47 04/30/2025 
// Design Name: 
// Module Name:    HA 
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
module HA(carry,sum,a,b);
    input  wire a;
    input  wire b;
    output reg sum;
    output reg carry;

always @ (a or b) begin
    sum   = (a == b) ? 0 : 1;   
    carry = (a == 1 && b == 1) ? 1 : 0; 
end

endmodule
