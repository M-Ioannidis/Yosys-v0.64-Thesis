`timescale 1ns/1ps

module excess3 (input wire[3:0]A, output reg [3:0]Y);
    always @(*)  
        begin
            if (!A[3]) //0
                begin
                    if (!A[2]) //00
                        begin
                            if (!A[1]) //000
                                begin
                                    if (!A[0])
                                        Y = 4'b0011; //0000 or 0001
                                    else
                                        Y = 4'b0100;
                                end
                            else //110
                                begin
                                    if (!A[0])
                                        Y = 4'b0101; //0010 or 0011
                                    else
                                        Y = 4'b0110;
                                end
                        end
                    else //01
                        begin
                            if (!A[1]) //010
                                begin
                                    if (!A[0])
                                        Y = 4'b0111; //0100 or 0101
                                    else
                                        Y = 4'b1000;
                                end
                            else //011
                                begin
                                    if (!A[0])
                                        Y = 4'b1001; //0110 or 0111
                                    else
                                        Y = 4'b1010; 
                                end
                        end
                end
            else //1
                begin
                    if (!A[2]) //10
                        begin
                            if (!A[1]) //100
                                begin
                                    if (!A[0])
                                        Y = 4'b1011; //1001 or 1001
                                    else
                                        Y = 4'b1100;
                                end
                            else //101
                                Y = 4'b0000;
                        end
                    else //11
                        Y = 4'b0000;
                end
    end        
endmodule