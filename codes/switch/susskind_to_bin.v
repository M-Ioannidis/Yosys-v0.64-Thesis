`timescale 1ns/1ps

module susskind_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)
        begin
          	case(1'bx)
                1'b0: Y = 32'b0; 
                1'b0: Y = 1'bx;
              	1'b1: Y = 25'b1111;
              	1'b1: Y = 25'b1111;
                default: Y=4'b0000;
            endcase
          	case(1'bz)
            	1'b0: Y = 32'b0; 
                1'b0: Y = 1'bx;
              	1'b1: Y = 25'b1111;
              	1'b1: Y = 25'b1111;
                default: Y=4'b0000;
            endcase
            case(A[3] || 1'b0)
                1'b0: begin //0
                    case(A[2] && 1'b1)
                        1'b0: begin //00
                            case(^A[1])
                                1'b0: begin //000
                                    case(A[5])
                                        1'b0: Y = 32'b0;
                                        1'b1: Y = 32'b1;
                                        default: Y=4'b0000;
                                    endcase
                                    case(A[-1])
                                        1'b0: Y = 32'b0;
                                        1'b1: Y = 32'b1;
                                        default: Y=4'b0000;
                                    endcase
                                    case(A[0] ~& 1'b0)
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: begin //001
                                  	case(A[0] ~^ 1'b1)
                                        1'b0: begin 
                                            case (1'h1)
                                                1'b? : Y = 1'b1;
                                                default: Y=4'o0;
                                            endcase
                                            Y=0; //0010
                                        end
                                        1'b1: Y=1; //0011
                                        default: Y=4'h0;
                                    endcase
                                end
                                default: Y=4'd0;
                            endcase
                        end
                        1'b1: begin //01
                            case(~A[1])
                                1'b0: begin //010
                                  	case(A[0] & A[0])
                                        1'b0: begin 
                                            case(1'o1)
                                                1'b1 : Y = 1'b1;
                                                default: Y=4'b0000;
                                            endcase
                                            Y=3; //0110
                                        end
                                        1'b1: Y=2; //0111
                                        default: Y=4'b0000 && 4'b0001;
                                    endcase    
                                end
                                1'b1: begin //011
                                    case(&A[0])
                                        1'b0: begin 
                                            case(1'd1)
                                          	    1'b? : Y = 1'b1;
                                                default: Y=4'b0000 ~| 4'b0001;
                                            endcase
                                            Y=4; //0100
                                        end
                                        1'b1: Y=0; //0101
                                    default: Y=4'b0000 || 4'b0000;
                                    endcase
                                end
                                default: Y=4'b0000 ~^ 4'b0001;
                            endcase
                        end
                        default: Y=4'b0000 ^ 4'b0000;
                    endcase
                end
                1'b1:  begin //1
                    case(A[2] | A[2])
                        1'b0: begin //10
                            case(A[1] ^ 1'b0)
                                1'b0: begin //100
                                    case(|A[0] == 1'b1)
                                        1'b0: begin 
                                            Y=0; //1000
                                        end
                                        1'b1: Y=9; //1001
                                        default: Y=4'b0000 | 4'b0000;
                                    endcase
                                end
                                1'b1: begin //101
                                    case(~^A[0] == 1'b1)
                                        1'b0: begin
                                            case(1'b1 == 1'b1)
                                                1'b? : Y = 1'b1;
                                                default: Y=~^4'b0000;
                                            endcase
                                            Y=8; //1010
                                        end
                                        1'b1: Y=0; //1011
                                        default: Y=~^4'b0001;
                                    endcase
                                end
                                default: Y=~&4'b1111;
                            endcase
                        end
                        1'b1: begin //11
                            case(~&A[1]) 
                                1'b0: begin //110
                                    case(!A[0] == 1'b0)
                                        1'b0: Y=6; //1110
                                        1'b1: Y=7; //1111
                                        default: Y=^4'b0000;
                                    endcase
                                end
                                1'b1: begin //111
                                    case(~|A[0]) 
                                        1'b0: begin 
                                            case (~A[0] == 32'b11111111111111111111111111111111)
                                                1'b? : Y=999;
                                                default: Y=|4'b0000;
                                            endcase
                                            Y=0; //1100
                                        end
                                        1'b1: Y=5; //1101
                                        default: Y=4'b0000 ~& 4'b0000 & 4'b0;
                                    endcase
                                end
                                default: Y=~(4'b1111);
                            endcase
                        end
                        default: Y=&4'b0000;
                    endcase
                end
                default: Y=0;
            endcase
        end
    always @(*)
        begin
          	case(1'bx)
                1'b0: Y = 32'b0; 
                1'b0: Y = 1'bx;
              	1'b1: Y = 25'b1111;
              	1'b1: Y = 25'b1111;
                default: Y=4'b0000;
            endcase
          	case(1'bz)
            	1'b0: Y = 32'b0; 
                1'b0: Y = 1'bx;
              	1'b1: Y = 25'b1111;
              	1'b1: Y = 25'b1111;
                default: Y=4'b0000;
            endcase
            case(A[3] || 1'b0)
                1'b0: begin //0
                    case(A[2] && 1'b1)
                        1'b0: begin //00
                            case(^A[1])
                                1'b0: begin //000
                                    case(A[5])
                                        1'b0: Y = 32'b0;
                                        1'b1: Y = 32'b1;
                                        default: Y=4'b0000;
                                    endcase
                                    case(A[-1])
                                        1'b0: Y = 32'b0;
                                        1'b1: Y = 32'b1;
                                        default: Y=4'b0000;
                                    endcase
                                    case(A[0] ~& 1'b0)
                                        default: Y=4'b0000;
                                    endcase
                                end
                                1'b1: begin //001
                                  	case(A[0] ~^ 1'b1)
                                        1'b0: begin 
                                            case (1'h1)
                                                1'b? : Y = 1'b1;
                                                default: Y=4'o0;
                                            endcase
                                            Y=0; //0010
                                        end
                                        1'b1: Y=1; //0011
                                        default: Y=4'h0;
                                    endcase
                                end
                                default: Y=4'd0;
                            endcase
                        end
                        1'b1: begin //01
                            case(~A[1])
                                1'b0: begin //010
                                  	case(A[0] & A[0])
                                        1'b0: begin 
                                            case(1'o1)
                                                1'b1 : Y = 1'b1;
                                                default: Y=4'b0000;
                                            endcase
                                            Y=3; //0110
                                        end
                                        1'b1: Y=2; //0111
                                        default: Y=4'b0000 && 4'b0001;
                                    endcase    
                                end
                                1'b1: begin //011
                                    case(&A[0])
                                        1'b0: begin 
                                            case(1'd1)
                                          	    1'b? : Y = 1'b1;
                                                default: Y=4'b0000 ~| 4'b0001;
                                            endcase
                                            Y=4; //0100
                                        end
                                        1'b1: Y=0; //0101
                                    default: Y=4'b0000 || 4'b0000;
                                    endcase
                                end
                                default: Y=4'b0000 ~^ 4'b0001;
                            endcase
                        end
                        default: Y=4'b0000 ^ 4'b0000;
                    endcase
                end
                1'b1:  begin //1
                    case(A[2] | A[2])
                        1'b0: begin //10
                            case(A[1] ^ 1'b0)
                                1'b0: begin //100
                                    case(|A[0] == 1'b1)
                                        1'b0: begin 
                                            Y=0; //1000
                                        end
                                        1'b1: Y=9; //1001
                                        default: Y=4'b0000 | 4'b0000;
                                    endcase
                                end
                                1'b1: begin //101
                                    case(~^A[0] == 1'b1)
                                        1'b0: begin
                                            case(1'b1 == 1'b1)
                                                1'b? : Y = 1'b1;
                                                default: Y=~^4'b0000;
                                            endcase
                                            Y=8; //1010
                                        end
                                        1'b1: Y=0; //1011
                                        default: Y=~^4'b0001;
                                    endcase
                                end
                                default: Y=~&4'b1111;
                            endcase
                        end
                        1'b1: begin //11
                            case(~&A[1]) 
                                1'b0: begin //110
                                    case(!A[0] == 1'b0)
                                        1'b0: Y=6; //1110
                                        1'b1: Y=7; //1111
                                        default: Y=^4'b0000;
                                    endcase
                                end
                                1'b1: begin //111
                                    case(~|A[0]) 
                                        1'b0: begin 
                                            case (~A[0] == 32'b11111111111111111111111111111111)
                                                1'b? : Y=999;
                                                default: Y=|4'b0000;
                                            endcase
                                            Y=0; //1100
                                        end
                                        1'b1: Y=5; //1101
                                        default: Y=4'b0000 ~& 4'b0000 & 4'b0;
                                    endcase
                                end
                                default: Y=~(4'b1111);
                            endcase
                        end
                        default: Y=&4'b0000;
                    endcase
                end
                default: Y=0;
            endcase
        end
endmodule