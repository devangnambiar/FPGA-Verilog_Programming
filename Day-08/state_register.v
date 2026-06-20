module state_register(
    input clk,
    input reset,
    input [1:0] next_state,
    output reg [1:0] current_state
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= 2'b00;
        end else begin
            current_state <= next_state;
        end
    end
endmodule