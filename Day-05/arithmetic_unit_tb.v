`timescale 1ns/1ps 

module arithmetic_unit_tb;
    
reg [1:0] A;
reg [1:0] B;
reg S;

wire [2:0] Y;

arithmetic_unit uut(
    .A(A),
    .B(B),
    .S(S),
    .Y(Y)
);

initial begin
    
    $dumpfile("arithmetic_unit.vcd");
    $dumpvars(0, arithmetic_unit_tb);

    A=2'b10; B=2'b01; S=0; #10;
    A=2'b11; B=2'b01; S=0; #10;
    A=2'b10; B=2'b01; S=1; #10;
    A=2'b11; B=2'b10; S=1; #10;

    $finish;
end

endmodule