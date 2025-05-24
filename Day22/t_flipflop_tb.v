`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:06:18 05/24/2025
// Design Name:   t_flipflop
// Module Name:   t_flipflop_tb.v
// Project Name:  Day22
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: t_flipflop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_flipflop_tb_v;

	// Inputs
	reg t;
	reg clk;
	// Outputs
	wire q;
	// Instantiate the Unit Under Test (UUT)
	t_flipflop uut (
		.q(q), 
		.t(t), 
		.clk(clk)
	);
	 initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5ns
    end
	initial begin
		     // Monitor output
        $monitor("Time = %0dns, t = %b, q = %b", $time, t, q);
        // Initialize input
        t = 0;
		  #10;   
        //  toggle inputs
        t = 1; #10;
        t = 1; #10;
        t = 0; #10;
        t = 1; #10;
        t = 1; #10;
        t = 0; #10;

        // Finish simulation
        $finish;
    
	end
      
endmodule

