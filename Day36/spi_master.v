`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:06:24 06/07/2025 
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
module spi_master (busy,mosi,sclk,cs,data_ready,clk,rst,start,data_in);
    output reg busy;//Indicates the transmission is ongoing
    output reg mosi;//Indicates SPI clk output
    output reg sclk;//Indicates SPI data output
    output reg cs;
    output reg data_ready;
    input wire clk;
    input wire rst;
    input wire start;
    input wire [15:0] data_in;
    reg [4:0] bit_cnt;
    reg [15:0] data_buf;
    reg [2:0] state;

    localparam IDLE  = 3'b000,
               LOAD  = 3'b001,
               TRANS = 3'b010,
               DONE  = 3'b011;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state      <= IDLE;
            busy       <= 1'b0;
            cs         <= 1'b1;
            sclk       <= 1'b0;
            mosi       <= 1'b0;
            bit_cnt    <= 5'd0;
            data_buf   <= 16'd0;
            data_ready <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    cs         <= 1'b1;
                    busy       <= 1'b0;
                    sclk       <= 1'b0;
                    data_ready <= 1'b0;
                    if (start) begin
                        data_buf <= data_in;
                        bit_cnt  <= 5'd15;
                        state    <= LOAD;
                        busy     <= 1'b1;
                    end
                end
                LOAD: begin
                    cs     <= 1'b0;
                    mosi   <= data_buf[15];
                    sclk   <= 1'b0;
                    state  <= TRANS;
                end

                TRANS: begin
                    sclk <= ~sclk;

                    if (sclk == 1'b0) begin // Falling edge: shift data
                        data_buf <= {data_buf[14:0], 1'b0};
                        if (bit_cnt == 0) begin
                            state <= DONE;
                        end else begin
                            bit_cnt <= bit_cnt - 1;
                            mosi    <= data_buf[14]; // next bit
                        end
                    end
                end

                DONE: begin
                    cs         <= 1'b1;
                    busy       <= 1'b0;
                    sclk       <= 1'b0;
                    data_ready <= 1'b1;
                    state      <= IDLE;
                end
            endcase
        end
    end
endmodule

