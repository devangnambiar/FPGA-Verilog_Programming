module half_adder_tb(
    reg A,
    reg B,
    wire SUM,
    wire CARRY

    half_adder DUT(
        .A(A),
        .B(B),
        .SUM(SUM),
        .CARRY(CARRY)
    );
);

initial begin
    
    A=0;
    B=0;

    #10;

    A=0;
    B=1;

    #10;

    A=1;
    B=0;

    #10;

    A=1;
    B=1;

    #10;
end

    
endmodule