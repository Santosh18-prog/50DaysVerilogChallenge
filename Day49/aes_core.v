`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:13:19 06/20/2025 
// Design Name: 
// Module Name:    aes_core 
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
module aes_core(
    output reg [127:0] ciphertext,
    output reg done,
    input wire clk,
    input wire rst,
    input wire start,
    input wire [127:0] plaintext,
    input wire [127:0] key 
);
    // Internal state
    reg [127:0] state;
    reg [127:0] round_key;
    reg [3:0] round;
    // State machine states
    localparam IDLE = 0, ADD_ROUND_KEY = 1, DONE = 2;
    reg [1:0] fsm_state;
    // Simple SubBytes function using dummy S-box (identity mapping)
    function [7:0] sub_byte;
        input [7:0] byte_in;
        begin
            sub_byte = byte_in; // Replace with actual S-box in real AES
        end
    endfunction

    // Substitute bytes in state
    function [127:0] sub_bytes;
        input [127:0] in;
        integer i;
        reg [127:0] out;
        begin
            for (i = 0; i < 16; i = i + 1) begin
                out[i*8 +: 8] = sub_byte(in[i*8 +: 8]);
            end
            sub_bytes = out;
        end
    endfunction
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 0;
            round_key <= 0;
            ciphertext <= 0;
            done <= 0;
            round <= 0;
            fsm_state <= IDLE;
        end else begin
            case (fsm_state)
                IDLE: begin
                    if (start) begin
                        state <= plaintext ^ key; // Initial AddRoundKey
                        round_key <= key; // Incomplete key expansion
                        round <= 1;
                        fsm_state <= ADD_ROUND_KEY;
                        done <= 0;
                    end
                end
                ADD_ROUND_KEY: begin
                    state <= sub_bytes(state) ^ round_key;
                    ciphertext <= state;
                    done <= 1;
                    fsm_state <= DONE;
                end
                DONE: begin
                    fsm_state <= IDLE;
                end
            endcase
        end
    end
endmodule
