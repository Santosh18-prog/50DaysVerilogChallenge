`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:20:38 06/05/2025
// Design Name:   pwm_generator
// Module Name:   pwm_generator_tb.v
// Project Name:  Day34
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pwm_generator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module pwm_generator_tb;

    parameter WIDTH = 8;

    // Inputs
    reg clk;
    reg rst;
    reg [WIDTH-1:0] duty_cycle;

    // Output
    wire pwm_out;

    // Instantiate the Unit Under Test (UUT)
    pwm_generator #(WIDTH) uut (
        .clk(clk),
        .rst(rst),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );
    initial clk = 0;
    always #10 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize Inputs
        rst = 1;
        duty_cycle = 0;
        #40;
        rst = 0;
        #20;
        duty_cycle = 64;
        #100000;
        $stop;
    end

endmodule

