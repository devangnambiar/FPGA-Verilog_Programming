`timescale 1ns/1ps

module siso_tb;

reg clk;
reg rst;
reg serial_in;
wire serial_out;

siso uut(
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .serial_out(serial_out)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("siso.vcd");
    $dumpvars(0, siso_tb);
end

initial begin

    $monitor("Time=%0t rst=%b serial_in=%b q=%b serial_out=%b",
          $time, rst, serial_in, uut.q, serial_out);
          
    rst = 1;
    serial_in = 0;
    #10;
    rst = 0;

    // Test case 1: Shift in a sequence of bits
    serial_in = 1; #10;
    serial_in = 0; #10;
    serial_in = 1; #10;
    serial_in = 1; #10;
    serial_in = 0; #10;

    // Test case 2: Reset the shift register
    rst = 1; #10;
    rst = 0; #10;

    // Test case 3: Shift in another sequence of bits
    serial_in = 0; #10;
    serial_in = 1; #10;
    serial_in = 1; #10;
    serial_in = 0; #10;

    $finish;
end

endmodule