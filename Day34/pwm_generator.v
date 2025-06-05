`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:12 06/05/2025 
// Design Name: 
// Module Name:    pwm_generator 
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
module pwm_generator (pwm_out,clk,rst,duty_cycle);
    parameter WIDTH = 8;
    output reg pwm_out;
    input wire clk;
    input wire rst;
    input wire [WIDTH-1:0] duty_cycle;
    reg [WIDTH-1:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst)
            counter <= 0;
        else
            counter <= counter + 1;
    end
    always @(posedge clk or posedge rst) begin
        if (rst)
            pwm_out <= 0;
        else
            pwm_out <= (counter < duty_cycle) ? 1'b1 : 1'b0;
    end
endmodule



