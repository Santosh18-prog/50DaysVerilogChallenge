`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:25 06/14/2025 
// Design Name: 
// Module Name:    tilelink_ul_slave 
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
module tilelink_ul_slave (
    input  wire clk,
    input  wire rst,
    input  wire a_valid,
    output wire a_ready,
    input  wire [2:0] a_opcode,   
    input  wire [31:0] a_address,
    input  wire [31:0] a_data,
    input  wire [2:0] a_size,
    output reg  d_valid,
    input  wire d_ready,
    output reg [1:0] d_opcode,   
    output reg [31:0] d_data   );
    reg [31:0] mem [0:255]; // Simple memory
    assign a_ready = 1'b1;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            d_valid <= 0;
            d_data  <= 0;
        end else begin
            d_valid <= 0;
            if (a_valid && a_ready) begin
                case (a_opcode)
                    3'b000: begin // PutFullData
                        mem[a_address[9:2]] <= a_data;
                        d_opcode <= 2'b00; // AccessAck
                        d_valid <= 1;
                    end
                    3'b100: begin // Get
                        d_data <= mem[a_address[9:2]];
                        d_opcode <= 2'b01; // AccessAckData
                        d_valid <= 1;
                    end
                    default: begin
                        d_opcode <= 2'b11; // Error
                        d_valid <= 1;
                    end
                endcase
            end
        end
    end
endmodule

