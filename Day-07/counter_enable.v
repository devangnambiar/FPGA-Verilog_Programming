module counter_enable (
    input clk,
    input reset,
    input enable,
    output reg [3:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
        end else if (enable) begin
            count <= count + 1;
        end
        else begin
            count <= count;
        end
    end

endmodule