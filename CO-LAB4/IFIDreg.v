module IFIDreg(
    input clk,
    input flush,
    input write,
    input [size-1:0] data_i,
    output reg [size-1:0] data_o
);

parameter size = 0;
always @(posedge clk) begin
    if(write == 1'b0) begin
        if(flush == 1'b1) begin
            data_o <= 0;
        end
        else begin
            data_o <= data_i;
        end
    end
end

endmodule
