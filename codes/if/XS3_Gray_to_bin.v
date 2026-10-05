`timescale 1ns/1ps

module XS3_Gray_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)  
        begin 
            if (A[3])
                begin //1
                    case(A[3])
                        1'b1: begin
                            if (A[2])
                                begin //11
                                    case(A[2])
                                        1'b1: begin
                                            if (A[1])
                                                begin //111
                                                    case(A[1])
                                                        1'b1: begin
                                                            if (A[0])
                                                                begin //1111
                                                                    case(A[0])
                                                                        1'b1: Y = 4'b0111; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                            else //1110
                                                                begin
                                                                    case(A[0])
                                                                        1'b0: Y = 4'b1000; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                        end
                                                        default: Y = 4'b0000;
                                                    endcase
                                                end
                                            else 
                                                begin //110
                                                    case(A[1])
                                                        1'b0: begin
                                                            if (A[0])
                                                                begin //1101
                                                                    case(A[0])
                                                                        1'b1: Y = 4'b0110; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                            else //1100
                                                                begin
                                                                    case(A[0])
                                                                        1'b0: Y = 4'b0101; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                        end
                                                        default: Y = 4'b0000;
                                                    endcase
                                                end
                                        end 
                                        default: Y = 4'b0000;
                                    endcase         
                                end
                            else
                                begin //10
                                    case(A[2])
                                        1'b0: begin
                                            if (A[1])
                                                begin //101
                                                    case(A[1])
                                                        1'b1: begin
                                                            if (A[0])
                                                                begin //1011
                                                                    case(A[0])
                                                                        1'b1: Y = 4'b0000; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                            else //1010
                                                                begin
                                                                    case(A[0])
                                                                        1'b0: Y = 4'b1001; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                        end
                                                        default: Y = 4'b0000;
                                                    endcase
                                                end
                                            else 
                                                begin //100
                                                    case(A[1])
                                                        1'b0: begin
                                                            if (A[0])
                                                                begin //1001
                                                                    case(A[0])
                                                                        1'b1: Y = 4'b0000; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                            else //1000
                                                                begin
                                                                    case(A[0])
                                                                        1'b0: Y = 4'b0000; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                        end
                                                        default: Y = 4'b0000;
                                                    endcase
                                                end
                                        end 
                                        default: Y = 4'b0000;
                                    endcase 
                                end
                        end
                        default: Y = 4'b0000;
                    endcase
                end
            else
                begin //0
                    case(A[3])
                        1'b0: begin
                            if (A[2])
                                begin //01
                                    case(A[2])
                                        1'b1: begin
                                            if (A[1])
                                                begin //011
                                                    case(A[1])
                                                        1'b1: begin
                                                            if (A[0])
                                                                begin //0111
                                                                    case(A[0])
                                                                        1'b1: Y = 4'b0010; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                            else //0110
                                                                begin
                                                                    case(A[0])
                                                                        1'b0: Y = 4'b0001; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                        end
                                                        default: Y = 4'b0000;
                                                    endcase
                                                end
                                            else 
                                                begin //010
                                                    case(A[1])
                                                        1'b0: begin
                                                            if (A[0])
                                                                begin //0101
                                                                    case(A[0])
                                                                        1'b1: Y = 4'b0011; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                            else //0100
                                                                begin
                                                                    case(A[0])
                                                                        1'b0: Y = 4'b0100; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                        end
                                                        default: Y = 4'b0000;
                                                    endcase
                                                end
                                        end 
                                        default: Y = 4'b0000;
                                    endcase         
                                end
                            else
                                begin //00
                                    case(A[2])
                                        1'b0: begin
                                            if (A[1])
                                                begin //001
                                                    case(A[1])
                                                        1'b1: begin
                                                            if (A[0])
                                                                begin //0011
                                                                    case(A[0])
                                                                        1'b1: Y = 4'b0000; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                            else //0010
                                                                begin
                                                                    case(A[0])
                                                                        1'b0: Y = 4'b0000; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                        end
                                                        default: Y = 4'b0000;
                                                    endcase
                                                end
                                            else 
                                                begin //000
                                                    case(A[1])
                                                        1'b0: begin
                                                            if (A[0])
                                                                begin //0001
                                                                    case(A[0])
                                                                        1'b1: Y = 4'b0000; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                            else //1000
                                                                begin
                                                                    case(A[0])
                                                                        1'b0: Y = 4'b0000; 
                                                                        default: Y = 4'b0000;
                                                                    endcase
                                                                end
                                                        end
                                                        default: Y = 4'b0000;
                                                    endcase
                                                end
                                        end 
                                        default: Y = 4'b0000;
                                    endcase 
                                end
                        end
                        default: Y = 4'b0000;
                    endcase
                end
        end
endmodule
