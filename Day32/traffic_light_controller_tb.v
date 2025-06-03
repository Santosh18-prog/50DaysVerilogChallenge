`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:08:05 06/04/2025
// Design Name:   traffic_light_controller
// Module Name:   traffic_light_controller_tb.v
// Project Name:  Day32
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_light_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps
`timescale 1ns/1ps

module traffic_light_controller_tb;

    wire [2:0] roadA_light;
    wire [2:0] roadB_light;
    wire ped_walk;
	 reg clk;
    reg rst;
    reg ped_button;

    // Instantiate the DUT
    traffic_light_controller uut (
        .roadA_light(roadA_light),
        .roadB_light(roadB_light),
        .ped_walk(ped_walk),
		  .clk(clk),
        .rst(rst),
        .ped_button(ped_button)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Monitor output every clock edge
    always @(posedge clk) begin
        $display("Time = %0t | RoadA = %b | RoadB = %b | Pedestrian Walk = %b | Ped Button = %b",
                 $time, roadA_light, roadB_light, ped_walk, ped_button);
    end

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        ped_button = 0;

        // Apply reset
        #20;
        rst = 0;

        // Let system run for a while
        #200;

        // Simulate pedestrian button press
        ped_button = 1;
        #20;
        ped_button = 0;

        // Wait for pedestrian light to activate
        #600;

        // Simulate another pedestrian button press
        #100;
        ped_button = 1;
        #20;
        ped_button = 0;

        #500;

        $display("Simulation finished.");
        $stop;
    end

endmodule

