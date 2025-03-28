module Pipe_Reg #(parameter size = 32) (
    input clk,
    input rst,
    input [size-1:0] data_i,
    output reg [size-1:0] data_o
);

always @(posedge clk or posedge rst) begin
    if (~rst)
        data_o <= 0;
    else
        data_o <= data_i;
end

endmodule
