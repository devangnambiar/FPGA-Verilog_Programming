module dff_async_reset_tb;

reg clk;
reg reset;
reg d;

wire q;

dff_async_reset uut(
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $monitor("Time=%0t reset=%b d=%b q=%b",
             $time, reset, d, q);

    // Load a 1
    reset = 0;
    d = 1;
    #10;

    // Assert reset immediately
    reset = 1;
    #3;

    // Release reset
    reset = 0;
    d = 0;
    #10;

    $finish;

end

endmodule