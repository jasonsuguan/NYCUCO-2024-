module SingleCycleCPU (
    input clk,
    input start,
    output signed [31:0] r [0:31]
);

// When input start is zero, cpu should reset
// When input start is high, cpu start running

// TODO: connect wire to realize SingleCycleCPU
// The following provides simple template,
// you can modify it as you wish except I/O pin and register module
wire signed [31:0] pc_in, pc_out,pc_plus_4, final_pc_in, updated_pc,addout_1, addout_2;
wire signed [31:0] im_out;
wire signed [31:0] imm_gen;
wire signed [31:0] imm_gen_shift;
wire signed [31:0] readdata1; // Data read from register file for operand 1
wire signed [31:0] readdata2; // Data read from register file for operand 2
wire signed [31:0] ALU_result;  
wire signed [3:0] ALU_Control;
wire signed [31:0] Mux_ALU;
wire signed ALU_zero, Branch, memread, memtoreg, memwrite, alusrc, regwrite, Jump, Jalr;
wire signed [1:0] aluop;
wire signed [31:0] data_memory_out, mux_write_data_out, final_write_data;
wire sell ;
assign sell = (Branch & ALU_zero);
wire [31:0] rs1_value;
assign rs1_value = readdata1;

wire [31:0] new_pc_value;
assign new_pc_value = (rs1_value + imm_gen) & ~32'b1;


PC m_PC(
    .clk(clk),
    .rst(start),
    .pc_i(updated_pc),
    .pc_o(pc_out)
);

Adder m_Adder_1(
    .a(pc_out),
    .b(32'd4),
    .sum(addout_1)
);

InstructionMemory m_InstMem(
    .readAddr(pc_out),
    .inst(im_out)
);

Control m_Control(
    .opcode(im_out[6:0]),
    .branch(Branch),
    .memRead(memread),
    .memtoReg(memtoreg),
    .ALUOp(aluop),
    .memWrite(memwrite),
    .ALUSrc(alusrc),
    .regWrite(regwrite),
    .jump(Jump),
    .jalr(Jalr)
);




// For Student: 
// Do not change the Register instance name!
// Or you will fail validation.

Register m_Register(
    .clk(clk),
    .rst(start),
    .regWrite(regwrite),
    .readReg1(im_out[19:15]),
    .readReg2(im_out[24:20]),
    .writeReg(im_out[11:7]),
    .writeData(final_write_data),
    .readData1(readdata1),
    .readData2(readdata2)
);

// ======= for validation ======= 
// == Dont change this section ==
assign r = m_Register.regs;
// ======= for vaildation =======

ImmGen m_ImmGen(
    .inst(im_out),
    .imm(imm_gen)
);

ShiftLeftOne m_ShiftLeftOne(
    .i(imm_gen),
    .o(imm_gen_shift)
);

Adder m_Adder_2(
    .a(pc_out),
    .b(imm_gen_shift),
    .sum(addout_2)
);


Mux2to1 #(.size(32)) m_Mux_PC(
    .sel(sell),
    .s0(addout_1),
    .s1(addout_2),
    .out(pc_in)
);

Mux2to1 #(.size(32)) m_Mux_ALU(
    .sel(alusrc),
    .s0(readdata2),
    .s1(imm_gen),
    .out(Mux_ALU)
);

Mux2to1 #(.size(32)) m_Mux_JAL_WriteData(
    .sel(Jump),
    .s0(mux_write_data_out),
    .s1(pc_plus_4),
    .out(final_write_data)
);

Mux2to1 #(.size(32)) m_Mux_Jump(
    .sel(Jump),
    .s0(pc_in),
    .s1(addout_2),
    .out(final_pc_in)
);

Mux2to1 #(.size(32)) m_Mux_JALR_PC(
    .sel(Jalr),
    .s0(final_pc_in),  
    .s1(new_pc_value),
    .out(updated_pc)
);


Adder m_Adder_JAL(
    .a(pc_out),
    .b(32'd4),
    .sum(pc_plus_4)
);


ALUCtrl m_ALUCtrl(
    .ALUOp(aluop),
    .funct7(im_out[30]),
    .funct3(im_out[14:12]),
    .ALUCtl(ALU_Control)
);

ALU m_ALU(
    .ALUctl(ALU_Control),
    .A(readdata1),
    .B(Mux_ALU),
    .ALUOut(ALU_result),
    .zero(ALU_zero)
);

DataMemory m_DataMemory(
    .rst(start),
    .clk(clk),
    .memWrite(memwrite),
    .memRead(memread),
    .address(ALU_result),
    .writeData(readdata2),
    .readData(data_memory_out)
);

Mux2to1 #(.size(32)) m_Mux_WriteData(
    .sel(memtoreg),
    .s0(ALU_result),
    .s1(data_memory_out),
    .out(mux_write_data_out)
);

endmodule
