`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:29 06/13/2025 
// Design Name: 
// Module Name:    chiplink_master 
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
module chiplink_master(
    input wire clk, rst, start,
    input wire [7:0] addr,
    input wire [7:0] data_in,
    input wire rw, // 0 = write, 1 = read
    output reg [7:0] tx,
    output reg done
);
    reg [2:0] state;
    localparam IDLE = 0, SEND_ADDR = 1, SEND_DATA = 2, WAIT = 3;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            done <= 0;
            tx <= 8'd0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    if (start) begin
                        tx <= addr;
                        state <= SEND_ADDR;
                    end
                end
                SEND_ADDR: begin
                    if (rw == 0) begin
                        tx <= data_in;
                        state <= SEND_DATA;
                    end else begin
                        state <= WAIT;
                    end
                end
                SEND_DATA: begin
                    state <= WAIT;
                end
                WAIT: begin
                    done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule
