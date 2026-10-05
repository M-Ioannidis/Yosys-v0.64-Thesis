`timescale 1ns/1ps

module XS3_Gray_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)
        begin
            case(A[3])
                1'b1: begin //1
                    if (A[3])
                        begin 
                            case(A[2])
                                1'b1: begin //11
                                    if (A[2])
                                        begin
                                            case(A[1])
                                                1'b1: begin //111
                                                    if(A[1])
                                                        begin
                                                            case(A[0])
                                                                1'b1:begin //1111
                                                                    if(A[0])
                                                                        Y = 4'b0111;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                                1'b0: begin //1110
                                                                    if(!A[0])
                                                                        Y = 4'b1000;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                            endcase
                                                        end
                                                    else
                                                        Y = 4'bxxxx;
                                                end
                                                1'b0: begin
                                                    if(!A[1]) //110
                                                        begin
                                                            case(A[0])
                                                                1'b1:begin
                                                                    if(A[0]) //1101
                                                                        Y = 4'b0110;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                                1'b0: begin
                                                                    if(!A[0]) //1100
                                                                        Y = 4'b0101;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                            endcase
                                                        end
                                                    else
                                                        Y = 4'bxxxx;
                                                end
                                            endcase
                                        end
                                    else
                                        Y = 4'bxxxx;
                                end
                                1'b0: begin
                                    if (!A[2]) //10
                                        begin
                                            case(A[1])
                                                1'b1: begin
                                                    if(A[1]) //101
                                                        begin
                                                            case(A[0])
                                                                1'b1:begin
                                                                    if(A[0]) //1011
                                                                        Y = 4'b0000;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                                1'b0: begin
                                                                    if(!A[0]) //1010
                                                                        Y = 4'b1001;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                            endcase
                                                        end
                                                    else
                                                        Y = 4'bxxxx;
                                                end
                                                1'b0: begin
                                                    if(!A[1])
                                                        begin
                                                            case(A[0])
                                                                1'b1:begin
                                                                    if(A[0])
                                                                        Y = 4'b0000;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                                1'b0: begin
                                                                    if(!A[0])
                                                                        Y = 4'b0000;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                            endcase
                                                        end
                                                    else
                                                        Y = 4'bxxxx;
                                                end
                                            endcase
                                        end
                                    else
                                        begin
                                            if (!A[2])
                                                begin
                                                    case(A[1])
                                                        1'b1: begin
                                                            if(A[1])
                                                                begin
                                                                    case(A[0])
                                                                        1'b1:begin
                                                                            if(A[0])
                                                                                Y = 4'b0000;
                                                                            else
                                                                                Y = 4'bxxxx;
                                                                        end
                                                                        1'b0: begin
                                                                            if(!A[0])
                                                                                Y = 4'b0000;
                                                                            else
                                                                                Y = 4'bxxxx;
                                                                        end
                                                                    endcase
                                                                end
                                                            else
                                                                Y = 4'bxxxx;
                                                        end
                                                        1'b0: begin
                                                            if(!A[1])
                                                                begin
                                                                    case(A[0])
                                                                        1'b1:begin
                                                                            if(A[0])
                                                                                Y = 4'b0000;
                                                                            else
                                                                                Y = 4'bxxxx;
                                                                        end
                                                                        1'b0: begin
                                                                            if(!A[0])
                                                                                Y = 4'b0000;
                                                                            else
                                                                                Y = 4'bxxxx;
                                                                        end
                                                                    endcase
                                                                end
                                                            else
                                                                Y = 4'bxxxx;
                                                        end
                                                    endcase
                                                end
                                            else
                                                Y = 4'bxxxx;
                                        end
                                end
                            endcase
                        end
                    else
                        Y = 4'b0000;
                end
                1'b0: begin //0
                    if (!A[3])
                        begin
                            case(A[2])
                                1'b1: begin //01
                                    if (A[2])
                                        begin
                                            case(A[1])
                                                1'b1: begin
                                                    if(A[1])
                                                        begin
                                                            case(A[0])
                                                                1'b1:begin
                                                                    if(A[0]) //0111
                                                                        Y = 4'b0010;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                                1'b0: begin
                                                                    if(!A[0]) //0110
                                                                        Y = 4'b0001;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                            endcase
                                                        end
                                                    else
                                                        Y = 4'bxxxx;
                                                end
                                                1'b0: begin
                                                    if(!A[1])
                                                        begin
                                                            case(A[0])
                                                                1'b1:begin
                                                                    if(A[0]) //0101
                                                                        Y = 4'b0011;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                                1'b0: begin
                                                                    if(!A[0]) //0100
                                                                        Y = 4'b0100;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                            endcase
                                                        end
                                                    else
                                                        Y = 4'bxxxx;
                                                end
                                            endcase
                                        end
                                    else
                                        Y = 4'bxxxx;
                                end
                                1'b0: begin
                                    if (!A[2])
                                        begin
                                            case(A[1])
                                                1'b1: begin
                                                    if(A[1])
                                                        begin
                                                            case(A[0])
                                                                1'b1:begin
                                                                    if(A[0]) //0011
                                                                        Y = 4'b0000;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                                1'b0: begin
                                                                    if(!A[0]) //0010
                                                                        Y = 4'b0000;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                            endcase
                                                        end
                                                    else
                                                        Y = 4'bxxxx;
                                                end
                                                1'b0: begin
                                                    if(!A[1])
                                                        begin
                                                            case(A[0])
                                                                1'b1:begin
                                                                    if(A[0]) //0001
                                                                        Y = 4'b0000;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                                1'b0: begin
                                                                    if(!A[0]) //0000
                                                                        Y = 4'b0000;
                                                                    else
                                                                        Y = 4'bxxxx;
                                                                end
                                                            endcase
                                                        end
                                                    else
                                                        Y = 4'bxxxx;
                                                end
                                            endcase
                                        end
                                    else
                                        Y = 4'bxxxx;
                                    end
                                endcase
                        end
                    else
                        Y = 4'b0000;
                end
            endcase
        end
endmodule