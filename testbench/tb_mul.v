module tb_mul;

reg[31:0] A;
reg[31:0] B;
wire[63:0] X;

mul m0(.A(A),.B(B),.X(X));

initial begin

    A = 31'd7723;
    B = 31'd247711;

end

// X should be 1913072053

initial
    $monitor("A * B = ", X);



endmodule
