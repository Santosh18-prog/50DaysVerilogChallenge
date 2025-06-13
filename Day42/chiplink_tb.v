`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:52:03 06/13/2025
// Design Name:   chiplink_master
// Module Name:   chiplink_tb.v
// Project Name:  Day42
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: chiplink_master
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module chiplink_tb;

    reg clk, rst, start, rw;
    reg [7:0] addr, data_in;
    wire [7:0] tx;
    wire done;
    wire [7:0] mem_out;
    wire valid;

    // Instantiate Master
    chiplink_master master (
        .clk(clk),
        .rst(rst),
        .start(start),
        .rw(rw),
        .addr(addr),
        .data_in(data_in),
        .tx(tx),
        .done(done)
    );

    // Instantiate Slave
    chiplink_slave slave (
        .clk(clk),
        .rst(rst),
        .rx(tx),
        .mem_out(mem_out),
        .valid(valid)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        start = 0;
        rw = 0;
        addr = 8'd0;
        data_in = 8'd0;
        #20;

        rst = 0;
        #20;

        // Write operation (write data to slave)
        rw = 0; addr = 8'd5; data_in = 8'd123;
        start = 1; #10; start = 0;
        @(posedge done);
        #20;

        // Read operation (read from addr)
        rw = 1; addr = 8'd5;
        start = 1; #10; start = 0;
        @(posedge done);
        #10;

        if (valid)
            $display("Read from addr %d: mem_out = %d", addr, mem_out);
        else
            $display("Read failed");

        #20;
        $finish;
    end

endmodule
