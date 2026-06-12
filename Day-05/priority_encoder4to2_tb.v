`timescale 1ns/1ps

module priority_encoder4to2_tb;

reg D0;
reg D1;
reg D2;
reg D3;

wire [1:0] Y;

priority_encoder4to2 uut(
    .D0(D0),
    .D1(D1),
    .D2(D2),
    .D3(D3),
    .Y(Y)
);

initial begin
    
    $dumpfile("priority_encoder4to2.vcd");
    $dumpvars(0, priority_encoder4to2_tb);

    D3=0; D2=0; D1=0; D0=1; #10;
    D3=0; D2=0; D1=1; D0=1; #10;    
    D3=0; D2=1; D1=1; D0=1; #10;
    D3=1; D2=1; D1=1; D0=1; #10;

    $finish;
end
endmodule