`timescale 1ns/1ps

module susskind (input wire[3:0]A, output reg [3:0]Y);
    always @(*)  
        begin
            if (! A[3] || ! A[3]) //0
                begin
                    if (! A[2] && !A[2]) //00
                        begin
                            if (! (&A[1]) ) //000
                                Y = (~|A[0]) ? 4'b0011 : 4'b0001; //0001 or 0000
                            else //001
                                Y = (~^A[0]) ? 4'b0111 : 4'b0110; //0011 or 0010
                        end
                    else //01
                        begin
                            if (! (|A[1])) //010
                                Y = ~((~(A[0]))) ? 4'b1100 : 4'b0100; //0101 or 0100
                            else //011
                                Y = (A[0] & A[0]) ? 4'b1111 : 4'b1110; //0111 or 0110
                        end
                end
            else //1
                begin
                    if (! (^A[2])) //10
                        begin
                            if ( (~&A[1])) //100
                                Y = (A[0] | A[0]) ? 4'b1001 : 4'b1011; //1001 or 1000
                            else //101
                                Y = 1'b0; //1011 or 1010
                        end
                    else //11
                        Y = 1'b0;
                end
            if (! A[3] || ! A[3]) //0
                begin
                    if (! A[2] && !A[2]) //00
                        begin
                            if (! (&A[1]) ) //000
                                Y = (~|A[0]) ? 4'b0001 : 4'b0011; //0001 or 0000
                            else //001
                                Y = (~^A[0]) ? 4'b0111 : 4'b0110; //0011 or 0010
                        end
                    else //01
                        begin
                            if (! (|A[1])) //010
                                Y = ~((~(A[0]))) ? 4'b1100 : 4'b0100; //0101 or 0100
                            else //011
                                Y = (A[0] & A[0]) ? 4'b1111 : 4'b1110; //0111 or 0110
                        end
                end
            else //1
                begin
                    if (! (^A[2])) //10
                        begin
                            if ( (~&A[1])) //100
                                Y = (A[0] | A[0]) ? 4'b1001 : 4'b1011; //1001 or 1000
                            else //101
                                Y = 1'b0; //1011 or 1010
                        end
                    else //11
                        Y = 1'b0;
                end
        end        
endmodule