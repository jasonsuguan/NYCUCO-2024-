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
    reg [9:0] contrller;
    assign {  memRead, memWrite,memtoReg, regWrite, branch, ALUOp, jalr, jump, ALUSrc} = contrller;
    always @(*) begin
        case(opcode)
            7'b1100011: contrller = 10'b00x0101000;
            7'b0000011: contrller = 10'b1011000001;
            7'b0100011: contrller = 10'b01x0000001;
            7'b0110011: contrller = 10'b0001010000;
            7'b0010011: contrller = 10'b0001011001;
            7'b1101111: contrller = 10'bxx01000011;
            7'b1100111: contrller = 10'bxx01000111;
            default: contrller = 10'bxxxxxxxxxx;
        endcase
    end
endmodule


