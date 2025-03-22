module IDEXreg(
    input clk,
    input flush,
    input [size-1:0] data_i,
    output reg [size-1:0] data_o
);

parameter size = 0;
always @(posedge clk) begin
	if(flush) begin
	    data_o <= 0;
    end
	else begin
	    data_o <= data_i;
	end
end
endmodule
