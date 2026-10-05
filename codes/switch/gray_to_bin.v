`timescale 1ns/1ps

module gray_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)
        begin
            case(A[3])
                1'b0: begin //0
                    case(A[2])
                        1'b0: begin //00
                            case(A[1])
                                1'b0: begin //000
                                    case(A[0])
                                        1'b0: Y=4'b0000; //0000
                                        1'b1: Y=4'b0001; //0001
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: begin //001
                                    case(A[0])
                                        1'b0: Y=4'b0011; //0010
                                        1'b1: Y=4'b0010; //0011
                                        default: Y=4'b0000;
                                    endcase
                                end
                                default: Y=4'b0000;
                            endcase
                        end
                        1'b1: begin //01
                            case(A[1])
                                1'b0: begin //010
                                    case(A[0])
                                        1'b0: Y=4'b0111; //0100
                                        1'b1: Y=4'b0110; //0101
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: begin //011
                                    case(A[0])
                                        1'b0: Y=4'b0100; //0110
                                        1'b1: Y=4'b0101; //0111
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
                            case(A[1])
                                1'b0: begin //100
                                    case(A[0])
                                      	1'b0: Y=4'b1111; //1000
                                      	1'b1: Y=4'b1110; //1001
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: begin //101
                                    case(A[0])
                                         1'b0: Y=4'b1100;//1010
                                         1'b1: Y=4'b1101;//1011
                                        default: Y=4'b0000;
                                    endcase
                                end
                                default: Y=4'b0000;
                            endcase
                        end
                        1'b1: begin //11
                            case(A[1]) 
                                1'b0: begin //110
                                    case(A[0]) 
                                        1'b0: Y=4'b1000; //1100
                                        1'b1: Y=4'b1001; //1101
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: begin //111
                                    case(A[0])
                                        1'b0: Y=4'b1011; //1110
                                        1'b1: Y=4'b1010; //1111
                                        default: Y=4'b0000;
                                    endcase
                                end
                                default: Y=4'b0000;
                            endcase
                        end
                        default: Y=4'b0000;
                    endcase
                end
                default: Y=4'b0000;
            endcase
        end
endmodule