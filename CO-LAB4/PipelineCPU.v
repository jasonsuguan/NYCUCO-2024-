module PipelineCPU (
    input clk,
    input start,
    output signed [31:0] r [0:31]
);

// Pipeline registers between stages using Pipe_Reg module
wire [31:0] IF_ID_pc_out, IF_ID_inst,IF_ID_pc_4,readdata1, readdata2;
wire [31:0] ID_EX_pc_out, ID_EX_readdata1, ID_EX_readdata2, ID_EX_imm,ID_EX_pc_4,ID_EX_imm_shifted;
wire [4:0] ID_EX_rs1, ID_EX_rs2, ID_EX_rd;
wire [3:0] ID_EX_ALU_Control;
wire ID_EX_ALUSrc, ID_EX_MemRead, ID_EX_MemWrite, ID_EX_RegWrite, ID_EX_MemToReg, ID_EX_Branch, ID_EX_jump, ID_EX_jalr;
wire [1:0] ID_EX_ALUOp;
wire [31:0] EX_MEM_ALU_result, EX_MEM_pc_4, EX_MEM_B_out, Mux_B_out;
wire [4:0] EX_MEM_rd;
wire EX_MEM_MemRead, EX_MEM_MemWrite, EX_MEM_RegWrite, EX_MEM_MemToReg,EX_MEM_jump,EX_MEM_jalr;
wire [31:0] MEM_WB_ALU_result, MEM_WB_mem_data,MEM_WB_pc_4,write_mux_data;
wire [4:0] MEM_WB_rd;
wire MEM_WB_RegWrite, MEM_WB_MemToReg, MEM_WB_jump, MEM_WB_jalr;
// Forwarding signals
wire [1:0] forwardA, forwardB;
wire [31:0] ALU_in1, ALU_in2;

// Hazard detection signals
wire  PC_write, IF_ID_write, IF_ID_flush, ID_EX_flush;

// IF stage signals
wire [31:0] pc_out, pc_plus_4,mux_pc_out,mux_mux_pc_out;
wire [31:0] inst;

// ID stage signals
wire [31:0] imm;
wire [3:0] ALU_Control;
wire [2:0] ID_EX_inst1412;
wire ALUSrc, MemRead, MemWrite, RegWrite, MemToReg, Branch, Jump, Jalr;
wire [1:0] ALUOp;
wire ID_EX_inst30;

// EX stage signals
wire [31:0] ALU_result, pc_branch;
wire ALU_zero;

// MEM stage signals
wire [31:0] mem_data;


// WB stage signals
wire [31:0] write_data;

//additional
wire jump_branch;
wire branch_zero;
wire ID_EX_j;
wire MEM_WB_j;


// IF stage

PC m_PC(
    .clk(clk),
    .rst(start),
    .pc_write(PC_write),
    .pc_i(mux_mux_pc_out),
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

IFIDreg #(96) IFIDreg (
    .clk(clk),
    .flush(IF_ID_flush),
    .write(IF_ID_write),
    .data_i({pc_plus_4, pc_out, inst}),
    .data_o({IF_ID_pc_4, IF_ID_pc_out,IF_ID_inst})
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

// Assign final register output for validation
assign r = m_Register.regs;

ImmGen m_ImmGen(
    .inst(IF_ID_inst[31:0]),
    .imm(imm)
);

// ID/EX pipeline register
IDEXreg #(189) IDEXreg (
    .clk(clk),
    .flush(ID_EX_flush),
    .data_i({IF_ID_pc_4, IF_ID_pc_out, readdata1, readdata2, imm, IF_ID_inst[19:15], IF_ID_inst[24:20], IF_ID_inst[11:7], IF_ID_inst[14:12], IF_ID_inst[30],
             ALUOp, ALUSrc, MemRead, MemWrite, RegWrite, MemToReg, Branch, Jump, Jalr}),
    .data_o({ID_EX_pc_4, ID_EX_pc_out, ID_EX_readdata1, ID_EX_readdata2, ID_EX_imm, ID_EX_rs1, ID_EX_rs2, ID_EX_rd, ID_EX_inst1412, ID_EX_inst30,
             ID_EX_ALUOp, ID_EX_ALUSrc, ID_EX_MemRead, ID_EX_MemWrite, ID_EX_RegWrite, ID_EX_MemToReg, ID_EX_Branch, ID_EX_jump, ID_EX_jalr})
);

// EX stage
ShiftLeftOne m_ShiftLeftOne(
    .i(ID_EX_imm),
    .o(ID_EX_imm_shifted)
);

Adder m_Adder_2(
    .a(ID_EX_pc_out),
    .b(ID_EX_imm_shifted),
    .sum(pc_branch)
);

and u_and_branch(
    branch_zero, 
    ID_EX_Branch, 
    ALU_zero
);

or u_or_jump_branch(
    jump_branch, 
    ID_EX_j, 
    branch_zero
);

or u_or_ID_EX_j(
    ID_EX_j,
    ID_EX_jump, 
    ID_EX_jalr
);

or u_or_MEM_WB_j(
    MEM_WB_j, 
    MEM_WB_jalr, 
    MEM_WB_jump
);

Mux2to1 #(.size(32)) m_Mux_PC_1 (
    .sel(jump_branch),
    .s0(pc_plus_4),
    .s1(pc_branch),
    .out(mux_pc_out)
);

Mux2to1 #(.size(32)) m_Mux_PC_2(
    .sel(ID_EX_jalr),
    .s0(mux_pc_out),
    .s1(ALU_result),
    .out(mux_mux_pc_out)
);


ALUCtrl m_ALUCtrl(
    .ALUOp(ID_EX_ALUOp),
    .funct7(ID_EX_inst30),
    .funct3(ID_EX_inst1412),
    .ALUCtl(ALU_Control)
);

Mux3to1 #(.size(32)) m_ForwardA(
    .sel(forwardA),
    .s0(ID_EX_readdata1),
    .s1(write_data),
    .s2(EX_MEM_ALU_result),
    .out(ALU_in1)
);

Mux3to1 #(.size(32)) m_ForwardB(
    .sel(forwardB),
    .s0(ID_EX_readdata2),
    .s1(write_data),
    .s2(EX_MEM_ALU_result),  
    .out(Mux_B_out)
);

Mux2to1 #(.size(32)) m_Mux_Mux_ForwardB(
    .sel(ID_EX_ALUSrc),
    .s0(Mux_B_out),
    .s1(ID_EX_imm),
    .out(ALU_in2)
);

ALU m_ALU(
    .ALUctl(ALU_Control),
    .A(ALU_in1),
    .B(ALU_in2),
    .ALUOut(ALU_result),
    .zero(ALU_zero)
);

// EX/MEM pipeline register
Pipe_Reg #(107) EX_MEM (
    .clk(clk),
    .rst(start),
    .data_i({ALU_result,ID_EX_pc_4, Mux_B_out, ID_EX_rd, ID_EX_MemRead, ID_EX_MemWrite, ID_EX_RegWrite, ID_EX_MemToReg, ID_EX_jump, ID_EX_jalr}),
    .data_o({EX_MEM_ALU_result,EX_MEM_pc_4, EX_MEM_B_out, EX_MEM_rd, EX_MEM_MemRead, EX_MEM_MemWrite, EX_MEM_RegWrite, EX_MEM_MemToReg, EX_MEM_jump, EX_MEM_jalr})
);

// MEM stage
DataMemory m_DataMemory(
    .rst(start),
    .clk(clk),
    .memWrite(EX_MEM_MemWrite),
    .memRead(EX_MEM_MemRead),
    .address(EX_MEM_ALU_result),
    .writeData(EX_MEM_B_out),
    .readData(mem_data)
);

// MEM/WB pipeline register
Pipe_Reg #(105) MEM_WB (
    .clk(clk),
    .rst(start),
    .data_i({EX_MEM_pc_4, EX_MEM_ALU_result, mem_data, EX_MEM_rd, EX_MEM_RegWrite, EX_MEM_MemToReg,EX_MEM_jump,EX_MEM_jalr}),
    .data_o({MEM_WB_pc_4, MEM_WB_ALU_result, MEM_WB_mem_data, MEM_WB_rd, MEM_WB_RegWrite, MEM_WB_MemToReg,MEM_WB_jump,MEM_WB_jalr})
);

// WB stage
Mux2to1 #(.size(32)) m_Mux_WriteData(
    .sel(MEM_WB_MemToReg),
    .s0(MEM_WB_ALU_result),
    .s1(MEM_WB_mem_data),
    .out(write_mux_data)
);

Mux2to1 #(.size(32)) m_Mux_Mux_WriteData(
    .sel(MEM_WB_j),
    .s0(write_mux_data),
    .s1(MEM_WB_pc_4),
    .out(write_data)
);

// Hazard Detection Unit
HazardDetectionUnit m_HazardDetectionUnit (
    .ID_EX_MemRead(ID_EX_MemRead),
    .ID_EX_RegisterRt(ID_EX_rd),
    .IF_ID_RegisterRs(IF_ID_inst[19:15]),
    .IF_ID_RegisterRt(IF_ID_inst[24:20]),
    .jump_and_branch(jump_branch),
    .pc_write(PC_write),
    .IF_ID_write(IF_ID_write),
    .IF_ID_flush(IF_ID_flush),
    .ID_EX_flush(ID_EX_flush)
);

// Forwarding Unit
ForwardingUnit m_ForwardingUnit (
    .EX_MEM_RegWrite(EX_MEM_RegWrite),
    .MEM_WB_RegWrite(MEM_WB_RegWrite),
    .EX_MEM_RegisterRd(EX_MEM_rd),
    .MEM_WB_RegisterRd(MEM_WB_rd),
    .ID_EX_RegisterRs(ID_EX_rs1),
    .ID_EX_RegisterRt(ID_EX_rs2),
    .forwardA(forwardA),
    .forwardB(forwardB)
);

endmodule
