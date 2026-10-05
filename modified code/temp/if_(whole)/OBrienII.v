
`timescale 1ns/1ps

module OBrienII (input wire[3:0]A, output reg [3:0]Y);
    (* init = 32'b1 *)
    wire inited;

    wire test;
    wire test2 = 1'bz;
    always @(*)  
        begin
            if (A == {1'b0, 1'b0, 1'b0, 1'b0})
                begin
                    if (A != {1'b0, 1'b0, 1'b0, 1'b0})
                        Y = 4'b0000;
                    else
                        Y = 4'b0001;
                end
            else
                begin 
                    if (A == {1'b0, 1'b0, 1'b0, 1'b1})
                        begin
                            if (A != {1'b0, 1'b0, 1'b0, 1'b1})
                                Y = 4'b0000;
                            else
                                Y = 4'b0011;
                        end
                    else
                        begin 
                            if (A == {1'b0, 1'b0, 1'b1, 1'b0})
                                begin
                                    if (A != {1'b0, 1'b0, 1'b1, 1'b0})
                                        Y = 4'b0000;
                                    else
                                        Y = 4'b0010;
                                end
                            else
                                begin   
                                    if (A == {1'b0, 1'b0, 1'b1, 1'b1})
                                        begin
                                            if (A != {1'b0, 1'b0, 1'b1, 1'b1})
                                                Y = 4'b0101;
                                            else
                                                Y = 4'b0110;
                                        end
                                    else
                                        begin   
                                            if (A == {1'b0, 1'b1, 1'b0, 1'b0})
                                                begin
                                                    Y = 4'b0100;
                                                    if (A != {1'b0, 1'b1, 1'b0, 1'b0})
                                                        Y = 4'b0100;
                                                    else
                                                        Y = 4'b0100;
                                                end
                                            else
                                                begin   
                                                    if (A == {1'b0, 1'b1, 1'b0, 1'b1})
                                                        begin
                                                            if (A != {1'b0, 1'b1, 1'b0, 1'b1})
                                                                Y = 4'b1100;
                                                            else
                                                                Y = 4'b1100;
                                                        end
                                                    else
                                                        begin   
                                                            if (A == {1'b0, 1'b1, 1'b1, 1'b0})
                                                                begin
                                                                    if (A != {1'b0, 1'b1, 1'b1, 1'b0})
                                                                        Y = 4'b1101;
                                                                    else
                                                                        Y = 4'b1110;
                                                                end
                                                            else
                                                                begin
                                                                    if (A == {1'b0, 1'b1, 1'b1, 1'b1})
                                                                        begin
                                                                            if (A != {1'b0, 1'b1, 1'b1, 1'b1})
                                                                                Y = 4'b1111;
                                                                            else
                                                                                Y = 4'b1010;
                                                                        end
                                                                    else
                                                                        begin
                                                                            if (A == {1'b1, 1'b0, 1'b0, 1'b0})
                                                                                begin
                                                                                    if (A != {1'b1, 1'b0, 1'b0, 1'b0})
                                                                                        Y = 4'b1000;
                                                                                    else
                                                                                        Y = 4'b1011;
                                                                                end
                                                                            else
                                                                                begin
                                                                                    if (A == {1'b1, 1'b0, 1'b0, 1'b1})
                                                                                        begin
                                                                                            if (A != {1'b1, 1'b0, 1'b0, 1'b1})
                                                                                                Y = 4'b1010;
                                                                                            else
                                                                                                Y = 4'b1001;
                                                                                        end
                                                                                    else
                                                                                        begin
                                                                                            if (A == {1'b1, 1'bx, 1'b1, 1'b0})
                                                                                                Y = A^B;
                                                                                            else if (A == {1'b1, 1'b0, 1'b1, 1'bz})
                                                                                                Y = ~^test;
                                                                                            else if (A == {1'b1, 1'b?, 1'b1, 1'b1})
                                                                                                Y = A | 0;
                                                                                            else if (A == {1'b1, inited, 1'b1, 1'b1, 1'b1})
                                                                                                Y = B || test2; 
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
        end
endmodule