`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:01 06/06/2025 
// Design Name: 
// Module Name:    spi_master 
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
module spi_master(busy, sclk, mosi, cs, clk, rst, start, data_in);
    output reg busy;//Indicates the tranmission is ongoing
    output reg sclk;// Indicates SPI data output
    output reg mosi;// Indicates SPI clk output
    output reg cs;// Chip select
    input wire clk;
    input wire rst;
    input wire start;
    input wire [7:0] data_in;
	 parameter CLK_FREQ = 50000000;
    parameter SPI_CLK_FREQ = 1000000;
    localparam CLK_DIV = CLK_FREQ /(2*SPI_CLK_FREQ);
	 reg [15:0] clk_cnt = 0;
    reg [3:0] bit_cnt = 0;
    reg [7:0] shift_reg = 0;
    reg sclk_int = 0;
    reg spi_clk_en = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_cnt <= 0;
            sclk_int <= 0;
        end else if (spi_clk_en) begin
            if (clk_cnt == CLK_DIV - 1) begin
                clk_cnt <= 0;
                sclk_int <= ~sclk_int;
            end else begin
                clk_cnt <= clk_cnt + 1;
            end
        end else begin
            clk_cnt <= 0;
            sclk_int <= 0;
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cs <= 1;
            busy <= 0;
            sclk <= 0;
            mosi <= 0;
            shift_reg <= 0;
			   spi_clk_en <= 0;
        end else begin
            case ({busy, spi_clk_en, sclk_int})
                3'b000: begin
                    cs <= 1;
                    busy <= 0;
                    mosi <= 0;
                    sclk <= 0;
                    if (start) begin
                        cs <= 0;
                        busy <= 1;
                        spi_clk_en <= 1;
                        shift_reg <= data_in;
                        bit_cnt <= 7;
                        mosi <= data_in[7];
                    end
                end
                3'b111: begin
                // Falling edge of SPI clock
                    sclk <= 1;
                end
                3'b110: begin
                // Rising edge of SPI clock 
                    sclk <= 0;

                    if (bit_cnt == 0) begin
                        spi_clk_en <= 0;
                        busy <= 0;
                        cs <= 1;
                        mosi <= 0;
                    end else begin
                        bit_cnt <= bit_cnt - 1;
                        shift_reg <= {shift_reg[6:0], 1'b0};
                        mosi <= shift_reg[6];
                    end
                end
                default: begin
                    sclk <= sclk_int;
                end
            endcase
        end
    end
endmodule
