`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:30:33 05/11/2025
// Design Name:   DEMUX1_4
// Module Name:   DEMUX1_4_tb.v
// Project Name:  Day13
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DEMUX1_4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DEMUX1_4_tb_v;

	// Inputs
	reg din;
	reg [1:0] sel;

	// Outputs
	wire [3:0] dout;

	// Instantiate the Unit Under Test (UUT)
	DEMUX1_4 uut (
		.dout(dout), 
		.din(din), 
		.sel(sel)
	);

	initial begin
		// Initialize Inputs
		din = 0;
		sel = 0;

		  din = 1; sel = 2'b00; #10;
        din = 0; sel = 2'b00; #10;
        din = 1; sel = 2'b01; #10;
        din = 0; sel = 2'b01; #10;
        din = 1; sel = 2'b10; #10;
        din = 0; sel = 2'b10; #10;
        din = 1; sel = 2'b11; #10;
        din = 0; sel = 2'b11; #10;

	end
	initial $monitor($time ,"dout=%b din=%b sel=%b",dout,din,sel);
	initial #90 $finish;
      
endmodule

