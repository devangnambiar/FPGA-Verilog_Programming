module ring_counter_tb;
reg clk;
reg rst;
wire [3:0] q;

ring_counter uut (
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("ring_counter_tb.vcd");
    $dumpvars(0, ring_counter_tb);
end

initial begin
    $monitor("Time: %0t | rst: %b | q: %b", $time, rst, q);
    // Test 1: Reset the ring counter
    rst = 1;
    #10;
    rst = 0;
    #40;

    // Test 2: Reset the ring counter again
    rst = 1;
    #10;
    rst = 0;
    #40;

    $finish;
end