`timescale 1ns/1ps

module excess3_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)
        begin
          	case(!A[3])
                1'b0: begin //1
                  	case(!A[2])
                        1'b0: begin //11
                            case(!A[1])
                                1'b0: begin //111
                                    Y=4'b0000;
                                end
                                1'b1: begin
                                    case(!A[0]) //110
                                        1'b0: Y=4'b0000; //1101
                                        1'b1: Y=4'b1001; //1100
                                        default: Y=4'b0000;
                                    endcase
                                end
                                default: Y=4'b0000;
                            endcase
                        end
                        1'b1: begin //10
                            case(!A[1])
                                1'b0: begin //101
                                    case(!A[0]) 
                                        1'b0: Y=4'b1000; //1011
                                        1'b1: Y=4'b0111; //1010
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: begin
                                    case(!A[0]) //100
                                        1'b0: Y=4'b0110; //1001
                                        1'b1: Y=4'b0101; //1000
                                        default: Y=4'b0000;
                                    endcase
                                end
                                default: Y=4'b0000;
                            endcase
                        end
                        default: Y=4'b0000;
                    endcase
                end
                1'b1: begin //0
                    case(!A[2])
                        1'b0: begin //01
                            case(!A[1])
                                1'b0: begin //011
                                    case(!A[0])
                                        1'b0: Y=4'b0100; //0111
                                        1'b1: Y=4'b0011; //0110
                                        default: Y=4'b0000;
                                    endcase
                                end
                              	1'b1: begin //010
                                    case(!A[0])
                                        1'b0: Y=4'b0010; //0101
                                        1'b1: Y=4'b0001; //0100
                                        default: Y=4'b0000;
                                    endcase
                                end
                                default: Y=4'b0000;
                            endcase
                        end
                        1'b1: begin //00
                            case(!A[1])
                                1'b0: begin //001
                                    case(!A[0])
                                        1'b0: Y=4'b0000; //0011
                                      	1'b1: Y=4'b0000; //0010
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: begin //000
                                    case(!A[0])
                                        1'b0: Y=4'b0000; //0001
                                        1'b1: Y=4'b0000; //0000
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