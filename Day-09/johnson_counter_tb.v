module johnson_counter_tb;
reg clk;
reg rst;
wire [3:0] q;


johnson_counter uut (
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
    $dumpfile("johnson_counter_tb.vcd");
    $dumpvars(0, johnson_counter_tb);
end

initial begin
    $monitor("Time: %0t | rst: %b | q: %b", $time, rst, q);
    // Test 1: Reset the Johnson counter
    rst = 1;
    #10;
    rst = 0;
    #40;

    // Test 2: Reset the Johnson counter again
    rst = 1;
    #10;
    rst = 0;
    #40;

    $finish;
end
endmodule