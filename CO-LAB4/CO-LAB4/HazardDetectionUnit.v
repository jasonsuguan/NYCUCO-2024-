module HazardDetectionUnit (
    input ID_EX_MemRead,
    input jump_and_branch,
    input [4:0] ID_EX_RegisterRt,
    input [4:0] IF_ID_RegisterRs,
    input [4:0] IF_ID_RegisterRt,
    output reg pc_write,
    output reg IF_ID_write,
    output reg IF_ID_flush,
    output reg ID_EX_flush
);
    reg stall;
    always @(*) begin
        stall = (ID_EX_MemRead == 1'b1) && ((IF_ID_RegisterRs == ID_EX_RegisterRt) || (IF_ID_RegisterRt == ID_EX_RegisterRt));
    end
    assign pc_write = stall;
    assign IF_ID_write = stall;
    assign IF_ID_flush = jump_and_branch;
    assign ID_EX_flush = (stall||jump_and_branch);

endmodule
