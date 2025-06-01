`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:04 06/01/2025 
// Design Name: 
// Module Name:    pattern_detector 
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
module pattern_detector(detected, clk, reset, din);
    output reg detected;
    input wire clk;
    input wire reset;
    input wire din;
	 localparam S0 = 3'b000,
               S1 = 3'b001,
               S2 = 3'b010,
               S3 = 3'b011,
               S4 = 3'b100;

    reg [2:0] state, next_state;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = (din == 1) ? S1 : S0;
            S1: next_state = (din == 0) ? S2 : S1;
            S2: next_state = (din == 1) ? S3 : S0;
            S3: next_state = (din == 1) ? S4 : S2;
            S4: next_state = (din == 1) ? S1 : S2;
            default: next_state = S0;
        endcase
    end

    // Output logic (Moore style)
    always @(*) begin
        detected = (state == S4);
    end
endmodule
