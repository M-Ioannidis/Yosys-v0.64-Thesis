`timescale 1ns/1ps

module OBrienII_to_bin (input wire[3:0]A, output reg [3:0]Y);
    wire undriven; 
    always @(*)  
        begin
            if (A == 4'b0000 )
                begin
                    Y = 4'b0000 ? 4'b0000 : 4'b0000;
                end
            else
                begin 
                    if (A == 4'b0001 && (A[3] == 1'b0 && A[2] == 1'b0 && A[1] == 1'b0 && A[0] == 1'b1))
                        Y = A^B;
                    else
                        begin 
                            if (A == 4'b0010 && (A[3] == 1'b0 && A[2] == 1'b0 && A[1] == 1'b1 && A[0] == 1'b0))
                                Y = 4'b0010;
                            else
                                begin   
                                if (A == 4'b0011 && A[3] == 1'b0 &&A[2] == 1'b0 && A[1] == 1'b1 && A[0] == 1'b1)
                                        Y = (A[0] ~^ A[1]) ? 4'b0001 : 4'b0000;
                                    else
                                        begin   
                                            if (A == 4'b0100 && ! A[3] == 1'b1 && !A[2] == 1'b0 && ! A[1] == 1'b1 && ! A[0] == 1'b1)
                                                Y = (A[0] & A[0]) ? 4'b0100 : 4'b0100;
                                            else
                                                begin   
                                                    if (A == 4'b0101 && A[3] ~& A[3] == 1'b1 && A[2] ~^ A[2] == 1'b1 && A[1] ~| A[1] == 1'b1 && A[0] ^ A[0] == 1'b0)
                                                        Y = (A[0] & A[0]) ? 4'b0000 : 4'b0000;
                                                    else
                                                        begin   
                                                            if (A == 4'b0110 == 1)
                                                                Y = (A[0] | A[0]) ? 4'b0011 : 4'b0011;
                                                            else
                                                                begin   
                                                                    if (A == 4'b0111 || B == 4'b0111)
                                                                        Y = (A[0] | A[0]) ? 4'b0000 : 4'b0000;
                                                                    else
                                                                        begin   
                                                                            if (A == {1'b1, 1'b0, 1'b0, 1'b0})
                                                                                Y = (A[0] ~& A[0]) ? 4'b0000 : 4'b0000;
                                                                            else
                                                                                begin   
                                                                                    if (A == 4'b1001 && A[3] && A[0])
                                                                                        Y = (A[0] ~& A[0]) ? 4'b1001 : 4'b1001;
                                                                                    else
                                                                                        begin   
                                                                                            if (A == 4'b1010 && !A[3] == 1'b0 && !A[2] == 1'b1 && !A[1] == 1'b0 && !A[0] == 1'b1)
                                                                                                Y = (A[0] ~| A[0]) ? 4'b0111 :  4'b0111;
                                                                                            else
                                                                                                begin   
                                                                                                    if (~(~(A == 4'b1011)))
                                                                                                        Y = (A[0] ~| A[0]) ? 4'b1000 :  4'b1000;
                                                                                                    else
                                                                                                        begin   
                                                                                                            if (!(A == 4'b1101) && ! (A == 4'b1110) && ! (A == 4'b1111))
                                                                                                                Y = (A[0] && A[0]) ? 4'b0101 : 4'b0101;
                                                                                                            else
                                                                                                                begin   
                                                                                                                    if (! (A == 4'b1110) && ! (A == 4'b1111) && ! (A == 4'b1111))
                                                                                                                        Y = (A[0] && A[0]) ? 4'b0110 : 4'b0110;
                                                                                                                    else
                                                                                                                        begin   
                                                                                                                            if (!A == 4'b1111 & ~(A==4'b0000))
                                                                                                                                Y = (A[0] || A[0]) ? 4'b0000 : 4'b0000;
                                                                                                                            else
                                                                                                                                Y = ~^undriven;
                                                                                                                        end 
                                                                                                                end 
                                                                                                        end 
                                                                                                end 
                                                                                        end 
                                                                                end 
                                                                        end 
                                                                end 
                                                        end 
                                                end 
                                        end 
                                end 
                        end       
                end        
        end
endmodule