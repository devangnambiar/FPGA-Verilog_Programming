module pipo(
    input clk,
    input rst,
    input load,
    input [3:0] parallel_in,
    output reg [3:0] q
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        q <= 4'b0000;
    else if(load)
        q <= parallel_in;
    else
        q <= q;

end    
endmodule