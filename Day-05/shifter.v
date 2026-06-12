module shifter(
    input [2:0] A,
    input S,
    output reg [3:0] Y
);

always @(*) begin

    if(S == 0)
        Y = A << 1;

    else
        Y = A >> 1;

end

endmodule