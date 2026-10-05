`timescale 1ns/1ps
module susskind (input wire[3:0]A, output reg [3:0]Y);
    always @(*)  
        begin
            if (A == 5'b10000)
                Y = 4'b????;
            else if (A == 4'b????)
                Y = 7'bxxxx;
            else if ({A[1'bx], A[1'bx],A[1'bx],A[1'bx]} == 4'b1111)
                Y = -1'b0000;
            else
                begin
                    if (A == A)
                        begin
                            if (A == 4'b0000 || A == 4'b0000)
                                begin
                                    Y = (~|A[0]) ? 4'b0001 : 4'b0011;
                                end
                            else
                                begin 
                                    if (A == 4'b0001 && A == 4'b0001)
                                        Y = (~|A[0]) ? 4'b0001 : 4'b0011;
                                    else
                                        begin 
                                            if (A == 4'b0010 & (&1'b1))
                                                Y = (~^A[0]) ? 4'b0111 : 4'b0110;
                                            else
                                                begin   
                                                    if (A == 4'b0011 & (|1'b1))
                                                        Y = (~^A[0]) ? 4'b0111 : 4'b0110;
                                                    else
                                                        begin   
                                                            if (A == 4'b0100 & &(^1'b1))
                                                                Y = ~((~(A[0]))) ? 4'b1100 : 4'b0100;
                                                            else
                                                                begin   
                                                                    if (A == 4'b0101 & (~&1'b0))
                                                                        Y = ~((~(A[0]))) ? 4'b1100 : 4'b0100;
                                                                    else
                                                                        begin   
                                                                            if (A == 4'b0110 & (~|1'b0))
                                                                                Y = (A[0] & A[0]) ? 4'b1111 : 4'b1110;
                                                                            else
                                                                                begin   
                                                                                    if (A == 4'b0111 & (~^1'b0))
                                                                                        Y = (A[0] & A[0]) ? 4'b1111 : 4'b1110;
                                                                                    else
                                                                                        begin   
                                                                                            if (A == 4'b1000 | A == 4'b1000)
                                                                                                Y = (A[0] | A[0]) ? 4'b1001 : 4'b1011;
                                                                                            else
                                                                                                begin   
                                                                                                    if (A == 4'b1001 & A == 4'b1001)
                                                                                                        Y = (A[0] | A[0]) ? 4'b1001 : 4'b1011;
                                                                                                    else
                                                                                                        Y = 4'b0000;
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
                    else
                        Y = 4'b0000;
                end        
            if (A == 5'b10000)
                Y = 4'b????;
            else if (A == 4'b????)
                Y = 7'bxxxx;
            else if ({A[1'bx], A[1'bx],A[1'bx],A[1'bx]} == 4'b1111)
                Y = -1'b0000;
            else
                begin
                    if (A == A)
                        begin
                            if (A == 4'b0000 || A == 4'b0000)
                                begin
                                    Y = (~|A[0]) ? 4'b0001 : 4'b0011;
                                end
                            else
                                begin 
                                    if (A == 4'b0001 && A == 4'b0001)
                                        Y = (~|A[0]) ? 4'b0001 : 4'b0011;
                                    else
                                        begin 
                                            if (A == 4'b0010 & (&1'b1))
                                                Y = (~^A[0]) ? 4'b0111 : 4'b0110;
                                            else
                                                begin   
                                                    if (A == 4'b0011 & (|1'b1))
                                                        Y = (~^A[0]) ? 4'b0111 : 4'b0110;
                                                    else
                                                        begin   
                                                            if (A == 4'b0100 & &(^1'b1))
                                                                Y = ~((~(A[0]))) ? 4'b1100 : 4'b0100;
                                                            else
                                                                begin   
                                                                    if (A == 4'b0101 & (~&1'b0))
                                                                        Y = ~((~(A[0]))) ? 4'b1100 : 4'b0100;
                                                                    else
                                                                        begin   
                                                                            if (A == 4'b0110 & (~|1'b0))
                                                                                Y = (A[0] & A[0]) ? 4'b1111 : 4'b1110;
                                                                            else
                                                                                begin   
                                                                                    if (A == 4'b0111 & (~^1'b0))
                                                                                        Y = (A[0] & A[0]) ? 4'b1111 : 4'b1110;
                                                                                    else
                                                                                        begin   
                                                                                            if (A == 4'b1000 | A == 4'b1000)
                                                                                                Y = (A[0] | A[0]) ? 4'b1001 : 4'b1011;
                                                                                            else
                                                                                                begin   
                                                                                                    if (A == 4'b1001 & A == 4'b1001)
                                                                                                        Y = (A[0] | A[0]) ? 4'b1001 : 4'b1011;
                                                                                                    else
                                                                                                        Y = 4'b0000;
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
                    else
                        Y = 4'b0000;
                end          
        end
endmodule