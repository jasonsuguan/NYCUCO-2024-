/* verilator lint_off UNUSEDSIGNAL */
module ShiftLeftOne (
    input signed [31:0] i,// Unused: input signed [31] i
    output signed [31:0] o
);

    // TODO: implement your shift left 1 here
assign o = {i[30:0], 1'b0};

endmodule

