`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:42:09 06/15/2025 
// Design Name: 
// Module Name:    tap_controlle 
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
module tap_controller(
    input wire TCK,
    input wire TMS,
    input wire TRST,
    output reg [3:0] state
);

    // TAP States (IEEE 1149.1)
    localparam [3:0]
        TEST_LOGIC_RESET = 4'd0,
        RUN_TEST_IDLE    = 4'd1,
        SELECT_DR_SCAN   = 4'd2,
        CAPTURE_DR       = 4'd3,
        SHIFT_DR         = 4'd4,
        EXIT1_DR         = 4'd5,
        PAUSE_DR         = 4'd6,
        EXIT2_DR         = 4'd7,
        UPDATE_DR        = 4'd8,
        SELECT_IR_SCAN   = 4'd9,
        CAPTURE_IR       = 4'd10,
        SHIFT_IR         = 4'd11,
        EXIT1_IR         = 4'd12,
        PAUSE_IR         = 4'd13,
        EXIT2_IR         = 4'd14,
        UPDATE_IR        = 4'd15;

    // State transition on TCK rising edge
    always @(posedge TCK or posedge TRST) begin
        if (TRST) begin
            state <= TEST_LOGIC_RESET;
        end else begin
            case (state)
                TEST_LOGIC_RESET: state <= TMS ? TEST_LOGIC_RESET : RUN_TEST_IDLE;
                RUN_TEST_IDLE:    state <= TMS ? SELECT_DR_SCAN   : RUN_TEST_IDLE;
                SELECT_DR_SCAN:   state <= TMS ? SELECT_IR_SCAN   : CAPTURE_DR;
                CAPTURE_DR:       state <= TMS ? EXIT1_DR         : SHIFT_DR;
                SHIFT_DR:         state <= TMS ? EXIT1_DR         : SHIFT_DR;
                EXIT1_DR:         state <= TMS ? UPDATE_DR        : PAUSE_DR;
                PAUSE_DR:         state <= TMS ? EXIT2_DR         : PAUSE_DR;
                EXIT2_DR:         state <= TMS ? UPDATE_DR        : SHIFT_DR;
                UPDATE_DR:        state <= TMS ? SELECT_DR_SCAN   : RUN_TEST_IDLE;
                SELECT_IR_SCAN:   state <= TMS ? TEST_LOGIC_RESET : CAPTURE_IR;
                CAPTURE_IR:       state <= TMS ? EXIT1_IR         : SHIFT_IR;
                SHIFT_IR:         state <= TMS ? EXIT1_IR         : SHIFT_IR;
                EXIT1_IR:         state <= TMS ? UPDATE_IR        : PAUSE_IR;
                PAUSE_IR:         state <= TMS ? EXIT2_IR         : PAUSE_IR;
                EXIT2_IR:         state <= TMS ? UPDATE_IR        : SHIFT_IR;
                UPDATE_IR:        state <= TMS ? SELECT_DR_SCAN   : RUN_TEST_IDLE;
                default:          state <= TEST_LOGIC_RESET;
            endcase
        end
    end
endmodule
