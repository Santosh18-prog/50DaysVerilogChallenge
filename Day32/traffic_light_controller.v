`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:49:44 06/04/2025 
// Design Name: 
// Module Name:    traffic_light_controller 
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
// 2-way traffic_light_controller using pedestrain mode
module traffic_light_controller(roadA_light, roadB_light, ped_walk, clk, rst, ped_button);   
    output reg [2:0] roadA_light;
    output reg [2:0] roadB_light;
    output reg ped_walk;
    input wire clk;
    input wire rst;
    input wire ped_button;
	 localparam RED = 3'b100;//defining the traffic lights
	 localparam YELLOW = 3'b010;
	 localparam GREEN = 3'b001;
	 localparam S0 = 3'd0;//defining the states
	 localparam S1 = 3'd1;
	 localparam S2 = 3'd2;
	 localparam S3 = 3'd3;
	 localparam S4 = 3'd4;
	 localparam T_GREEN = 50; // defining time for each light (50 means 50s)
	 localparam T_YELLOW = 10;
	 localparam T_WALK = 30;
	 reg [2:0]state,next_state; //defining the present state and next state
	 reg [7:0]timer; //timer for state duration
	 reg ped_req_flag; //stores pedestrain req
	 always @(posedge clk or posedge rst)begin
	    if(rst)begin
		    state <= 0;
			 timer <= 0;
			 ped_req_flag <= 0;
		 end else begin
		         state <= next_state;
					if(state != next_state)begin // means next_state enters new state
					   timer <= 0;
					end else begin
					   timer <= timer + 1;
					  end
					if(ped_button)
					   ped_req_flag <= 1;
					else if(state == S4) 
					   ped_req_flag <= 0;
					end
		  end
		  always @(*) begin
           next_state = state;
			  case(state)
			  S0: begin
           if (timer >= T_GREEN)
                next_state = S1;
           end
           S1: begin
           if (timer >= T_YELLOW) begin
              if (ped_req_flag)
                 next_state = S4;  // Go to pedestrian walk
              else
                 next_state = S2;
              end
           end
           S2: begin
              if (timer >= T_GREEN)
                next_state = S3;
           end
           S3: begin
           if (timer >= T_YELLOW) begin
              if (ped_req_flag)
                 next_state = S4;  // Go to pedestrian walk
               else
                  next_state = S0;
              end
           end
           S4: begin
           if (timer >= T_WALK)
              next_state = S0;  // After pedestrian walk back to S0
           end
           endcase
         end

         always @(*) begin
         ped_walk = 0;
         case(state)
            S0: begin
            roadA_light = GREEN;
            roadB_light = RED;
            end
            S1: begin
            roadA_light = YELLOW;
            roadB_light = RED;
            end
            S2: begin
            roadA_light = RED;
            roadB_light = GREEN;
            end
            S3: begin
            roadA_light = RED;
            roadB_light = YELLOW;
            end
            S4: begin
            roadA_light = RED;
            roadB_light = RED;
            ped_walk = 1;   // Pedestrian walk ON
            end
            default: begin
            roadA_light = RED;
            roadB_light = RED;
            ped_walk = 0;
            end
         endcase
       end
endmodule
