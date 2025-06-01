`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:22:59 05/31/2025 
// Design Name: 
// Module Name:    gray_fsm 
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
module gray_fsm(state, out, clk, reset);
	 output reg [1:0] state;
    output reg out;
    input wire clk;
    input wire reset;
	 // Gray code states
    localparam IDLE    = 2'b00,
               LOAD    = 2'b01,
               EXECUTE = 2'b11,
               DONE    = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else begin
            case (state)
                IDLE:    state <= LOAD;
                LOAD:    state <= EXECUTE;
                EXECUTE: state <= DONE;
                DONE:    state <= IDLE;
                default: state <= IDLE;
            endcase
        end
    end

    // Moore output based on state
    always @(*) begin
        case (state)
            LOAD, EXECUTE: out = 1;
            default:       out = 0;
        endcase
    end
endmodule
