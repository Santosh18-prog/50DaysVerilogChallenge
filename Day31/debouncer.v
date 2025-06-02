`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:49:00 06/02/2025 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(clean_out, clk, rst, noisy_in);
    output reg clean_out;
    input wire clk;
    input wire rst;
    input wire noisy_in;
	 
	 parameter WIDTH = 20;
	 reg [WIDTH-1:0] count=0;
	 reg sync_0,sync_1;
	 reg stable_state=0;
	 
	 //synchrozing the inputs
	 always @(posedge clk)begin
	    if(rst)begin
		    sync_0 <= 0;
			 sync_1 <= 0;
		 end
		 else begin
		    sync_0 <= noisy_in;
			 sync_1 <= sync_0;
		 end
	 end
	 //debouncer logic using counter
	 always @(posedge clk)begin
	    if(rst)begin
		    count <= 0;
			 stable_state <= 0;
		 end
		 else if(stable_state != sync_1)begin
		     count <= count + 1;
			  if(count == {WIDTH{1'b1}})begin //counter reches its max value
			     stable_state <= sync_1;
				  count <= 0;
			  end
		 end
		 else begin
		    count <= 0;
		 end
	 end
	 //output
	 always @(posedge clk)begin
	    clean_out <= stable_state;
	 end
endmodule
