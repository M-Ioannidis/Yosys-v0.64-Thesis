`timescale 1ns/1ps

module susskind(input [3:0]A, output [3:0]Y);
    assign Y[3] = A[3] & (A[2] ~| A[1]) | ~A[3] & A[2] & (A[1] | A[0]);
    assign Y[2] = Y[3] & ~A[3] | ~Y[3] & ~A[3] & (A[2] | A[1]); 
    assign Y[1] = Y[2] & A[1] | ~Y[2] & (A[2] ~| A[1]) & (A[3] ^ A[0]);
    assign Y[0] = Y[1] & (A[1] ^ A[0]) & ~A[2] | Y[1] & (A[3] ^ A[0]) & (A[2] ~^ A[1]) | ~Y[1] & (A[3] ~^ A[2]) & (A[1] ~^ A[0])| ~Y[1] & (A[2] ~| A[1]) & A[3];
endmodule
