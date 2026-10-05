`timescale 1ns/1ps

module BCD2421 (input wire [3:0]A, output wire [3:0]Y);
    assign Y[3] = ~A[3] & A[2] & (A[1] | A[0]) | A[3] & ~A[2] & ~A[1];
    assign Y[2] = ~A[3] & A[2] & (A[1] ~^ A[0]) | ~A[3] & A[2] & A[1] | A[3] & ~A[2] & ~A[1];
    assign Y[1] = ~A[3] & ~A[2] & A[1] | ~A[3] & A[2] & ~A[1] & A[0] |  A[3] & ~A[2] & ~A[1]; 
    assign Y[0] = ~A[3] & A[0] | A[3] & ~A[2] & ~A[1] & A[0];
endmodule
