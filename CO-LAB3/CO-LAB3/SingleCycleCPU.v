module Pipe_CPU (
    input clk,
    input start,
    output signed [31:0] r [0:31]
);

// Pipeline registers between stages using Pipe_Reg module
wire [31:0] IF_ID_pc_plus_4, IF_ID_inst;
wire [31:0] ID_EX_pc_plus_4, ID_EX_readdata1, ID_EX_readdata2, ID_EX_imm;
wire [4:0] ID_EX_rs1, ID_EX_rs2, ID_EX_rd;
wire [3:0] ID_EX_ALU_Control;
wire ID_EX_ALUSrc, ID_EX_MemRead, ID_EX_MemWrite, ID_EX_RegWrite, ID_EX_MemToReg, ID_EX_Branch, ID_EX_Jump, ID_EX_Jalr;
wire [31:0] EX_MEM_ALU_result, EX_MEM_readdata2, EX_MEM_pc_branch;
wire [4:0] EX_MEM_rd;
wire EX_MEM_Zero, EX_MEM_MemRead, EX_MEM_MemWrite, EX_MEM_RegWrite, EX_MEM_MemToReg, EX_MEM_Branch;
wire [31:0] MEM_WB_ALU_result, MEM_WB_mem_data;
wire [4:0] MEM_WB_rd;
wire MEM_WB_RegWrite, MEM_WB_MemToReg;

// IF stage signals
wire [31:0] pc_in, pc_out, pc_plus_4;
wire [31:0] inst;

// ID stage signals
wire [31:0] imm;
wire [31:0] readdata1, readdata2;
wire [3:0] ALU_Control;
wire ALUSrc, MemRead, MemWrite, RegWrite, MemToReg, Branch, Jump, Jalr;
wire [1:0] ALUOp;

// EX stage signals
wire [31:0] ALU_in2, ALU_result, pc_branch;
wire ALU_zero;

// MEM stage signals
wire [31:0] mem_data;

// WB stage signals
wire [31:0] write_data;

// Control signals
assign pc_in = (Branch && EX_MEM_Zero) ? EX_MEM_pc_branch : pc_plus_4;

// IF stage
PC m_PC(
    .clk(clk),
    .rst(start),
    .pc_i(pc_in),
    .pc_o(pc_out)
);

Adder m_Adder_1(
    .a(pc_out),
    .b(32'd4),
    .sum(pc_plus_4)
);

InstructionMemory m_InstMem(
    .readAddr(pc_out),
    .inst(inst)
);

// IF/ID pipeline register
Pipe_Reg #(64) IF_ID (
    .clk(clk),
    .rst(start),
    .data_i({pc_plus_4, inst}),
    .data_o({IF_ID_pc_plus_4, IF_ID_inst})
);

// ID stage
Control m_Control(
    .opcode(IF_ID_inst[6:0]),
    .branch(Branch),
    .memRead(MemRead),
    .memtoReg(MemToReg),
    .ALUOp(ALUOp),
    .memWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .regWrite(RegWrite),
    .jump(Jump),
    .jalr(Jalr)
);

Register m_Register(
    .clk(clk),
    .rst(start),
    .regWrite(MEM_WB_RegWrite),
    .readReg1(IF_ID_inst[19:15]),
    .readReg2(IF_ID_inst[24:20]),
    .writeReg(MEM_WB_rd),
    .writeData(write_data),
    .readData1(readdata1),
    .readData2(readdata2)
);

ImmGen m_ImmGen(
    .inst(IF_ID_inst),
    .imm(imm)
);

ALUCtrl m_ALUCtrl(
    .ALUOp(ALUOp),
    .funct7(IF_ID_inst[30]),
    .funct3(IF_ID_inst[14:12]),
    .ALUCtl(ALU_Control)
);

// ID/EX pipeline register
Pipe_Reg #(155) ID_EX (
    .clk(clk),
    .rst(start),
    .data_i({IF_ID_pc_plus_4, readdata1, readdata2, imm, IF_ID_inst[19:15], IF_ID_inst[24:20], IF_ID_inst[11:7], 
             ALU_Control, ALUSrc, MemRead, MemWrite, RegWrite, MemToReg, Branch, Jump, Jalr}),
    .data_o({ID_EX_pc_plus_4, ID_EX_readdata1, ID_EX_readdata2, ID_EX_imm, ID_EX_rs1, ID_EX_rs2, ID_EX_rd, 
             ID_EX_ALU_Control, ID_EX_ALUSrc, ID_EX_MemRead, ID_EX_MemWrite, ID_EX_RegWrite, ID_EX_MemToReg, ID_EX_Branch, ID_EX_Jump, ID_EX_Jalr})
);

// EX stage
Mux2to1 #(.size(32)) m_Mux_ALU(
    .sel(ID_EX_ALUSrc),
    .s0(ID_EX_readdata2),
    .s1(ID_EX_imm),
    .out(ALU_in2)
);

ALU m_ALU(
    .ALUctl(ID_EX_ALU_Control),
    .A(ID_EX_readdata1),
    .B(ALU_in2),
    .ALUOut(ALU_result),
    .zero(ALU_zero)
);

Adder m_Adder_2(
    .a(ID_EX_pc_plus_4),
    .b(ID_EX_imm),
    .sum(pc_branch)
);

// EX/MEM pipeline register
Pipe_Reg #(107) EX_MEM (
    .clk(clk),
    .rst(start),
    .data_i({ALU_result, ID_EX_readdata2, pc_branch, ID_EX_rd, ALU_zero, ID_EX_MemRead, ID_EX_MemWrite, ID_EX_RegWrite, ID_EX_MemToReg, ID_EX_Branch}),
    .data_o({EX_MEM_ALU_result, EX_MEM_readdata2, EX_MEM_pc_branch, EX_MEM_rd, EX_MEM_Zero, EX_MEM_MemRead, EX_MEM_MemWrite, EX_MEM_RegWrite, EX_MEM_MemToReg, EX_MEM_Branch})
);

// MEM stage
DataMemory m_DataMemory(
    .rst(start),
    .clk(clk),
    .memWrite(EX_MEM_MemWrite),
    .memRead(EX_MEM_MemRead),
    .address(EX_MEM_ALU_result),
    .writeData(EX_MEM_readdata2),
    .readData(mem_data)
);

// MEM/WB pipeline register
Pipe_Reg #(71) MEM_WB (
    .clk(clk),
    .rst(start),
    .data_i({EX_MEM_ALU_result, mem_data, EX_MEM_rd, EX_MEM_RegWrite, EX_MEM_MemToReg}),
    .data_o({MEM_WB_ALU_result, MEM_WB_mem_data, MEM_WB_rd, MEM_WB_RegWrite, MEM_WB_MemToReg})
);

// WB stage
Mux2to1 #(.size(32)) m_Mux_WriteData(
    .sel(MEM_WB_MemToReg),
    .s0(MEM_WB_ALU_result),
    .s1(MEM_WB_mem_data),
    .out(write_data)
);

// Assign final register output for validation
assign r = m_Register.regs;

endmodule
