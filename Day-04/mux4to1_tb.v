`timescale 1ns/1ps

module mux4to1_tb;

reg A;
reg B;
reg C;
reg D;
reg [1:0] S;

wire Y;

mux4to1 uut(
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .S(S),
    .Y(Y)
);

initial begin
    
    $dumpfile("mux4to1.vcd");
    $dumpvars(0, mux4to1_tb);

    A=0;
    B=1;
    C=1;
    D=0;

    S=2'b00; #10;
    S=2'b01; #10;
    S=2'b10; #10;
    S=2'b11; #11;

    $finish;

end
    
endmodule