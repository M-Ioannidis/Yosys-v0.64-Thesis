`timescale 1ns/1ps

module XS3_Gray (input wire[3:0]A, output reg [3:0]Y);
  always @(*)  
    begin
        if (! A[3]) //0
            begin
                if (! A[3])
                    begin
                        if (! A[3])
                            begin 
                                if (! A[2]) //00
                                    begin
                                        if (! A[2]) //00
                                            begin
                                                if (! A[2]) //00
                                                    begin
                                                        if (! A[1]) //000
                                                            begin 
                                                                if (! A[1]) //000
                                                                    begin
                                                                        if (! A[1]) //000
                                                                            Y = (A[0]) ? 4'b0110 : 4'b0010; //0001 or 0000
                                                                        else //001
                                                                            Y = (A[0]) ? 4'b0101 : 4'b0111; //0011 or 0010
                                                                    end 
                                                                else //001
                                                                    Y = (A[0]) ? 4'b0101 : 4'b0111; //0011 or 0010
                                                            end 
                                                        else //001
                                                            Y = (A[0]) ? 4'b0101 : 4'b0111; //0011 or 0010
                                                    end
                                                else //01
                                                    begin
                                                        if (! A[1]) //010
                                                            begin 
                                                                if (! A[1]) //010
                                                                    begin
                                                                        if (! A[1]) //010
                                                                            Y = (A[0]) ? 4'b1100 : 4'b0100; //0101 or 0100
                                                                        else //001
                                                                            Y = (A[0]) ? 4'b1010 : 4'b1110; //0111 or 0110
                                                                    end 
                                                                else //001
                                                                    Y = (A[0]) ? 4'b1010 : 4'b1110; //0111 or 0110
                                                            end 
                                                        else //001
                                                            Y = (A[0]) ? 4'b1010 : 4'b1110; //0111 or 0110
                                                    end
                                            end
                                        else //01
                                            begin
                                                if (! A[1]) //010
                                                    begin 
                                                        if (! A[1]) //010
                                                            begin
                                                                if (! A[1]) //010
                                                                    Y = (A[0]) ? 4'b1100 : 4'b0100; //0101 or 0100
                                                                else //001
                                                                    Y = (A[0]) ? 4'b1010 : 4'b1110; //0111 or 0110
                                                            end 
                                                        else //001
                                                            Y = (A[0]) ? 4'b1010 : 4'b1110; //0111 or 0110
                                                    end 
                                                else //001
                                                    Y = (A[0]) ? 4'b1010 : 4'b1110; //0111 or 0110
                                            end
                                    end
                                else //01
                                    begin
                                        if (! A[1]) //010
                                            begin 
                                                if (! A[1]) //010
                                                    begin
                                                        if (! A[1]) //010
                                                            Y = (A[0]) ? 4'b1100 : 4'b0100; //0101 or 0100
                                                        else //001
                                                            Y = (A[0]) ? 4'b1010 : 4'b1110; //0111 or 0110
                                                    end 
                                                else //001
                                                    Y = (A[0]) ? 4'b1010 : 4'b1110; //0111 or 0110
                                            end 
                                        else //011
                                            Y = (A[0]) ? 4'b1111 : 4'b1101; //0111 or 0110
                                    end
                            end
                        else
                            begin
                                if (! A[2]) //10
                                    begin
                                        if (! A[1]) //100
                                            Y = (A[0]) ? 4'b1010 : 4'b1110; //1001 or 1000
                                        else //101
                                            Y = 4'b0000;
                                    end
                                else //11
                                    Y = 4'b0000;
                            end
                    end
                else 
                    begin
                        if (! A[2]) //10
                            begin
                                if (! A[2]) //10
                                    begin
                                        if (! A[2]) //10
                                            begin
                                                if (! A[1]) //100
                                                    begin 
                                                        if (! A[1]) //100
                                                            begin
                                                                if (! A[1]) //100
                                                                    Y = (A[0]) ? 4'b1010 : 4'b1110; //1001 or 1000
                                                                else //100
                                                                    Y = 4'b0000;
                                                            end 
                                                        else //100
                                                            Y = 4'b0000;
                                                    end 
                                                else //100
                                                    Y = 4'b0000;
                                            end
                                        else //11
                                            begin
                                                if (! A[1]) //110
                                                    begin 
                                                        if (! A[1]) //110
                                                            begin
                                                                if (! A[1]) //110
                                                                    Y = (A[0]) ? 4'b1001 : 4'b1011; //1101 or 1100
                                                                else //001
                                                                    Y = 4'b0000;
                                                            end 
                                                        else //001
                                                            Y = 4'b0000;
                                                    end 
                                                else //001
                                                    Y = 4'b0000;
                                            end
                                    end
                                else //01
                                    begin
                                        if (! A[1]) //000
                                            begin 
                                                if (! A[1]) //000
                                                    begin
                                                        if (! A[1]) //000
                                                            Y = (A[0]) ? 4'b1001 : 4'b1011; //1001 or 1000
                                                        else //001
                                                            Y = 4'b0000;
                                                    end 
                                                else //001
                                                    Y = 4'b0000;
                                            end 
                                        else //001
                                            Y = 4'b0000;
                                    end
                            end
                        else //11
                            Y = 4'b0000;
                    end
            end
        else //1
            begin
                if (A[3]) //1
                    begin
                        if (!A[2]) //10
                            begin
                                if (A[2]) //1x
                                    begin
                                        Y = 4'bxxxx;
                                    end
                                else
                                    begin
                                        if (!A[2]) //10
                                            begin
                                                if (!A[1]) //100
                                                    begin
                                                        if (A[1]) //10x
                                                            begin
                                                                Y = 4'bxxxx;
                                                            end
                                                        else
                                                            begin
                                                                if (!A[0]) //1000
                                                                    begin
                                                                        if(A[0]) //100x
                                                                            Y = 4'bxxxx;
                                                                        else 
                                                                            begin
                                                                                if(A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else 
                                                                                    begin
                                                                                        Y = A[0] ? 4'b1010 : 4'b1110;
                                                                                    end  
                                                                            end
                                                                    end
                                                                else //1001
                                                                    begin
                                                                        if(A[0])
                                                                            begin
                                                                                if(!A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else
                                                                                    begin
                                                                                        Y = A[0] ? 4'b1010 : 4'b1110;
                                                                                    end
                                                                            end
                                                                        else
                                                                            Y = 4'bxxxx;
                                                                    end
                                                            end 
                                                    end
                                                else
                                                    begin
                                                        if (!A[1])
                                                            begin
                                                                Y = 4'bxxxx;
                                                            end
                                                        else
                                                            begin
                                                                if (!A[0])
                                                                    begin
                                                                        if(A[0])
                                                                            begin
                                                                                if(!A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else
                                                                                    begin
                                                                                        Y = 4'b0000;
                                                                                    end
                                                                            end
                                                                        else
                                                                            begin
                                                                                if(A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else 
                                                                                    begin
                                                                                        Y = 4'b0000;
                                                                                    end  
                                                                            end
                                                                    end
                                                                else
                                                                    begin
                                                                        if(A[0])
                                                                            begin
                                                                                if(!A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else
                                                                                    begin
                                                                                        Y = 4'b0000;
                                                                                    end
                                                                            end
                                                                        else
                                                                            begin
                                                                                if(A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else 
                                                                                    begin
                                                                                        Y = 4'b0000;
                                                                                    end  
                                                                            end
                                                                    end
                                                            end 
                                                    end
                                            end
                                        else
                                            begin
                                                Y = 4'bxxxx;
                                            end
                                    end
                            end
                        else
                            begin
                                if (!A[2])
                                    begin
                                        Y = 4'bxxxx;
                                    end
                                else
                                    begin
                                        if (A[2])
                                            begin
                                                if (!A[1])
                                                    begin
                                                        if (A[1])
                                                            begin
                                                                Y = 4'bxxxx;
                                                            end
                                                        else
                                                            begin
                                                                if (!A[0])
                                                                    begin
                                                                        if(A[0])
                                                                            begin
                                                                                if(!A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else
                                                                                    begin
                                                                                        Y = 4'b0000;
                                                                                    end
                                                                            end
                                                                        else
                                                                            begin
                                                                                if(A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else 
                                                                                    begin
                                                                                        Y = 4'b0000;
                                                                                    end  
                                                                            end
                                                                    end
                                                                else
                                                                    begin
                                                                        if(A[0])
                                                                            begin
                                                                                if(!A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else
                                                                                    begin
                                                                                        Y = 4'b0000;
                                                                                    end
                                                                            end
                                                                        else
                                                                            begin
                                                                                if(A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else 
                                                                                    begin
                                                                                        Y = 4'b0000;
                                                                                    end  
                                                                            end
                                                                    end
                                                            end 
                                                    end
                                                else
                                                    begin
                                                        if (!A[1])
                                                            begin
                                                                Y = 4'bxxxx;
                                                            end
                                                        else
                                                            begin
                                                                if (!A[0])
                                                                    begin
                                                                        if(A[0])
                                                                            begin
                                                                                if(!A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else
                                                                                    begin
                                                                                        Y = 4'b0000;
                                                                                    end
                                                                            end
                                                                        else
                                                                            begin
                                                                                if(A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else 
                                                                                    begin
                                                                                        Y = 4'b0000;
                                                                                    end  
                                                                            end
                                                                    end
                                                                else
                                                                    begin
                                                                        if(A[0])
                                                                            begin
                                                                                if(!A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else
                                                                                    begin
                                                                                        Y = 4'b0000;
                                                                                    end
                                                                            end
                                                                        else
                                                                            begin
                                                                                if(A[0])
                                                                                    begin
                                                                                        Y = 4'bxxxx;
                                                                                    end
                                                                                else 
                                                                                    begin
                                                                                        Y = 4'b0000;
                                                                                    end  
                                                                            end
                                                                    end
                                                            end 
                                                    end
                                            end
                                        else
                                            begin
                                                Y = 4'bxxxx;
                                            end
                                    end
                            end
                    end
                else 
                    if (!A[3]) //x
                        Y = 4'bxxxx;
                    else //11
                        begin
                            if (!A[2])
                                begin
                                    if (A[2])
                                        begin
                                            Y = 4'bxxxx;
                                        end
                                    else
                                        begin
                                            if (!A[2])
                                                begin
                                                    if (!A[1])
                                                        begin
                                                            if (A[1])
                                                                begin
                                                                    Y = 4'bxxxx;
                                                                end
                                                            else
                                                                begin
                                                                    if (!A[0])
                                                                        begin
                                                                            if(A[0])
                                                                                begin
                                                                                    if(!A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end
                                                                                end
                                                                            else
                                                                                begin
                                                                                    if(A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else 
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end  
                                                                                end
                                                                        end
                                                                    else
                                                                        begin
                                                                            if(A[0])
                                                                                begin
                                                                                    if(!A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end
                                                                                end
                                                                            else
                                                                                begin
                                                                                    if(A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else 
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end  
                                                                                end
                                                                        end
                                                                end 
                                                        end
                                                    else
                                                        begin
                                                            if (!A[1])
                                                                begin
                                                                    Y = 4'bxxxx;
                                                                end
                                                            else
                                                                begin
                                                                    if (!A[0])
                                                                        begin
                                                                            if(A[0])
                                                                                begin
                                                                                    if(!A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end
                                                                                end
                                                                            else
                                                                                begin
                                                                                    if(A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else 
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end  
                                                                                end
                                                                        end
                                                                    else
                                                                        begin
                                                                            if(A[0])
                                                                                begin
                                                                                    if(!A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end
                                                                                end
                                                                            else
                                                                                begin
                                                                                    if(A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else 
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end  
                                                                                end
                                                                        end
                                                                end 
                                                        end
                                                end
                                            else
                                                begin
                                                    Y = 4'bxxxx;
                                                end
                                        end
                                end
                            else
                                begin
                                    if (!A[2])
                                        begin
                                            Y = 4'bxxxx;
                                        end
                                    else
                                        begin
                                            if (A[2])
                                                begin
                                                    if (!A[1])
                                                        begin
                                                            if (A[1])
                                                                begin
                                                                    Y = 4'bxxxx;
                                                                end
                                                            else
                                                                begin
                                                                    if (!A[0])
                                                                        begin
                                                                            if(A[0])
                                                                                begin
                                                                                    if(!A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end
                                                                                end
                                                                            else
                                                                                begin
                                                                                    if(A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else 
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end  
                                                                                end
                                                                        end
                                                                    else
                                                                        begin
                                                                            if(A[0])
                                                                                begin
                                                                                    if(!A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end
                                                                                end
                                                                            else
                                                                                begin
                                                                                    if(A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else 
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end  
                                                                                end
                                                                        end
                                                                end 
                                                        end
                                                    else
                                                        begin
                                                            if (!A[1])
                                                                begin
                                                                    Y = 4'bxxxx;
                                                                end
                                                            else
                                                                begin
                                                                    if (!A[0])
                                                                        begin
                                                                            if(A[0])
                                                                                begin
                                                                                    if(!A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end
                                                                                end
                                                                            else
                                                                                begin
                                                                                    if(A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else 
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end  
                                                                                end
                                                                        end
                                                                    else
                                                                        begin
                                                                            if(A[0])
                                                                                begin
                                                                                    if(!A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end
                                                                                end
                                                                            else
                                                                                begin
                                                                                    if(A[0])
                                                                                        begin
                                                                                            Y = 4'bxxxx;
                                                                                        end
                                                                                    else 
                                                                                        begin
                                                                                            Y = 4'b0000;
                                                                                        end  
                                                                                end
                                                                        end
                                                                end 
                                                        end
                                                end
                                            else
                                                begin
                                                    Y = 4'bxxxx;
                                                end
                                        end
                                end
                        end
            end
    end
endmodule