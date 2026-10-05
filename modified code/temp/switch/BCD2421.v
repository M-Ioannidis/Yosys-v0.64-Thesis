`timescale 1ns/1ps

module BCD2421 (input wire[3:0]A, output reg [3:0]Y);
    always @(*)
        begin
            case(A[3])
                1'b0: begin //0
                    case(A[2])
                        1'b0: begin //00
                            case(A[1])
                                1'b0: begin //0000
                                    case(A[0])
                                        1'b0: Y=(A[0]) ? 4'b0000 : 4'b0000; //0000
                                        1'b1: Y=(A[0]) ? 4'b0001 : 4'b0000; //0001
                                        default: Y=4'b0000;
                                    endcase
                                end
                              	1'b1: begin //001
                                    case(A[0])
                                        1'b0: Y=(A[0]) ? 4'b0000 : 4'b0010; //0010
                                        1'b1: Y=(A[0]) ? 4'b0011 : 4'b0000; //0011
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
                                        1'b0: Y=(A[0]) ? 4'b0000 : 4'b0100; //0100
                                        1'b1: Y=(A[0]) ? 4'b1011 : 4'b0000; //0101
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: begin //011
                                    case(A[0])
                                        1'b0: Y=(A[0]) ? 4'b0000 : 4'b1100; //0110
                                      	1'b1: Y=(A[0]) ? 4'b1101 : 4'b0000; //0111
                                        default: Y=4'b0000;
                                    endcase
                                end
                                default: Y=4'b0000;
                            endcase
                        end
                        default: Y=4'b0000;
                    endcase
                end
                1'b1: begin
                    case(A[2])
                        1'b0: begin //00
                            case(A[1])
                                1'b0: begin //0000
                                    case(A[0])
                                        1'b0: Y=(A[0]) ? 4'b0000 : 4'b1110; //0000
                                        1'b1: Y=(A[0]) ? 4'b1111 : 4'b0000; //0001
                                        default: Y=4'b0000;
                                    endcase
                                end
                              	1'b1: Y= 4'b0000;
                                default: Y=4'b0000;
                            endcase
                        end
                        1'b1: Y = (A[0]) ? 4'b0000 : 4'b0000;
                        default: Y=4'b0000;
                    endcase
                end
                default: Y=4'b0000;
            endcase
        end
endmodule