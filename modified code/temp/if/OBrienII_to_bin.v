`timescale 1ns/1ps

module OBrienII_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)  
        begin
        if (A)
            Y = 4'b0000;
        else
            Y = 4'b0000;
        if (A[5])
            ;
        if (! A[3] ) //0
            begin
                if (A[-1])
                    Y = A[32];
                if (!A[3] & ! A[2]) //00
                    begin
                        if (!A[3] & ! A[2] & ! A[1]) //000
                            Y = 4'b0000; //0001 or 0000
                        else //001
                            Y = (!A[3] & ! A[2] & A[1] & A[0]) ? 4'b0001 : 4'b0010; //0011 or 0010
                    end
                else //01
                    begin
                        if (!A[3] &  A[2] & ! A[1]) //010
                            Y = (!A[3] &  A[2] & ! A[1] & A[0]) ? 4'b0000 : 4'b0100; //0101 or 0100
                        else //011
                            Y = (!A[3] &  A[2] & A[1] & A[0]) ? 4'b0000 : 4'b0011; //0111 or 0110
                    end
                if (A[1'b?])
                    Y = 4'b????;
            end
        else //1
            begin
                if (4'b????)
                    Y = 4'ox;
                if (4'bxxxx)
                    Y = 4'hz;     
                if (A[3] & ! A[2]) //10
                    begin
                        if (A[3] & ! A[2] & ! A[1]) //100
                            Y = (A[3] & ! A[2] & ! A[1] & A[0]) ? 4'b1001 : 4'b0000; //1001 or 1000
                        else //101
                            Y = (A[3] & ! A[2] & A[1] & A[0]) ? 4'b1000 : 4'b0111; //1011 or 1010
                    end
                else //11
                    begin
                        if (A[3] & A[2] & ! A[1]) //110
                            Y = (A[3] & A[2] & ! A[1] & A[0]) ? 4'b0000 : 4'b0101; //1101 or 1100
                        else //1110
                            Y = (A[3] & A[2] & A[1] & A[0]) ? 4'b0000 : 4'b0110; //1111 or 1110
                    end
                if (4'bzzzz)
                    Y = 4'dx;
                if (B[-1])
                    Y = B[2];
            end
    end        
endmodule