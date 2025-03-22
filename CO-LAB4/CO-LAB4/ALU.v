module ALU (
    input [3:0] ALUctl,
    input signed [31:0] A, B,
    output reg signed [31:0] ALUOut,
    output zero
);
    // ALU has two operand, it executes different operations based on ALUctl wire
    // output zero is for determining taking branch or not (or you can change the design as you wish)

    always @(*)begin
        case (ALUctl)
            4'b0000: ALUOut = A & B;           // AND
            4'b0001: ALUOut = A | B;           // OR
            4'b0010: ALUOut = A + B;           // ADD
            4'b0110: ALUOut = A - B;           // SUB
            4'b0100: ALUOut = (A < B) ? 32'b1 : 32'b0; // SLT (Set on Less Than)
            4'b0011: ALUOut = (A - B == 0) ? 32'b1 : 32'b0; // BEQ (Branch on Equal)
            4'b0101: ALUOut = (A >= B) ? 32'b1 : 32'b0; // BGE (Branch on Greater or Equal)
            default: ALUOut = 32'bx;            // Undefined operation
        endcase
    end

    assign zero = (ALUOut == 32'b0);

endmodule


