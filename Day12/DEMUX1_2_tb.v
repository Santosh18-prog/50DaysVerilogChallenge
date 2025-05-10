`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:20:17 05/10/2025
// Design Name:   DEMUX1_2
// Module Name:   DEMUX1_2_tb.v
// Project Name:  Day12
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DEMUX1_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DEMUX1_2_tb_v;

	// Inputs
	reg din;
	reg sel;

	// Outputs
	wire [1:0] y;

	// Instantiate the Unit Under Test (UUT)
	DEMUX1_2 uut (
		.y(y), 
		.din(din), 
		.sel(sel)
	);

	initial begin
		// Initialize Inputs
		din = 0;
		sel = 0;
		
		#2 din = 0; sel = 1;
		#2 din = 1; sel = 0;
      #2 din = 1; sel = 1;


	end
	
	initial $monitor($time,"y=%b din=%b sel=%b",y,din,sel);
	initial #8 $finish;
      
endmodule

