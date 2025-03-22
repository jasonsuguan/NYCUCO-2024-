module ALUCtrl (
    input [1:0] ALUOp,
    input funct7,
    input [2:0] funct3,
    output reg [3:0] ALUCtl
);

    // Implement ALU control logic
always @(*) begin
    case (ALUOp)
        2'b10: begin
            // R-type instructions
            case ({funct7, funct3})
                4'b0_000 : ALUCtl = 4'b0010; // ADD
                4'b1_000 : ALUCtl = 4'b0110; // SUB
                4'b0_010 : ALUCtl = 4'b0111; // SLT
                4'b0_111 : ALUCtl = 4'b0000; // AND
                4'b0_110 : ALUCtl = 4'b0001; // OR
                4'b0_100 : ALUCtl = 4'b1100; // XOR
                default  : ALUCtl = 4'b0000; // Default to NOP
            endcase
        end
        
        2'b00: begin
            // I-type arithmetic instructions and Load/Store/JALR/JAL instructions
            case (funct3)
                3'b010: ALUCtl = 4'b0111; // SLTI and Load/Store (use ADD)
                3'b000: ALUCtl = 4'b0010; // ADDI and JALR (use ADD)
                3'b110: ALUCtl = 4'b0001; // ORI
                default: ALUCtl = 4'b0000; // Default to NOP
            endcase
        end
        
        2'b01: begin
            // Branch instructions
            case (funct3)
                3'b000: ALUCtl = 4'b1001; // BEQ
                3'b001: ALUCtl = 4'b1010; // BNE
                3'b100: ALUCtl = 4'b0111; // BLT
                3'b101: ALUCtl = 4'b1111; // BGE
                default: ALUCtl = 4'b0000; // Default to NOP
            endcase
        end

        2'b11: begin
            case (funct3)
                3'b000: ALUCtl=4'b1110;// jalr 
                default: ALUCtl = 4'b0010; //jal
            endcase
        end

        default: ALUCtl = 4'b0000; // Default to NOP
    endcase
end
endmodule

