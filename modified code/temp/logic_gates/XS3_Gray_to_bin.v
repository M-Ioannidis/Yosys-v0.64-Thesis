`timescale 1ns/1ps

module XS3_Gray_to_bin(input [3:0]A, output [3:0]Y);
    wire xor_1, xor_2, xor_3, xor_4;
    wire and_1, and_2, and_3, and_4, and_5, and_6, and_7, and_8, and_9;
    wire or_1, or_2, or_3; 
    wire nor_1; 
    wire xnor_1; 
    
    assign xor_1 = A[1] ^ A[0]; 
    assign and_1 = A[3] & xor_1 & A[1]; //Y[3]

    assign nor_1 = A[1] ~| A[0];
    assign and_2 = A[2] & nor_1;
    assign and_3 = A[3] & A[2] & A[0];
    assign or_1 = and_2 | and_3; //Y[2]

    assign and_4 = A[2] & A[0]; //Y[1]

    assign and_5 = A[3] & A[2]; 
    assign xnor_1 = A[1] ~^ A[0];
    assign and_6 = and_5 & xnor_1;
    assign xor_2 = A[3] ^ A[2];
    assign xor_3 = A[2] ^ A[1];
    assign and_7 = A[2] & A[1];
    assign or_2 = xor_3 | and_7; 
  	assign and_8 = xor_2 & xor_1 & or_2;
    assign or_3 = and_6  | and_8; //Y[0]
  
  	assign Y[3] = and_1;
  	assign Y[2] = or_1;
  	assign Y[1] = and_4;
  	assign Y[0] = or_3;

    //assign Y[3] = A[3] & (A[1] ^ A[0]) & A[1];
    //assign Y[2] = A[2] & (A[1] ~| A[0]) | A[3] & A[2] & A[0]; 
    //assign Y[1] = A[2] & A[0];
    //assign Y[0] = (A[3] & A[2]) & (A[1] ~^ A[0]) | (A[3] ^ A[2]) & (A[1] ^ A[0]) & ((A[2] ^ A[1]) | (A[2] & A[1]));
endmodule