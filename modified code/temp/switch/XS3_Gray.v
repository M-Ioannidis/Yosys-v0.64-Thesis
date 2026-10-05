`timescale 1ns/1ps

module XS3_Gray (input wire[3:0]A, output reg [3:0]Y);
    always @(*)
        begin
            case(A[3])
                1'b0: begin //0
                    case(A[3])
                        1'b0: begin //0
                            case(A[3])
                                1'b0: begin //0
                                    case(A[2])
                                        1'b0: begin //00
                                            case(A[2])
                                                1'b0: begin //00
                                                    case(A[2])
                                                        1'b0: begin //00
                                                            case(A[1])
                                                                1'b0: begin //000
                                                                    case(A[1])
                                                                        1'b0: begin //000
                                                                            case(A[1])
                                                                                1'b0: begin //000
                                                                                    case(A[0])
                                                                                        1'b0: begin 
                                                                                            case(A[0])
                                                                                                1'b0: begin 
                                                                                                    case(A[0])
                                                                                                        1'b0: begin 
                                                                                                            Y=4'b0010; //0000
                                                                                                        end 
                                                                                                        1'b1: Y=4'b0110; //0001
                                                                                                        default: Y=4'b0000;
                                                                                                    endcase
                                                                                                end 
                                                                                                1'b1: Y=4'b0110; //0001
                                                                                                default: Y=4'b0000;
                                                                                            endcase
                                                                                        end 
                                                                                        1'b1: Y=4'b0110; //0001
                                                                                        default: Y=4'b0000;
                                                                                    endcase
                                                                                end
                                                                                1'b1: begin //001
                                                                                    case(A[0])
                                                                                        1'b0: begin 
                                                                                            case(A[0])
                                                                                                1'b0: begin 
                                                                                                    case(A[0])
                                                                                                        1'b0: begin 
                                                                                                            Y=4'b0111; //0010
                                                                                                        end
                                                                                                        1'b1: Y=4'b0101; //0011
                                                                                                        default: Y=4'b0000;
                                                                                                    endcase
                                                                                                end
                                                                                                1'b1: Y=4'b0101; //0011
                                                                                                default: Y=4'b0000;
                                                                                            endcase
                                                                                        end
                                                                                        1'b1: Y=4'b0101; //0011
                                                                                        default: Y=4'b0000;
                                                                                    endcase
                                                                                end
                                                                                default: Y=4'b0000;
                                                                            endcase
                                                                        end
                                                                        1'b1: begin //001
                                                                            case(A[0])
                                                                                1'b0: begin 
                                                                                    case(A[0])
                                                                                        1'b0: begin 
                                                                                            case(A[0])
                                                                                                1'b0: begin 
                                                                                                    Y=4'b0111; //0010
                                                                                                end
                                                                                                1'b1: Y=4'b0101; //0011
                                                                                                default: Y=4'b0000;
                                                                                            endcase
                                                                                        end
                                                                                        1'b1: Y=4'b0101; //0011
                                                                                        default: Y=4'b0000;
                                                                                    endcase
                                                                                end
                                                                                1'b1: Y=4'b0101; //0011
                                                                                default: Y=4'b0000;
                                                                            endcase
                                                                        end
                                                                        default: Y=4'b0000;
                                                                    endcase
                                                                end
                                                                1'b1: begin //001
                                                                    case(A[0])
                                                                        1'b0: begin 
                                                                            case(A[0])
                                                                                1'b0: begin 
                                                                                    case(A[0])
                                                                                        1'b0: begin 
                                                                                            Y=4'b0111; //0010
                                                                                        end
                                                                                        1'b1: Y=4'b0101; //0011
                                                                                        default: Y=4'b0000;
                                                                                    endcase
                                                                                end
                                                                                1'b1: Y=4'b0101; //0011
                                                                                default: Y=4'b0000;
                                                                            endcase
                                                                        end
                                                                        1'b1: Y=4'b0101; //0011
                                                                        default: Y=4'b0000;
                                                                    endcase
                                                                end
                                                                default: Y=4'b0000;
                                                            endcase
                                                        end
                                                        1'b1: begin //01
                                                            case(A[1])
                                                                1'b0: begin //010
                                                                    case(A[1])
                                                                        1'b0: begin //010
                                                                            case(A[1])
                                                                                1'b0: begin //010
                                                                                    case(A[0])
                                                                                        1'b0: Y=4'b0100; //0100
                                                                                        1'b1: Y=4'b1100; //0101
                                                                                        default: Y=4'b0000;
                                                                                    endcase
                                                                                end
                                                                                1'b1: begin //011
                                                                                    case(A[0])
                                                                                        1'b0: Y=4'b1101; //0110
                                                                                        1'b1: Y=4'b1111; //0111
                                                                                        default: Y=4'b0000;
                                                                                    endcase
                                                                                end
                                                                                default: Y=4'b0000;
                                                                            endcase
                                                                        end
                                                                        1'b1: begin //011
                                                                            case(A[0])
                                                                                1'b0: Y=4'b1101; //0110
                                                                                1'b1: Y=4'b1111; //0111
                                                                                default: Y=4'b0000;
                                                                            endcase
                                                                        end
                                                                        default: Y=4'b0000;
                                                                    endcase
                                                                end
                                                                1'b1: begin //011
                                                                    case(A[0])
                                                                        1'b0: Y=4'b1101; //0110
                                                                        1'b1: Y=4'b1111; //0111
                                                                        default: Y=4'b0000;
                                                                    endcase
                                                                end
                                                                default: Y=4'b0000;
                                                            endcase
                                                        end
                                                        default: Y=4'b0000;
                                                    endcase
                                                end
                                                1'b1: begin //01
                                                    case(A[1])
                                                        1'b0: begin //010
                                                            case(A[1])
                                                                1'b0: begin //010
                                                                    case(A[1])
                                                                        1'b0: begin //010
                                                                            case(A[0])
                                                                                1'b0: Y=4'b0100; //0100
                                                                                1'b1: Y=4'b1100; //0101
                                                                                default: Y=4'b0000;
                                                                            endcase
                                                                        end
                                                                        1'b1: begin //011
                                                                            case(A[0])
                                                                                1'b0: Y=4'b1101; //0110
                                                                                1'b1: Y=4'b1111; //0111
                                                                                default: Y=4'b0000;
                                                                            endcase
                                                                        end
                                                                        default: Y=4'b0000;
                                                                    endcase
                                                                end
                                                                1'b1: begin //011
                                                                    case(A[0])
                                                                        1'b0: Y=4'b1101; //0110
                                                                        1'b1: Y=4'b1111; //0111
                                                                        default: Y=4'b0000;
                                                                    endcase
                                                                end
                                                                default: Y=4'b0000;
                                                            endcase
                                                        end
                                                        1'b1: begin //011
                                                            case(A[0])
                                                                1'b0: Y=4'b1101; //0110
                                                                1'b1: Y=4'b1111; //0111
                                                                default: Y=4'b0000;
                                                            endcase
                                                        end
                                                        default: Y=4'b0000;
                                                    endcase
                                                end
                                                default: Y=4'b0000;
                                            endcase
                                        end
                                        1'b1: begin //01
                                            case(A[1])
                                                1'b0: begin //010
                                                    case(A[1])
                                                        1'b0: begin //010
                                                            case(A[1])
                                                                1'b0: begin //010
                                                                    case(A[0])
                                                                        1'b0: Y=4'b0100; //0100
                                                                        1'b1: Y=4'b1100; //0101
                                                                        default: Y=4'b0000;
                                                                    endcase
                                                                end
                                                                1'b1: begin //011
                                                                    case(A[0])
                                                                        1'b0: Y=4'b1101; //0110
                                                                        1'b1: Y=4'b1111; //0111
                                                                        default: Y=4'b0000;
                                                                    endcase
                                                                end
                                                                default: Y=4'b0000;
                                                            endcase
                                                        end
                                                        1'b1: begin //011
                                                            case(A[0])
                                                                1'b0: Y=4'b1101; //0110
                                                                1'b1: Y=4'b1111; //0111
                                                                default: Y=4'b0000;
                                                            endcase
                                                        end
                                                        default: Y=4'b0000;
                                                    endcase
                                                end
                                                1'b1: begin //011
                                                    case(A[0])
                                                        1'b0: Y=4'b1101; //0110
                                                        1'b1: Y=4'b1111; //0111
                                                        default: Y=4'b0000;
                                                    endcase
                                                end
                                                default: Y=4'b0000;
                                            endcase
                                        end
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1:  begin //1
                                    case(A[2])
                                        1'b0: begin //10
                                            case(A[2])
                                                1'b0: begin //10
                                                    case(A[2])
                                                        1'b0: begin //10
                                                            case(A[1])
                                                                1'b0: begin //100
                                                                    case(A[1])
                                                                        1'b0: begin //100
                                                                            case(A[1])
                                                                                1'b0: begin //100
                                                                                    case(A[0]) 
                                                                                        1'b0: begin 
                                                                                            case(A[0]) 
                                                                                                1'b0: begin 
                                                                                                    case(A[0]) 
                                                                                                        1'b0: begin 
                                                                                                            Y=4'b1110; //1000
                                                                                                        end
                                                                                                        1'b1: Y=4'b1010; //1001
                                                                                                        default: Y=4'b0000;
                                                                                                    endcase
                                                                                                end
                                                                                                1'b1: Y=4'b1010; //1001
                                                                                                default: Y=4'b0000;
                                                                                            endcase
                                                                                        end
                                                                                        1'b1: Y=4'b1010; //1001
                                                                                        default: Y=4'b0000;
                                                                                    endcase
                                                                                end
                                                                                1'b1: Y=4'b0000;
                                                                                default: Y=4'b0000;
                                                                            endcase
                                                                        end
                                                                        1'b1: Y=4'b0000;
                                                                        default: Y=4'b0000;
                                                                    endcase
                                                                end
                                                                1'b1: Y=4'b0000;
                                                                default: Y=4'b0000;
                                                            endcase
                                                        end
                                                        1'b1: Y=4'b0000;
                                                        default: Y=4'b0000;
                                                    endcase
                                                end
                                                1'b1: Y=4'b0000;
                                                default: Y=4'b0000;
                                            endcase
                                        end
                                        1'b1: Y=4'b0000;
                                        default: Y=4'b0000;
                                    endcase
                                end
                                default: Y=4'b0000;
                            endcase
                        end
                        1'b1:  begin //1
                            case(A[2])
                                1'b0: begin //10
                                    case(A[2])
                                        1'b0: begin //10
                                            case(A[2])
                                                1'b0: begin //10
                                                    case(A[1])
                                                        1'b0: begin //100
                                                            case(A[1])
                                                                1'b0: begin //100
                                                                    case(A[1])
                                                                        1'b0: begin //100
                                                                            case(A[0]) 
                                                                                1'b0: begin 
                                                                                    case(A[0]) 
                                                                                        1'b0: begin 
                                                                                            case(A[0]) 
                                                                                                1'b0: begin 
                                                                                                    Y=4'b1110; //1000
                                                                                                end
                                                                                                1'b1: Y=4'b1010; //1001
                                                                                                default: Y=4'b0000;
                                                                                            endcase
                                                                                        end
                                                                                        1'b1: Y=4'b1010; //1001
                                                                                        default: Y=4'b0000;
                                                                                    endcase
                                                                                end
                                                                                1'b1: Y=4'b1010; //1001
                                                                                default: Y=4'b0000;
                                                                            endcase
                                                                        end
                                                                        1'b1: Y=4'b0000;
                                                                        default: Y=4'b0000;
                                                                    endcase
                                                                end
                                                                1'b1: Y=4'b0000;
                                                                default: Y=4'b0000;
                                                            endcase
                                                        end
                                                        1'b1: Y=4'b0000;
                                                        default: Y=4'b0000;
                                                    endcase
                                                end
                                                1'b1: Y=4'b0000;
                                                default: Y=4'b0000;
                                            endcase
                                        end
                                        1'b1: Y=4'b0000;
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: Y=4'b0000;
                                default: Y=4'b0000;
                            endcase
                        end
                        default: Y=4'b0000;
                    endcase
                end
                1'b1:  begin //1
                    case(A[2])
                        1'b0: begin //10
                            case(A[2])
                                1'b0: begin //10
                                    case(A[2])
                                        1'b0: begin //10
                                            case(A[1])
                                                1'b0: begin //100
                                                    case(A[1])
                                                        1'b0: begin //100
                                                            case(A[1])
                                                                1'b0: begin //100
                                                                    case(A[0]) 
                                                                        1'b0: begin 
                                                                            case(A[0]) 
                                                                                1'b0: begin
                                                                                    case(A[0]) 
                                                                                        1'b0: begin  
                                                                                            Y=4'b1110; //1000
                                                                                        end
                                                                                        1'b1: Y=4'b1010; //1001
                                                                                        default: Y=4'b0000;
                                                                                    endcase
                                                                                end
                                                                                1'b1: Y=4'b1010; //1001
                                                                                default: Y=4'b0000;
                                                                            endcase
                                                                        end
                                                                        1'b1: Y=4'b1010; //1001
                                                                        default: Y=4'b0000;
                                                                    endcase
                                                                end
                                                                1'b1: Y=4'b0000;
                                                                default: Y=4'b0000;
                                                            endcase
                                                        end
                                                        1'b1: Y=4'b0000;
                                                        default: Y=4'b0000;
                                                    endcase
                                                end
                                                1'b1: Y=4'b0000;
                                                default: Y=4'b0000;
                                            endcase
                                        end
                                        1'b1: Y=4'b0000;
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: Y=4'b0000;
                                default: Y=4'b0000;
                            endcase
                        end
                        1'b1: Y=4'b0000;
                        default: Y=4'b0000;
                    endcase
                end
                default: Y=4'b0000;
            endcase
        end
endmodule