`timescale 1ns/1ps

module BCD2421 (input wire[3:0]A, output reg [3:0]Y);
    always @(*)  
        begin
            if ( A[3]) //1
                begin
                    if ( A[2]) //11
                        Y = 4'b0000;
                    else //10
                        begin
                            if ( A[1]) //101
                                Y = 4'b0000;
                            else //100
                                Y = (A[0]) ? 4'b1111 : 4'b1110; //1001 or 1000
                        end
                end
            else //0
                begin
                    if ( A[2]) //01
                        begin
                            if ( A[1]) //011
                                Y = (A[0]) ? 4'b1101 : 4'b1100; //0111 or 0110
                            else //010
                                Y = (A[0]) ? 4'b1011 : 4'b0100; //0101 or 0100
                        end
                    else //00
                        begin
                            if (A[1]) //001
                                Y = (A[0]) ? 4'b0011 : 4'b0010; //0011 or 0010
                            else //000
                                Y = (A[0]) ? 4'b0001 : 4'b0000; //0001 or 0000
                        end
                end
        end        
endmodule