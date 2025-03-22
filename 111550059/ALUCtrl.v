module ALUCtrl (
    input [1:0] ALUOp,
    input funct7,
    input [2:0] funct3,
    output reg [3:0] ALUCtl
);

    // TODO: implement your ALU control here
    // For testbench verifying, Do not modify input and output pin
    // Hint: using ALUOp, funct7, funct3 to select exact operation

    // Use assign statements instead of always block
    assign ALUCtl = (ALUOp == 2'b00) ? 
                    ((funct7 == 1'b1) ? 4'b0110 : 
                        ((funct3 == 3'b000) ? 4'b0010 : 
                            ((funct3 == 3'b010) ? 4'b0111 : 
                                ((funct3 == 3'b111) ? 4'b0000 : 
                                    ((funct3 == 3'b110) ? 4'b0001 : 4'b0000))))) :
                    ((ALUOp == 2'b01) ? 4'b0010 :
                        ((ALUOp == 2'b10) ? 4'b0110 :
                            ((ALUOp == 2'b11) ? 
                                ((funct3 == 3'b010) ? 4'b0111 : 
                                    ((funct3 == 3'b000) ? 4'b0010 : 
                                        ((funct3 == 3'b110) ? 4'b0001 : 4'b0000))) : 4'b0000)));

endmodule
