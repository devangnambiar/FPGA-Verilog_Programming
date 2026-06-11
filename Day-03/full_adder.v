module full_adder(
  input A,
  input B,
  input Cin,
  output SUM,
  output Cout
);

    wire sum1;
    wire carry1;
    wire carry2;

    assign sum1 = A ^ B;
    assign carry1 = A & B;

    assign SUM = sum1 ^ Cin;
    assign carry2 = sum1 & Cin;

    assign Cout = carry1 | carry2;

endmodule