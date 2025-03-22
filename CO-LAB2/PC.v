module PC (
    input clk,
    input rst,
    input [31:0] pc_i,
    output reg [31:0] pc_o
);


always @(posedge clk,negedge rst) begin
    if(~rst)
	    pc_o <= pc_o;
	else
	    pc_o <= pc_i;
end
endmodule
