`timescale 1ns/1ps

module decoder2to4_tb;

reg [1:0] A;
wire [3:0] Y;

decoder2to4 uut(
    .A(A),
    .Y(Y)
);

initial begin
    
    $dumpfile("decoder2to4.vcd");
    $dumpvars(0, decoder2to4_tb);

    A = 2'b00; #10;
    A = 2'b01; #10;
    A = 2'b10; #10;
    A = 2'b11; #10;

    $finish;
end

endmodule