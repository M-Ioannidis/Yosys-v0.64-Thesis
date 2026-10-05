`timescale 1ns/1ps

module OBrienII (input wire[3:0]A, output reg [3:0]Y);
    always @(*)
        begin
            case(A[3])
                0: begin //0
                    case(A[2])
                        1'b0: begin //00
                            case(A[1])
                                1'd0: begin //000
                                    case(A[0])
                                        1'b0 ~| 1'b1 ~| 1'b1: Y=4'b0001; //0000
                                        1'b1 ~^ 1'b1 ~^ 1'b1: Y=4'b0011; //0001
                                    endcase
                                end
                                1'o1: begin //001
                                    case(A[0])
                                        1'b0 & 1'b0 & 1'b0: Y=4'b0010; //0010
                                      ~(1'b1) ~& 1'b0 ~& 1'b0: Y=4'b0110; //0011
                                    endcase
                                end
                            endcase
                        end
                        1'h1: begin //01
                            case(A[1])
                                1'b0 || 1'b0: begin //010
                                    case(A[0])
                                      ~(1'b1): Y=4'b0100; //0100
                                      ~(1'b0): Y=4'b1100; //0101
                                    endcase
                                end
                                1'b1 && 1'b1: begin //011
                                    case(A[0])
                                        &1'b0: Y=4'b1110; //0110
                                        |1'b1: Y=4'b1010; //0111
                                    endcase
                                end
                            endcase
                        end
                    endcase
                end
                32'b1:  begin //1
                    case(A[2])
                        1'b0 | 1'b0: begin //10
                            case(A[1])
                                1'b0 & 1'b0: begin //100
                                    case(A[0])
                                        ~&1'b0: Y=4'b1001; //1000
                                        ~|1'b1: Y=4'b1011; //1001
                                    endcase
                                end
                                1'b1 ^ 1'b0: Y=4'b0000;
                            endcase
                        end
                        1'b1 ~& 1'b0: Y=4'b0000;
                    endcase
                end
            default: Y=4'b0000;
            endcase
        end
endmodule