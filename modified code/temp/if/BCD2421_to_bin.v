`timescale 1ns/1ps

module BCD2421_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)  
        begin
            if (! A[3]) //0
                begin
                    if (! A[2]) //00
                        begin
                            if (! A[1]) //000
                                Y = (A[0]) ? 4'b0001 : 4'b0000; //0001 or 0000
                            else //001
                                Y = (A[0]) ? 4'b0011 : 4'b0010; //0011 or 0010
                        end
                    else //01
                        begin
                            if (! A[1]) //010
                                Y = (A[0]) ? 4'b0000 : 4'b0100; //0101 or 0100
                            else //011
                                Y = 4'b0000; //0111 or 0110
                        end
                end
            else //1
                begin
                    if (! A[2]) //10
                        begin
                            if (! A[1]) //100
                                Y = 4'b0000; //1001 or 1000
                            else //101
                                Y = (A[0]) ? 4'b0101 : 4'b0000; //1011 or 1010
                        end
                    else //11
                        begin
                            if (! A[1]) //110
                                Y = (A[0]) ? 4'b0111 : 4'b0110; //1101 or 1100
                            else //1110
                                Y = (A[0]) ? 4'b1001 : 4'b1000; //1111 or 1110
                        end
                end
        end        
endmodule