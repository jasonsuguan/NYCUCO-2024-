// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VSingleCycleCPU__Syms.h"


VL_ATTR_COLD void VSingleCycleCPU___024root__trace_init_sub__TOP__0(VSingleCycleCPU___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VSingleCycleCPU__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSingleCycleCPU___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+65,"clk", false,-1);
    tracep->declBit(c+66,"start", false,-1);
    for (int i = 0; i < 32; ++i) {
        tracep->declBus(c+67+i*1,"r", true,(i+0), 31,0);
    }
    tracep->pushNamePrefix("SingleCycleCPU ");
    tracep->declBit(c+65,"clk", false,-1);
    tracep->declBit(c+66,"start", false,-1);
    for (int i = 0; i < 32; ++i) {
        tracep->declBus(c+67+i*1,"r", true,(i+0), 31,0);
    }
    tracep->declBus(c+55,"pc_in", false,-1, 31,0);
    tracep->declBus(c+33,"pc_out", false,-1, 31,0);
    tracep->declBus(c+34,"pc_plus_4", false,-1, 31,0);
    tracep->declBus(c+56,"final_pc_in", false,-1, 31,0);
    tracep->declBus(c+57,"updated_pc", false,-1, 31,0);
    tracep->declBus(c+34,"addout_1", false,-1, 31,0);
    tracep->declBus(c+35,"addout_2", false,-1, 31,0);
    tracep->declBus(c+36,"im_out", false,-1, 31,0);
    tracep->declBus(c+37,"imm_gen", false,-1, 31,0);
    tracep->declBus(c+38,"imm_gen_shift", false,-1, 31,0);
    tracep->declBus(c+60,"readdata1", false,-1, 31,0);
    tracep->declBus(c+61,"readdata2", false,-1, 31,0);
    tracep->declBus(c+62,"ALU_result", false,-1, 31,0);
    tracep->declBus(c+39,"ALU_Control", false,-1, 3,0);
    tracep->declBus(c+63,"Mux_ALU", false,-1, 31,0);
    tracep->declBit(c+64,"ALU_zero", false,-1);
    tracep->declBit(c+40,"Branch", false,-1);
    tracep->declBit(c+41,"memread", false,-1);
    tracep->declBit(c+42,"memtoreg", false,-1);
    tracep->declBit(c+43,"memwrite", false,-1);
    tracep->declBit(c+44,"alusrc", false,-1);
    tracep->declBit(c+45,"regwrite", false,-1);
    tracep->declBit(c+46,"Jump", false,-1);
    tracep->declBit(c+47,"Jalr", false,-1);
    tracep->declBus(c+48,"aluop", false,-1, 1,0);
    tracep->declBus(c+99,"data_memory_out", false,-1, 31,0);
    tracep->declBus(c+100,"mux_write_data_out", false,-1, 31,0);
    tracep->declBus(c+101,"final_write_data", false,-1, 31,0);
    tracep->declBit(c+58,"sell", false,-1);
    tracep->declBus(c+60,"rs1_value", false,-1, 31,0);
    tracep->declBus(c+59,"new_pc_value", false,-1, 31,0);
    tracep->pushNamePrefix("m_ALU ");
    tracep->declBus(c+39,"ALUctl", false,-1, 3,0);
    tracep->declBus(c+60,"A", false,-1, 31,0);
    tracep->declBus(c+63,"B", false,-1, 31,0);
    tracep->declBus(c+62,"ALUOut", false,-1, 31,0);
    tracep->declBit(c+64,"zero", false,-1);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_ALUCtrl ");
    tracep->declBus(c+48,"ALUOp", false,-1, 1,0);
    tracep->declBit(c+49,"funct7", false,-1);
    tracep->declBus(c+50,"funct3", false,-1, 2,0);
    tracep->declBus(c+39,"ALUCtl", false,-1, 3,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_Adder_1 ");
    tracep->declBus(c+33,"a", false,-1, 31,0);
    tracep->declBus(c+102,"b", false,-1, 31,0);
    tracep->declBus(c+34,"sum", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_Adder_2 ");
    tracep->declBus(c+33,"a", false,-1, 31,0);
    tracep->declBus(c+38,"b", false,-1, 31,0);
    tracep->declBus(c+35,"sum", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_Adder_JAL ");
    tracep->declBus(c+33,"a", false,-1, 31,0);
    tracep->declBus(c+102,"b", false,-1, 31,0);
    tracep->declBus(c+34,"sum", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_Control ");
    tracep->declBus(c+51,"opcode", false,-1, 6,0);
    tracep->declBit(c+40,"branch", false,-1);
    tracep->declBit(c+41,"memRead", false,-1);
    tracep->declBit(c+42,"memtoReg", false,-1);
    tracep->declBus(c+48,"ALUOp", false,-1, 1,0);
    tracep->declBit(c+43,"memWrite", false,-1);
    tracep->declBit(c+44,"ALUSrc", false,-1);
    tracep->declBit(c+45,"regWrite", false,-1);
    tracep->declBit(c+46,"jump", false,-1);
    tracep->declBit(c+47,"jalr", false,-1);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_DataMemory ");
    tracep->declBit(c+66,"rst", false,-1);
    tracep->declBit(c+65,"clk", false,-1);
    tracep->declBit(c+43,"memWrite", false,-1);
    tracep->declBit(c+41,"memRead", false,-1);
    tracep->declBus(c+62,"address", false,-1, 31,0);
    tracep->declBus(c+61,"writeData", false,-1, 31,0);
    tracep->declBus(c+99,"readData", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_ImmGen ");
    tracep->declBus(c+36,"inst", false,-1, 31,0);
    tracep->declBus(c+37,"imm", false,-1, 31,0);
    tracep->declBus(c+51,"opcode", false,-1, 6,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_InstMem ");
    tracep->declBus(c+33,"readAddr", false,-1, 31,0);
    tracep->declBus(c+36,"inst", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_Mux_ALU ");
    tracep->declBus(c+103,"size", false,-1, 31,0);
    tracep->declBit(c+44,"sel", false,-1);
    tracep->declBus(c+61,"s0", false,-1, 31,0);
    tracep->declBus(c+37,"s1", false,-1, 31,0);
    tracep->declBus(c+63,"out", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_Mux_JALR_PC ");
    tracep->declBus(c+103,"size", false,-1, 31,0);
    tracep->declBit(c+47,"sel", false,-1);
    tracep->declBus(c+56,"s0", false,-1, 31,0);
    tracep->declBus(c+59,"s1", false,-1, 31,0);
    tracep->declBus(c+57,"out", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_Mux_JAL_WriteData ");
    tracep->declBus(c+103,"size", false,-1, 31,0);
    tracep->declBit(c+46,"sel", false,-1);
    tracep->declBus(c+100,"s0", false,-1, 31,0);
    tracep->declBus(c+34,"s1", false,-1, 31,0);
    tracep->declBus(c+101,"out", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_Mux_Jump ");
    tracep->declBus(c+103,"size", false,-1, 31,0);
    tracep->declBit(c+46,"sel", false,-1);
    tracep->declBus(c+55,"s0", false,-1, 31,0);
    tracep->declBus(c+35,"s1", false,-1, 31,0);
    tracep->declBus(c+56,"out", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_Mux_PC ");
    tracep->declBus(c+103,"size", false,-1, 31,0);
    tracep->declBit(c+58,"sel", false,-1);
    tracep->declBus(c+34,"s0", false,-1, 31,0);
    tracep->declBus(c+35,"s1", false,-1, 31,0);
    tracep->declBus(c+55,"out", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_Mux_WriteData ");
    tracep->declBus(c+103,"size", false,-1, 31,0);
    tracep->declBit(c+42,"sel", false,-1);
    tracep->declBus(c+62,"s0", false,-1, 31,0);
    tracep->declBus(c+99,"s1", false,-1, 31,0);
    tracep->declBus(c+100,"out", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_PC ");
    tracep->declBit(c+65,"clk", false,-1);
    tracep->declBit(c+66,"rst", false,-1);
    tracep->declBus(c+57,"pc_i", false,-1, 31,0);
    tracep->declBus(c+33,"pc_o", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_Register ");
    tracep->declBit(c+65,"clk", false,-1);
    tracep->declBit(c+66,"rst", false,-1);
    tracep->declBit(c+45,"regWrite", false,-1);
    tracep->declBus(c+52,"readReg1", false,-1, 4,0);
    tracep->declBus(c+53,"readReg2", false,-1, 4,0);
    tracep->declBus(c+54,"writeReg", false,-1, 4,0);
    tracep->declBus(c+101,"writeData", false,-1, 31,0);
    tracep->declBus(c+60,"readData1", false,-1, 31,0);
    tracep->declBus(c+61,"readData2", false,-1, 31,0);
    for (int i = 0; i < 32; ++i) {
        tracep->declBus(c+1+i*1,"regs", true,(i+0), 31,0);
    }
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("m_ShiftLeftOne ");
    tracep->declBus(c+37,"i", false,-1, 31,0);
    tracep->declBus(c+38,"o", false,-1, 31,0);
    tracep->popNamePrefix(2);
}

VL_ATTR_COLD void VSingleCycleCPU___024root__trace_init_top(VSingleCycleCPU___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VSingleCycleCPU__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSingleCycleCPU___024root__trace_init_top\n"); );
    // Body
    VSingleCycleCPU___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void VSingleCycleCPU___024root__trace_full_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VSingleCycleCPU___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VSingleCycleCPU___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void VSingleCycleCPU___024root__trace_register(VSingleCycleCPU___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VSingleCycleCPU__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSingleCycleCPU___024root__trace_register\n"); );
    // Body
    tracep->addFullCb(&VSingleCycleCPU___024root__trace_full_top_0, vlSelf);
    tracep->addChgCb(&VSingleCycleCPU___024root__trace_chg_top_0, vlSelf);
    tracep->addCleanupCb(&VSingleCycleCPU___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void VSingleCycleCPU___024root__trace_full_sub_0(VSingleCycleCPU___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void VSingleCycleCPU___024root__trace_full_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSingleCycleCPU___024root__trace_full_top_0\n"); );
    // Init
    VSingleCycleCPU___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VSingleCycleCPU___024root*>(voidSelf);
    VSingleCycleCPU__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VSingleCycleCPU___024root__trace_full_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void VSingleCycleCPU___024root__trace_full_sub_0(VSingleCycleCPU___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    VSingleCycleCPU__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSingleCycleCPU___024root__trace_full_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullIData(oldp+1,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[0]),32);
    bufp->fullIData(oldp+2,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[1]),32);
    bufp->fullIData(oldp+3,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[2]),32);
    bufp->fullIData(oldp+4,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[3]),32);
    bufp->fullIData(oldp+5,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[4]),32);
    bufp->fullIData(oldp+6,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[5]),32);
    bufp->fullIData(oldp+7,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[6]),32);
    bufp->fullIData(oldp+8,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[7]),32);
    bufp->fullIData(oldp+9,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[8]),32);
    bufp->fullIData(oldp+10,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[9]),32);
    bufp->fullIData(oldp+11,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[10]),32);
    bufp->fullIData(oldp+12,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[11]),32);
    bufp->fullIData(oldp+13,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[12]),32);
    bufp->fullIData(oldp+14,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[13]),32);
    bufp->fullIData(oldp+15,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[14]),32);
    bufp->fullIData(oldp+16,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[15]),32);
    bufp->fullIData(oldp+17,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[16]),32);
    bufp->fullIData(oldp+18,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[17]),32);
    bufp->fullIData(oldp+19,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[18]),32);
    bufp->fullIData(oldp+20,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[19]),32);
    bufp->fullIData(oldp+21,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[20]),32);
    bufp->fullIData(oldp+22,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[21]),32);
    bufp->fullIData(oldp+23,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[22]),32);
    bufp->fullIData(oldp+24,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[23]),32);
    bufp->fullIData(oldp+25,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[24]),32);
    bufp->fullIData(oldp+26,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[25]),32);
    bufp->fullIData(oldp+27,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[26]),32);
    bufp->fullIData(oldp+28,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[27]),32);
    bufp->fullIData(oldp+29,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[28]),32);
    bufp->fullIData(oldp+30,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[29]),32);
    bufp->fullIData(oldp+31,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[30]),32);
    bufp->fullIData(oldp+32,(vlSelf->SingleCycleCPU__DOT__m_Register__DOT__regs[31]),32);
    bufp->fullIData(oldp+33,(vlSelf->SingleCycleCPU__DOT__pc_out),32);
    bufp->fullIData(oldp+34,(((IData)(4U) + vlSelf->SingleCycleCPU__DOT__pc_out)),32);
    bufp->fullIData(oldp+35,(vlSelf->SingleCycleCPU__DOT__addout_2),32);
    bufp->fullIData(oldp+36,(vlSelf->SingleCycleCPU__DOT__im_out),32);
    bufp->fullIData(oldp+37,(vlSelf->SingleCycleCPU__DOT__imm_gen),32);
    bufp->fullIData(oldp+38,((vlSelf->SingleCycleCPU__DOT__imm_gen 
                              << 1U)),32);
    bufp->fullCData(oldp+39,(vlSelf->SingleCycleCPU__DOT__ALU_Control),4);
    bufp->fullBit(oldp+40,(vlSelf->SingleCycleCPU__DOT__Branch));
    bufp->fullBit(oldp+41,(vlSelf->SingleCycleCPU__DOT__memread));
    bufp->fullBit(oldp+42,(vlSelf->SingleCycleCPU__DOT__memtoreg));
    bufp->fullBit(oldp+43,(vlSelf->SingleCycleCPU__DOT__memwrite));
    bufp->fullBit(oldp+44,(vlSelf->SingleCycleCPU__DOT__alusrc));
    bufp->fullBit(oldp+45,(vlSelf->SingleCycleCPU__DOT__regwrite));
    bufp->fullBit(oldp+46,(vlSelf->SingleCycleCPU__DOT__Jump));
    bufp->fullBit(oldp+47,(vlSelf->SingleCycleCPU__DOT__Jalr));
    bufp->fullCData(oldp+48,(vlSelf->SingleCycleCPU__DOT__aluop),2);
    bufp->fullBit(oldp+49,(((0x80U > vlSelf->SingleCycleCPU__DOT__pc_out) 
                            & ((IData)(vlSelf->__VdfgTmp_hb31ff53b__0) 
                               >> 6U))));
    bufp->fullCData(oldp+50,(((0x80U <= vlSelf->SingleCycleCPU__DOT__pc_out)
                               ? 0U : (7U & ((IData)(vlSelf->__VdfgTmp_he9cf927d__0) 
                                             >> 4U)))),3);
    bufp->fullCData(oldp+51,(vlSelf->SingleCycleCPU__DOT____Vcellinp__m_Control__opcode),7);
    bufp->fullCData(oldp+52,(((0x80U <= vlSelf->SingleCycleCPU__DOT__pc_out)
                               ? 0U : (0x1fU & (vlSelf->__VdfgTmp_hb826ee08__0 
                                                >> 0xfU)))),5);
    bufp->fullCData(oldp+53,(((0x80U <= vlSelf->SingleCycleCPU__DOT__pc_out)
                               ? 0U : (0x1fU & (vlSelf->__VdfgTmp_h5ae09f70__0 
                                                >> 0x14U)))),5);
    bufp->fullCData(oldp+54,(vlSelf->SingleCycleCPU__DOT____Vcellinp__m_Register__writeReg),5);
    bufp->fullIData(oldp+55,((((IData)(vlSelf->SingleCycleCPU__DOT__ALU_zero) 
                               & (IData)(vlSelf->SingleCycleCPU__DOT__Branch))
                               ? vlSelf->SingleCycleCPU__DOT__addout_2
                               : ((IData)(4U) + vlSelf->SingleCycleCPU__DOT__pc_out))),32);
    bufp->fullIData(oldp+56,(((IData)(vlSelf->SingleCycleCPU__DOT__Jump)
                               ? vlSelf->SingleCycleCPU__DOT__addout_2
                               : (((IData)(vlSelf->SingleCycleCPU__DOT__ALU_zero) 
                                   & (IData)(vlSelf->SingleCycleCPU__DOT__Branch))
                                   ? vlSelf->SingleCycleCPU__DOT__addout_2
                                   : ((IData)(4U) + vlSelf->SingleCycleCPU__DOT__pc_out)))),32);
    bufp->fullIData(oldp+57,(((IData)(vlSelf->SingleCycleCPU__DOT__Jalr)
                               ? (0xfffffffeU & (vlSelf->SingleCycleCPU__DOT__imm_gen 
                                                 + vlSelf->SingleCycleCPU__DOT__readdata1))
                               : ((IData)(vlSelf->SingleCycleCPU__DOT__Jump)
                                   ? vlSelf->SingleCycleCPU__DOT__addout_2
                                   : (((IData)(vlSelf->SingleCycleCPU__DOT__ALU_zero) 
                                       & (IData)(vlSelf->SingleCycleCPU__DOT__Branch))
                                       ? vlSelf->SingleCycleCPU__DOT__addout_2
                                       : ((IData)(4U) 
                                          + vlSelf->SingleCycleCPU__DOT__pc_out))))),32);
    bufp->fullBit(oldp+58,(((IData)(vlSelf->SingleCycleCPU__DOT__ALU_zero) 
                            & (IData)(vlSelf->SingleCycleCPU__DOT__Branch))));
    bufp->fullIData(oldp+59,((0xfffffffeU & (vlSelf->SingleCycleCPU__DOT__imm_gen 
                                             + vlSelf->SingleCycleCPU__DOT__readdata1))),32);
    bufp->fullIData(oldp+60,(vlSelf->SingleCycleCPU__DOT__readdata1),32);
    bufp->fullIData(oldp+61,(vlSelf->SingleCycleCPU__DOT__readdata2),32);
    bufp->fullIData(oldp+62,(vlSelf->SingleCycleCPU__DOT__ALU_result),32);
    bufp->fullIData(oldp+63,(vlSelf->SingleCycleCPU__DOT__Mux_ALU),32);
    bufp->fullBit(oldp+64,(vlSelf->SingleCycleCPU__DOT__ALU_zero));
    bufp->fullBit(oldp+65,(vlSelf->clk));
    bufp->fullBit(oldp+66,(vlSelf->start));
    bufp->fullIData(oldp+67,(vlSelf->r[0]),32);
    bufp->fullIData(oldp+68,(vlSelf->r[1]),32);
    bufp->fullIData(oldp+69,(vlSelf->r[2]),32);
    bufp->fullIData(oldp+70,(vlSelf->r[3]),32);
    bufp->fullIData(oldp+71,(vlSelf->r[4]),32);
    bufp->fullIData(oldp+72,(vlSelf->r[5]),32);
    bufp->fullIData(oldp+73,(vlSelf->r[6]),32);
    bufp->fullIData(oldp+74,(vlSelf->r[7]),32);
    bufp->fullIData(oldp+75,(vlSelf->r[8]),32);
    bufp->fullIData(oldp+76,(vlSelf->r[9]),32);
    bufp->fullIData(oldp+77,(vlSelf->r[10]),32);
    bufp->fullIData(oldp+78,(vlSelf->r[11]),32);
    bufp->fullIData(oldp+79,(vlSelf->r[12]),32);
    bufp->fullIData(oldp+80,(vlSelf->r[13]),32);
    bufp->fullIData(oldp+81,(vlSelf->r[14]),32);
    bufp->fullIData(oldp+82,(vlSelf->r[15]),32);
    bufp->fullIData(oldp+83,(vlSelf->r[16]),32);
    bufp->fullIData(oldp+84,(vlSelf->r[17]),32);
    bufp->fullIData(oldp+85,(vlSelf->r[18]),32);
    bufp->fullIData(oldp+86,(vlSelf->r[19]),32);
    bufp->fullIData(oldp+87,(vlSelf->r[20]),32);
    bufp->fullIData(oldp+88,(vlSelf->r[21]),32);
    bufp->fullIData(oldp+89,(vlSelf->r[22]),32);
    bufp->fullIData(oldp+90,(vlSelf->r[23]),32);
    bufp->fullIData(oldp+91,(vlSelf->r[24]),32);
    bufp->fullIData(oldp+92,(vlSelf->r[25]),32);
    bufp->fullIData(oldp+93,(vlSelf->r[26]),32);
    bufp->fullIData(oldp+94,(vlSelf->r[27]),32);
    bufp->fullIData(oldp+95,(vlSelf->r[28]),32);
    bufp->fullIData(oldp+96,(vlSelf->r[29]),32);
    bufp->fullIData(oldp+97,(vlSelf->r[30]),32);
    bufp->fullIData(oldp+98,(vlSelf->r[31]),32);
    bufp->fullIData(oldp+99,(vlSelf->SingleCycleCPU__DOT__data_memory_out),32);
    bufp->fullIData(oldp+100,(vlSelf->SingleCycleCPU__DOT__mux_write_data_out),32);
    bufp->fullIData(oldp+101,(((IData)(vlSelf->SingleCycleCPU__DOT__Jump)
                                ? ((IData)(4U) + vlSelf->SingleCycleCPU__DOT__pc_out)
                                : vlSelf->SingleCycleCPU__DOT__mux_write_data_out)),32);
    bufp->fullIData(oldp+102,(4U),32);
    bufp->fullIData(oldp+103,(0x20U),32);
}
