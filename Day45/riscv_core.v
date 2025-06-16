module riscv_core(
    output wire [31:0] pc_out,
    input wire clk,
    input wire rst
);

    // Program Counter
    reg [31:0] PC;
    assign pc_out = PC;

    // Instruction Memory (simple ROM)
    reg [31:0] instr_mem [0:255];
    wire [31:0] instr;

    // Pipeline Registers
    reg [31:0] IF_ID_instr, IF_ID_pc;
    reg [31:0] ID_EX_pc, ID_EX_reg1, ID_EX_reg2;
    reg [4:0] ID_EX_rd;
    reg [31:0] EX_MEM_alu_out;
    reg [4:0] EX_MEM_rd;
    reg [31:0] MEM_WB_data;
    reg [4:0] MEM_WB_rd;

    // Register File
    reg [31:0] regs[0:31];

    wire [4:0] rs1 = IF_ID_instr[19:15];
    wire [4:0] rs2 = IF_ID_instr[24:20];
    wire [4:0] rd  = IF_ID_instr[11:7];

    wire [6:0] opcode = IF_ID_instr[6:0];
    wire [2:0] funct3 = IF_ID_instr[14:12];
    wire [6:0] funct7 = IF_ID_instr[31:25];
    wire [31:0] imm_i = {{20{IF_ID_instr[31]}}, IF_ID_instr[31:20]}; // Immediate for I-type

    // ALU
    reg [31:0] alu_out;
	 
    // Stage 1: Instruction Fetch (IF)
    assign instr = instr_mem[PC[9:2]];
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            PC <= 0;
        end else begin
            PC <= PC + 4;
        end
    end
    // Stage 2: Instruction Decode (ID)
    always @(posedge clk) begin
        IF_ID_instr <= instr;
        IF_ID_pc <= PC;
    end
    always @(posedge clk) begin
        ID_EX_pc <= IF_ID_pc;
        ID_EX_reg1 <= regs[rs1];
        ID_EX_reg2 <= regs[rs2];
        ID_EX_rd <= rd;
    end
    // Stage 3: Execute (EX)
    always @(posedge clk) begin
        case (funct3)
            3'b000: alu_out <= ID_EX_reg1 + imm_i; 
            default: alu_out <= 0;
        endcase
        EX_MEM_alu_out <= alu_out;
        EX_MEM_rd <= ID_EX_rd;
    end
    // Stage 4: Memory Access (MEM)
    always @(posedge clk) begin
        MEM_WB_data <= EX_MEM_alu_out;
        MEM_WB_rd <= EX_MEM_rd;
    end
    // Stage 5: Write Back (WB)
    always @(posedge clk) begin
        if (MEM_WB_rd != 0) begin
            regs[MEM_WB_rd] <= MEM_WB_data;
        end
    end
    // Initialize
    initial begin
        PC = 0;
        regs[0] = 0;
        regs[1] = 5;
        regs[2] = 10;
        instr_mem[0] = 32'b000000000010_00001_000_00011_0010011; // addi x3, x1, 2
    end
endmodule
