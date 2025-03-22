/* verilator lint_off UNUSEDSIGNAL */
module ShiftLeftOne (
    input signed [31:0] i,// Unused: input signed [31] i
    output signed [31:0] o
);

assign o = i << 1;


endmodule

