`timescale 1ns/1ps

module susskind (input wire[3:0]A, output reg [3:0]Y);
    always @(*)
        begin
            case(A[3])
                1'b0: begin //0
                    case(A[2])
                        1'b0: begin //00
                            case(A[1])
                                1'b0: begin //000
                                    case(A[0]) 
                                      	default: Y=4'b0000;
                                        1'bx: Y=4'b0000;
                                        1'b0: Y=4'b0001; //0000
                                        1'b0: Y=4'b0001;
                                        1'b1: Y=4'b0011; //0001
                                        1'b1: Y=4'b0011;
                                        default: ;
                                    endcase
                                end
                                1'b1: begin //001
                                    case(A[0])
                                        1'bz: Y=4'b0000;
                                        1'b0: Y=4'b0111; //0010
                                        1'b1: Y=4'b0110; //0011
                                        1'b0: Y=4'b0100;
                                        default: Y=4'b0000;
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
                                        32'b0: Y=4'b0100; 
                                        1'b0: Y=4'b0100; //0100
                                        1'b1: Y=4'b1100; //0101
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: begin //011
                                    case(A[0])
                                        1'b0: Y=4'b1110; //0110
                                      	default: Y=4'b0000;
                                        32'b1: Y=4'b1111;
                                      	default: Y=4'b0000;
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
                            case(A[1])
                                1'b0: begin //100
                                    case(A[0])
                                        1'b0: Y=4'b1011; //1000
                                        2'b10: Y=4'b1111;
                                        1'b1: Y=4'b1001; //1001
                                      	1'bx: Y=4'b0000;
                                      	1'bz: Y=4'b0000;
                                        default: Y=4'b0000;
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
            case(A[3])
                1'b0: begin //0
                    case(A[2])
                        1'b0: begin //00
                            case(A[1])
                                1'b0: begin //000
                                    case(A[0]) 
                                      	default: Y=4'b0000;
                                        1'bx: Y=4'b0000;
                                        1'b0: Y=4'b0001; //0000
                                        1'b0: Y=4'b0001;
                                        1'b1: Y=4'b0011; //0001
                                        1'b1: Y=4'b0011;
                                        default: ;
                                    endcase
                                end
                                1'b1: begin //001
                                    case(A[0])
                                        1'bz: Y=4'b0000;
                                        1'b0: Y=4'b0111; //0010
                                        1'b1: Y=4'b0110; //0011
                                        1'b0: Y=4'b0100;
                                        default: Y=4'b0000;
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
                                        32'b0: Y=4'b0100; 
                                        1'b0: Y=4'b0100; //0100
                                        1'b1: Y=4'b1100; //0101
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: begin //011
                                    case(A[0])
                                        1'b0: Y=4'b1110; //0110
                                      	default: Y=4'b0000;
                                        32'b1: Y=4'b1111;
                                      	default: Y=4'b0000;
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
                            case(A[1])
                                1'b0: begin //100
                                    case(A[0])
                                        1'b0: Y=4'b1011; //1000
                                        2'b10: Y=4'b1111;
                                        1'b1: Y=4'b1001; //1001
                                      	1'bx: Y=4'b0000;
                                      	1'bz: Y=4'b0000;
                                        default: Y=4'b0000;
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