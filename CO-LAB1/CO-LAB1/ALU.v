module ALU (
    input [3:0] ALUctl,
    input signed [31:0] A,B,
    output reg signed [31:0] ALUOut,
    output zero
);
    // ALU has two operand, it execute different operator based on ALUctl wire 
    // output zero is for determining taking branch or not (or you can change the design as you wish)

    // TODO: implement your ALU here
    // Hint: you can use operator to implement
always @* begin
    case (ALUctl)
        4'b0000: begin zero = 0; ALUOut = A & B;end
        4'b0001: begin zero = 0; ALUOut = A | B;end
        4'b0010: begin zero = 0; ALUOut = A + B;end
        4'b0110: begin zero = 0; ALUOut = A - B;end
        4'b0111: begin zero = 0; ALUOut = (A < B) ? 1 : 0;end
        4'b1100: begin zero = 0; ALUOut = ~(A | B);end
        default: begin zero = 0; ALUOut = 0;end     // Default to zero
    endcase
end
endmodule

