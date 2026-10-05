`timescale 1ns/1ps

module gray_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)  
        begin
        if (A[3]) //1
            begin
                if (A[2]) //11
                    begin
                        if (A[1]) //111
                            begin
                                if (A[0])
                                    Y = 4'b1010; //1111 or 1110
                                else
                                    Y = 4'b1011;
                            end
                        else //110
                            begin
                                if (A[0])
                                    Y = 4'b1001; //1101 or 1100
                                else
                                    Y = 4'b1000;
                            end
                    end
                else //10
                    begin
                        if (A[1]) //101
                            begin
                                if (A[0])
                                    Y = 4'b1101; //1011 or 1010
                                else
                                    Y = 4'b1100;
                            end
                        else //100
                            begin
                                if (A[0])
                                    Y = 4'b1110; //1001 or 1000
                                else
                                    Y = 4'b1111;
                            end
                    end
            end
        else //0
            begin
                if (A[2]) //01
                    begin
                        if (A[1]) //011
                            begin
                                if (A[0])
                                    Y = 4'b0101; //0111 or 0110
                                else
                                    Y = 4'b0100;
                            end
                        else //010
                            begin
                                if (A[0])
                                    Y = 4'b0110; //0101 or 0100
                                else
                                    Y = 4'b0111;
                            end
                    end
                else //00
                    begin
                        if (A[1]) //001
                            begin
                                if (A[0])
                                    Y = 4'b0010; //0011 or 0010
                                else
                                    Y = 4'b0011;
                            end
                        else //000
                            begin
                                if (A[0])
                                    Y = 4'b0001; //0001 or 0000
                                else
                                    Y = 4'b0000;
                            end
                    end
            end
    end        
endmodule