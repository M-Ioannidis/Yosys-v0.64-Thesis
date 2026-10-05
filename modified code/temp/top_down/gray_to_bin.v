`timescale 1ns/1ps

module not_block (
    input  wire A,
    output wire Y
);
    assign Y = ~A;
endmodule

module and_block (
    input  wire A,
    input  wire B,
    output wire Y
);
    assign Y = A & B;
endmodule

module or_block (
    input  wire A,
    input  wire B,
    output wire Y
);
    assign Y = A | B;
endmodule

module xor_block (
    input  wire A,
    input  wire B,
    output wire Y
);
    assign Y = A ^ B;
endmodule

module gray_to_bin (
    input wire [3:0]A, 
    output wire [3:0]Y
);
  	wire not_A3, not_A2, not_A1;
    wire and_1, and_2, and_3, and_4, and_5, and_6, and_7, and_8;
    wire or_1, or_2, or_3;
    wire xor_out, xor_out2, xor_out3;
    
    not_block not1 (
        .A(A[1]),
        .Y(not_A1)
    );
    not_block not2 (
        .A(A[2]),
        .Y(not_A2)
    );
    not_block not3 (
        .A(A[3]),
        .Y(not_A3)
    );

    and_block and1 (
        .A(not_A3),
        .B(not_A2),
        .Y(and_1)
    );

    and_block and2 (
        .A(and_1),
        .B(A[1]),
        .Y(and_2)
    );

    and_block and3 (
        .A(not_A3),
        .B(A[2]),
        .Y(and_3)
    );

    and_block and4 (
        .A(and_3),
        .B(not_A1),
        .Y(and_4)
    );


    and_block and5 (
        .A(A[3]),
        .B(A[2]),
        .Y(and_5)
    );

    and_block and6 (
        .A(and_5),
        .B(A[1]),
        .Y(and_6)
    );

    and_block and7 (
        .A(A[3]),
        .B(not_A2),
        .Y(and_7)
    );

    and_block and8 (
        .A(and_7),
        .B(not_A1),
        .Y(and_8)
    );

    or_block or1(
        .A(and_2),
        .B(and_4),
        .Y(or_1)
    );

    or_block or2(
        .A(and_6),
        .B(and_8),
        .Y(or_2)
    );

    or_block or3(
        .A(or_1),
        .B(or_2),
        .Y(or_3)
    );

    xor_block xor1 (
        .A(A[3]),
        .B(A[2]),
        .Y(xor_out)
    );

    xor_block xor2 (
        .A(A[1]),
        .B(A[0]),
        .Y(xor_out2)
    );

    xor_block xor3 (
        .A(xor_out),
        .B(xor_out2),
        .Y(xor_out3)
    );
   
    assign Y[3] = A[3];
    assign Y[2] = xor_out;
    assign Y[1] = or_3;
    assign Y[0] = xor_out3;
endmodule