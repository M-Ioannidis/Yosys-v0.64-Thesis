`timescale 1ns/1ps

module xor_block (
    input  wire A,
    input  wire B,
    output wire Y
);
    assign Y = A ^ B;
endmodule

module gray_code (
    input wire [3:0]A, 
    output wire [3:0]Y
);
    xor_block u1 (
        .A(A[3]),
        .B(A[2]),
        .Y(Y[2])
    );
    xor_block u2 (
        .A(A[2]),
        .B(A[1]),
        .Y(Y[1])
    );
    xor_block u3 (
        .A(A[1]),
        .B(A[0]),
        .Y(Y[0])
    );
    assign Y[3] = A[3];
endmodule