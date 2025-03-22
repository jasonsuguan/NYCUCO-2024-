module PC (
    input clk,
    input rst,
    input pc_write,
    input [31:0] pc_i,
    output reg [31:0] pc_o
);
always @(posedge clk) begin
    if(rst == 0) pc_o <= 32'b0;
    if(~pc_write) pc_o <= pc_i;
end
endmodule
