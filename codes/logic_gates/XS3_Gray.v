`timescale 1ns/1ps

module XS3_Gray(input [3:0]A, output [3:0]Y);
    wire not_1, not_2;
    wire and_1, and_2, and_3, and_4, and_5, and_6, and_7, and_8, and_9, and_10, and_11, and_12;
    wire or_1, or_2, or_3, or_4, or_5;
    wire nand_1;
    wire nor_1, nor_2;

    nor(nor_1, A[2], A[1]);
    and(and_1, A[3], nor_1);
    not(not_1, A[3]);
    or(or_1, A[1], A[0]);
    and(and_2, not_1, A[2], or_1);
    or(or_2, and_1, and_2); //Y[3]

    and(and_3, not_1, A[2]);
    nor(nor_2, A[3], A[2]);
    and(and_4, nor_2, or_1);
    not(not_2, A[0]);
    and(and_5, A[3], nor_1, not_2); 
    or(or_3, and_3, and_4, and_5); //Y[2]

    nand(nand_1, A[1], A[0]);
    and(and_6, nor_2, nand_1);
    and(and_7, A[3], nor_1); 
    and(and_8, A[2], A[1], A[0]);
    and(and_9, not_1, and_8);
    or(or_4, and_6, and_7, and_9); //Y[1]

    and(and_10, nor_2, A[1]);
    and(and_11, A[2], A[1]);
    and(and_12, not_1, and_11);
    or(or_5, and_10, and_12); //Y[0]

    assign Y[3] = or_2;
    assign Y[2] = or_3;
    assign Y[1] = or_4;
    assign Y[0] = or_5;

    //assign Y[3] = A[3] & (A[2] ~| A[1]) | ~A[3] & A[2] & (A[1] | A[0]);
    //assign Y[2] = ~A[3] & A[2] | (A[3] ~| A[2]) & (A[1] | A[0]) | A[3] & (A[2] ~| A[1]) & ~A[0];
    //assign Y[1] = (A[3] ~| A[2]) & (A[1] ~& A[0]) | A[3] & (A[2] ~| A[1]) | ~A[3] & (A[2] & A[1] & A[0]);
    //assign Y[0] = (A[3] ~| A[2]) & A[1] | ~A[3] & (A[2] & A[1]);
endmodule