module ripple_carry_adder (
    input [3:0] A,
    input [3:0] B,
    output [3:0] SUM,
    output Cout
);

wire c1;
wire c2;
wire c3;

full_adder FA0(
    .A(A[0]),
    .B(B[0]),
    .Cin(1'b0),
    .SUM(SUM[0]),
    .Cout(c1)
);

full_adder FA1(
    .A(A[1]),
    .B(B[1]),
    .Cin(c1),
    .SUM(SUM[1]),
    .Cout(c2)
);

full_adder FA2(
    .A(A[2]),
    .B(B[2]),
    .Cin(c2),
    .SUM(SUM[2]),
    .Cout(c3)
);

full_adder FA3(
    .A(A[3]),
    .B(B[3]),
    .Cin(c3),
    .SUM(SUM[3]),
    .Cout(Cout)
);

endmodule