`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:15 06/07/2025 
// Design Name: 
// Module Name:    spi_slave_regbank 
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
module spi_slave_regbank (data_ready,clk,rst,sclk,mosi,cs);
    input wire clk;
    input wire rst;
    input wire sclk;
    input wire mosi;
    input wire cs;
    output reg data_ready;
    reg [7:0] regfile [0:15]; //Indicates 16 registers each 8 bit
    reg [4:0] bit_cnt = 0;
    reg [15:0] shift_reg = 0;
    reg sclk_prev = 0;//Holds previous state of sclk
    wire sclk_rising = (sclk == 1 && sclk_prev == 0);
    integer i;
    always @(posedge clk) begin
        sclk_prev <= sclk;
        if (rst) begin
            bit_cnt <= 0;
            shift_reg <= 0;
            data_ready <= 0;
            for (i = 0; i < 16; i = i + 1)
                regfile[i] <= 8'b0;
        end else if (!cs && sclk_rising) begin
            shift_reg <= {shift_reg[14:0], mosi};
            bit_cnt <= bit_cnt + 1;

            if (bit_cnt == 15) begin
                regfile[shift_reg[15:12]] <= shift_reg[7:0];
                data_ready <= 1;
            end else begin
                data_ready <= 0;
            end
        end
        if (cs) begin
            bit_cnt <= 0;
            data_ready <= 0;
        end
    end
    task display_regfile;
        integer j;
        begin
            for (j = 0; j < 16; j = j + 1)
                $display("regfile[%0d] = %h", j, regfile[j]);
        end
    endtask
endmodule