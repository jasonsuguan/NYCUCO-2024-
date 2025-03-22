module Control (
    input [6:0] opcode,
    output reg branch,
    output reg memRead,
    output reg memtoReg,
    output reg [1:0] ALUOp,
    output reg memWrite,
    output reg ALUSrc,
    output reg regWrite,
    output reg jump,
    output reg jalr
);

    // TODO: implement your Control here
    // Hint: follow the Architecture (figure in spec) to set output signal
always @(*) begin
    case(opcode)
        // R-type instructions
        7'b0110011: 
            begin
                branch = 0;
                memRead = 0;
                memtoReg = 0;
                ALUOp = 2'b10; 
                memWrite = 0;
                ALUSrc = 0;
                regWrite = 1;
                jump = 0;
                jalr = 0;
            end
        // I-type
        7'b0010011: 
            begin
                branch = 0;
                memRead = 0;
                memtoReg = 0;
                ALUOp = 2'b00; 
                memWrite = 0;
                ALUSrc = 1;
                regWrite = 1;
                jump = 0;
                jalr = 0;
            end
        7'b0000011: 
            begin 
                branch = 0;
                memRead = 1;
                memtoReg = 1;
                ALUOp = 2'b00; 
                memWrite = 0;
                ALUSrc = 1;
                regWrite = 1;
                jump=0;
                jalr = 0;
            end
        7'b0100011: 
            begin
                branch = 0;
                memRead = 0;
                memtoReg = 0;
                ALUOp = 2'b00; 
                memWrite = 1;
                ALUSrc = 1; 
                regWrite = 0;
                jump=0;
                jalr = 0;
            end
        7'b1100011: //beq
            begin
                branch = 1;
                memRead = 0;
                memtoReg = 0;
                ALUOp = 2'b01; 
                memWrite = 0;
                ALUSrc = 0;
                regWrite = 0;
                jump=0;
                jalr = 0;
            end
        7'b1101111: //jal
            begin
                branch = 0;
                memRead = 0;
                memtoReg = 1;
                ALUOp = 2'b11; 
                memWrite = 0;
                ALUSrc = 1;
                regWrite = 1;
                jump=1;
                jalr = 0;
            end
        7'b1100111: //jalr
            begin
                branch = 0;
                memRead = 0;
                memtoReg = 1;
                ALUOp = 2'b00; 
                memWrite = 0;
                ALUSrc = 1;
                regWrite = 1;
                jump=1;
                jalr = 1;
            end
        default: 
            begin
                branch = 0;
                memRead = 0;
                memtoReg = 0;
                ALUOp = 2'b00; 
                memWrite = 0;
                ALUSrc = 0;
                regWrite = 0;
                jump=0;
                jalr = 0;
            end
    endcase
end
endmodule


