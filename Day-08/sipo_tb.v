module sipo_tb;
reg clk;
reg rst;
reg serial_in;
wire [3:0] parallel_out;

sipo uut(
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .parallel_out(parallel_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("sipo_tb.vcd");
    $dumpvars(0, sipo_tb);
end

initial begin
    $monitor("Time=%0t rst=%b serial_in=%b parallel_out=%b",
          $time, rst, serial_in, parallel_out);
          
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