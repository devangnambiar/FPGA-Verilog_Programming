module pipo_tb;
reg clk;
reg rst;
reg load;
reg [3:0] parallel_in;
wire [3:0] q;

pipo uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .parallel_in(parallel_in),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("pipo_tb.vcd");
    $dumpvars(0, pipo_tb);
end

// Test cases
initial begin

    $monitor("Time: %0t | rst: %b | load: %b | parallel_in: %b | q: %b", $time, rst, load, parallel_in, q);
    // Test 1: Load parallel data
    rst = 1;
    load = 0;
    parallel_in = 4'b1010;
    #10;

    // Test 2: Shift out data
    rst = 0;
    load = 0;
    #40;

    // Test 3: Load new parallel data
    load = 1;
    parallel_in = 4'b1100;
    #10;

    // Test 4: Shift out new data
    load = 0;
    #40;

    $finish;
end