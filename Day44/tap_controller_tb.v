`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:44:23 06/15/2025
// Design Name:   tap_controller
// Module Name:   tap_controller_tb.v
// Project Name:  Day44
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tap_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////



module tap_controller_tb;

    reg TCK, TMS, TRST;
    wire [3:0] state;

    // Instantiate the TAP Controller
    tap_controller uut (
        .TCK(TCK),
        .TMS(TMS),
        .TRST(TRST),
        .state(state)
    );

    // Clock generation (10ns period)
    initial begin
        TCK = 0;
        forever #5 TCK = ~TCK;
    end

    // Stimulus
    initial begin
        $display("Time\tTMS\tState");
        $monitor("%0dns\t%b\t%0d", $time, TMS, state);

        // Initial reset
        TRST = 1;
        TMS = 0;
        #20;
        TRST = 0;

        // TAP state sequence example to SHIFT-DR
        apply_tms_sequence(6'b011000); 

        // Pause then go back to idle
        TMS = 1; @(posedge TCK); // Exit1-DR
        TMS = 1; @(posedge TCK); // Update-DR
        TMS = 0; @(posedge TCK); // Run-Test/Idle

        #50;
        $finish;
    end

    // Task to apply TMS bits (LSB first)
    task apply_tms_sequence(input [5:0] bits);
        integer i;
        begin
            for (i = 0; i < 6; i = i + 1) begin
                TMS = bits[i];
                @(posedge TCK);
            end
        end
    endtask

endmodule


