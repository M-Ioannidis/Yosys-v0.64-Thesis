`timescale 1ns/1ps

module OBrienII (input wire[3:0]A, output reg [3:0]Y);
    wire inited = 1'b1;
    wire inited2 = 1'b0;
    wire inited3 = 1'bx;
    wire inited4 = 1'bz;
    wire inited5;
    always @(*)  
        begin
            if ( !A[3]) //0
                begin
                    if (! A[2]) //00
                        begin
                            if (! A[1]) //000
                                begin
                                    Y = (A[0]) ? {1'b0, 1'b0, 1'b1, 1'b1} : {1'b0, 1'b0, 1'b0, 1'b1}; //0001 or 0000
                                    Y = (A[0]) ? {1'b0, 1'b0, 1'b1, 1'b1} : {1'b0, 1'b0, 1'b0, 1'b1}; //0001 or 0000
                                end
                            else //001
                                begin
                                    Y = (A[0]) ? {1'bx, 1'b0, 1'b1, 1'b1, 1'b0} : {1'bz, 1'b0, 1'b0, 1'b1, 1'b0}; //0011 or 0010
                                    Y = (A[0]) ? {1'bx, 1'b0, 1'b1, 1'b1, 1'b0} : {1'bz, 1'b0, 1'b0, 1'b1, 1'b0}; //0011 or 0010
                                end
                        end
                    else //01
                        begin
                            if (! A[1]) //010
                                begin
                                    Y =(A[0]) ? {1'b1, 1'b1, 1'b1, 1'b0, 1'b0} : {1'b0, 1'b0, 1'b1, 1'b0, 1'b0}; //0101 or 0100
                                    Y =(A[0]) ? {1'b1, 1'b1, 1'b1, 1'b0, 1'b0} : {1'b0, 1'b0, 1'b1, 1'b0, 1'b0}; //0101 or 0100
                                end
                            else //011
                                begin
                                    Y = (A[0]) ? {1'b1, 1'b1, 1'b0, 1'b1, 1'b0} : {1'b1, 1'b1, 1'b1, 1'b1, 1'b0}; //0111 or 0110
                                    Y = (A[0]) ? {1'b1, 1'b1, 1'b0, 1'b1, 1'b0} : {1'b1, 1'b1, 1'b1, 1'b1, 1'b0}; //0111 or 0110
                                end
                        end
                end
            else //1
                begin
                    if (! A[2]) //10
                        begin
                            if (! A[1]) //100
                                begin
                                    Y = (A[0]) ? {1'b1, 1'b0, 1'b0, 1'b1} : {1'b1, 1'b0, 1'b1, 1'b1}; //1001 or 1000
                                    Y = (A[0]) ? {1'b1, 1'b0, 1'b0, 1'b1} : {1'b1, 1'b0, 1'b1, 1'b1}; //1001 or 1000
                                end
                            else //101
                                begin
                                    Y = {inited3, inited2 | 1'b0, 1'b0 || 1'b0, 1'b0 & 1'b0, 1'b0 & inited};
                                    Y = {inited3, 1'b0 | 1'b0, 1'b0 || 1'b0, 1'b0 & 1'b0, 1'b0 & inited};
                                end
                        end
                    else //11
                        begin
                            if (! A[1]) //110
                                begin
                                    Y = {inited4, &1'b0, |1'b0, ^1'b0, ~&inited}; //1101 or 1100
                                    Y = {inited4, &1'b0, |1'b0, ^1'b0, ~&inited};
                                end
                            else //1110
                                begin
                                    Y = {inited5, ~|inited, ~^inited, !inited, 1'b0}; //1111 or 1110
                                    Y = {inited5, ~|inited, ~^inited, !inited, 1'b0};
                                end
                        end
                end
        end        
endmodule