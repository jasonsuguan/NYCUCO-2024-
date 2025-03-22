// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VSingleCycleCPU.h for the primary calling header

#ifndef VERILATED_VSINGLECYCLECPU___024ROOT_H_
#define VERILATED_VSINGLECYCLECPU___024ROOT_H_  // guard

#include "verilated.h"

class VSingleCycleCPU__Syms;

class VSingleCycleCPU___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(start,0,0);
    CData/*0:0*/ SingleCycleCPU__DOT__memread;
    CData/*3:0*/ SingleCycleCPU__DOT__ALU_Control;
    CData/*0:0*/ SingleCycleCPU__DOT__ALU_zero;
    CData/*0:0*/ SingleCycleCPU__DOT__Branch;
    CData/*0:0*/ SingleCycleCPU__DOT__memtoreg;
    CData/*0:0*/ SingleCycleCPU__DOT__memwrite;
    CData/*0:0*/ SingleCycleCPU__DOT__alusrc;
    CData/*0:0*/ SingleCycleCPU__DOT__regwrite;
    CData/*0:0*/ SingleCycleCPU__DOT__Jump;
    CData/*0:0*/ SingleCycleCPU__DOT__Jalr;
    CData/*1:0*/ SingleCycleCPU__DOT__aluop;
    CData/*6:0*/ SingleCycleCPU__DOT____Vcellinp__m_Control__opcode;
    CData/*4:0*/ SingleCycleCPU__DOT____Vcellinp__m_Register__writeReg;
    CData/*7:0*/ __VdfgTmp_hb31ff53b__0;
    CData/*7:0*/ __VdfgTmp_he9cf927d__0;
    CData/*6:0*/ __Vdlyvdim0__SingleCycleCPU__DOT__m_DataMemory__DOT__data_memory__v0;
    CData/*7:0*/ __Vdlyvval__SingleCycleCPU__DOT__m_DataMemory__DOT__data_memory__v0;
    CData/*0:0*/ __Vdlyvset__SingleCycleCPU__DOT__m_DataMemory__DOT__data_memory__v0;
    CData/*6:0*/ __Vdlyvdim0__SingleCycleCPU__DOT__m_DataMemory__DOT__data_memory__v1;
    CData/*7:0*/ __Vdlyvval__SingleCycleCPU__DOT__m_DataMemory__DOT__data_memory__v1;
    CData/*6:0*/ __Vdlyvdim0__SingleCycleCPU__DOT__m_DataMemory__DOT__data_memory__v2;
    CData/*7:0*/ __Vdlyvval__SingleCycleCPU__DOT__m_DataMemory__DOT__data_memory__v2;
    CData/*6:0*/ __Vdlyvdim0__SingleCycleCPU__DOT__m_DataMemory__DOT__data_memory__v3;
    CData/*7:0*/ __Vdlyvval__SingleCycleCPU__DOT__m_DataMemory__DOT__data_memory__v3;
    CData/*0:0*/ __Vdlyvset__SingleCycleCPU__DOT__m_DataMemory__DOT__data_memory__v4;
    CData/*0:0*/ __Vtrigrprev__TOP__clk;
    CData/*0:0*/ __Vtrigrprev__TOP__start;
    CData/*0:0*/ __Vtrigrprev__TOP__SingleCycleCPU__DOT__memread;
    CData/*0:0*/ __VactDidInit;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ SingleCycleCPU__DOT__pc_out;
    IData/*31:0*/ SingleCycleCPU__DOT__final_pc_in;
    IData/*31:0*/ SingleCycleCPU__DOT__addout_2;
    IData/*31:0*/ SingleCycleCPU__DOT__im_out;
    IData/*31:0*/ SingleCycleCPU__DOT__imm_gen;
    IData/*31:0*/ SingleCycleCPU__DOT__readdata1;
    IData/*31:0*/ SingleCycleCPU__DOT__readdata2;
    IData/*31:0*/ SingleCycleCPU__DOT__ALU_result;
    IData/*31:0*/ SingleCycleCPU__DOT__Mux_ALU;
    IData/*31:0*/ SingleCycleCPU__DOT__data_memory_out;
    IData/*31:0*/ SingleCycleCPU__DOT__mux_write_data_out;
    IData/*31:0*/ __VdfgTmp_h5ae09f70__0;
    IData/*23:0*/ __VdfgTmp_hb826ee08__0;
    IData/*31:0*/ __Vdly__SingleCycleCPU__DOT__pc_out;
    IData/*31:0*/ __VstlIterCount;
    IData/*31:0*/ __Vtrigrprev__TOP__SingleCycleCPU__DOT__ALU_result;
    IData/*31:0*/ __VactIterCount;
    VL_OUT(r[32],31,0);
    VlUnpacked<CData/*7:0*/, 128> SingleCycleCPU__DOT__m_InstMem__DOT__insts;
    VlUnpacked<IData/*31:0*/, 32> SingleCycleCPU__DOT__m_Register__DOT__regs;
    VlUnpacked<CData/*7:0*/, 128> SingleCycleCPU__DOT__m_DataMemory__DOT__data_memory;
    VlUnpacked<CData/*0:0*/, 4> __Vm_traceActivity;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<3> __VactTriggered;
    VlTriggerVec<3> __VnbaTriggered;

    // INTERNAL VARIABLES
    VSingleCycleCPU__Syms* const vlSymsp;

    // CONSTRUCTORS
    VSingleCycleCPU___024root(VSingleCycleCPU__Syms* symsp, const char* v__name);
    ~VSingleCycleCPU___024root();
    VL_UNCOPYABLE(VSingleCycleCPU___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
