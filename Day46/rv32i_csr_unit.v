`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:07:19 06/17/2025 
// Design Name: 
// Module Name:    rv32i_csr_unit 
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

module rv32i_csr_unit (
    output reg [31:0] csr_rdata,
    input wire clk,
    input wire rst,
    input wire csr_en,
    input wire [11:0] csr_addr,
    input wire [31:0] csr_wdata,
    input wire [2:0]  csr_cmd   // 000: NOP, 001: WRITE, 010: SET, 011: CLEAR, 100: READ    
);

    // Define a few standard CSRs
    reg [31:0] mstatus;
    reg [31:0] mepc;
    reg [31:0] mcause;
    reg [31:0] mtvec;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            mstatus <= 32'd0;
            mepc    <= 32'd0;
            mcause  <= 32'd0;
            mtvec   <= 32'd0;
            csr_rdata <= 32'd0;
        end else if (csr_en) begin
            case (csr_addr)
                12'h300: begin // mstatus
                    case (csr_cmd)
                        3'b001: mstatus <= csr_wdata;
                        3'b010: mstatus <= mstatus | csr_wdata;
                        3'b011: mstatus <= mstatus & ~csr_wdata;
                        3'b100: csr_rdata <= mstatus;
                        default: ;
                    endcase
                end
                12'h305: begin // mtvec
                    case (csr_cmd)
                        3'b001: mtvec <= csr_wdata;
                        3'b010: mtvec <= mtvec | csr_wdata;
                        3'b011: mtvec <= mtvec & ~csr_wdata;
                        3'b100: csr_rdata <= mtvec;
                        default: ;
                    endcase
                end
                12'h341: begin // mepc
                    case (csr_cmd)
                        3'b001: mepc <= csr_wdata;
                        3'b010: mepc <= mepc | csr_wdata;
                        3'b011: mepc <= mepc & ~csr_wdata;
                        3'b100: csr_rdata <= mepc;
                        default: ;
                    endcase
                end
                12'h342: begin // mcause
                    case (csr_cmd)
                        3'b001: mcause <= csr_wdata;
                        3'b010: mcause <= mcause | csr_wdata;
                        3'b011: mcause <= mcause & ~csr_wdata;
                        3'b100: csr_rdata <= mcause;
                        default: ;
                    endcase
                end
                default: csr_rdata <= 32'hDEADBEEF; // unknown CSR
            endcase
        end
    end
endmodule

