`timescale 1ns/1ps

module excess3_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)  
        begin
            if (!A[3]) //0
                begin
                    if (!A[2]) //00
                        Y = 4'b0000;
                    else //01
                        begin
                            if (!A[1]) //010
                                begin
                                    if (!A[0])
                                        Y = 4'b0001; //0100 or 0101
                                    else
                                        Y = 4'b0010;
                                end
                            else //011
                                begin
                                    if (!A[0])
                                        Y = 4'b0011; //0110 or 0111
                                    else
                                        Y = 4'b0100; 
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
                                        Y = 4'b0101; //1000 or 1001
                                    else
                                        Y = 4'b0110;
                                end
                            else //101
                                begin
                                    if (!A[0])
                                        Y = 4'b0111; //1010 or 1011
                                    else
                                        Y = 4'b1000;
                                end
                        end
                    else //11
                        if (!A[1])
                            begin 
                                if (!A[0])
                                    Y = 4'b1001;
                                else
                                    Y = 4'b0000;
                            end
                        else
                            Y = 4'b0000;
                end
        end        
endmodule