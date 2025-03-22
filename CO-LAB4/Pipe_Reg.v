module Pipe_Reg (
    input clk,
    input rst,
    input [size-1:0] data_i,
    output reg [size-1:0] data_o
);

parameter size = 0;
always @(posedge clk) begin
    if(~rst)
        data_o <= 0;
    else
	    data_o <= data_i;
end

endmodule
