module ForwardingUnit (
    input EX_MEM_RegWrite,
    input MEM_WB_RegWrite,
    input [4:0] EX_MEM_RegisterRd,
    input [4:0] MEM_WB_RegisterRd,
    input [4:0] ID_EX_RegisterRs,
    input [4:0] ID_EX_RegisterRt,
    output reg [1:0] forwardA,
    output reg [1:0] forwardB
);
    always @(*) begin
        if ((ID_EX_RegisterRs == EX_MEM_RegisterRd) && EX_MEM_RegWrite && (EX_MEM_RegisterRd != 5'b00000))
            forwardA = 2'b10; 
        else if ((ID_EX_RegisterRs == MEM_WB_RegisterRd) && MEM_WB_RegWrite && (MEM_WB_RegisterRd != 5'b00000)) 
            forwardA = 2'b01; 
        else 
            forwardA = 2'b00;
        if ((ID_EX_RegisterRt == EX_MEM_RegisterRd) && EX_MEM_RegWrite && (EX_MEM_RegisterRd != 5'b00000)) 
            forwardB = 2'b10; 
        else if ((ID_EX_RegisterRt == MEM_WB_RegisterRd) && MEM_WB_RegWrite && (MEM_WB_RegisterRd != 5'b00000)) 
            forwardB = 2'b01; 
        else
            forwardB = 2'b00;
    end
endmodule
