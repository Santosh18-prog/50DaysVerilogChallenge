`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:33 06/13/2025 
// Design Name: 
// Module Name:    chiplink_slave 
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
module chiplink_slave(
    input wire clk, rst,
    input wire [7:0] rx,
    output reg [7:0] mem_out,
    output reg valid
);
    reg [7:0] mem [0:255];
    reg [7:0] addr_buf;
    reg [1:0] state;
    localparam IDLE = 0, ADDR_RECEIVED = 1;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            mem_out <= 8'd0;
            valid <= 0;
        end else begin
            case (state)
                IDLE: begin
                    addr_buf <= rx;
                    valid <= 0;
                    state <= ADDR_RECEIVED;
                end
                ADDR_RECEIVED: begin
                    mem_out <= mem[addr_buf];
                    valid <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end

    // Initialize memory
    integer i;
    initial begin
        for (i = 0; i < 256; i = i + 1)
            mem[i] = i;
    end
endmodule
