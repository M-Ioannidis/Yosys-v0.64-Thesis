`timescale 1ns/1ps

module XS3_Gray (input wire[3:0]A, output reg [3:0]Y);
    always @(*)  
    begin
        case (A)
            4'b0000: begin
                case(A)
                    4'b0000: begin
                        case(A)
                            4'b0000: Y = 4'b0010;
                            default: Y = 4'b0000;
                        endcase
                    end
                    default: Y = 4'b0000;
                endcase
            end
            4'b0001: begin
                case(A)
                    4'b0001: begin
                        case(A)
                            4'b0001: Y = 4'b0110;
                            default: Y = 4'b0000;
                        endcase
                    end
                    default: Y = 4'b0000;
                endcase
            end
            4'b0010: begin
                case(A)
                    4'b0010: begin
                        case(A)
                            4'b0010: Y = 4'b0111;
                            default: Y = 4'b0000;
                        endcase
                    end
                    default: Y = 4'b0000;
                endcase
            end
            4'b0011: begin
                case(A)
                    4'b0011: begin
                        case(A)
                            4'b0011: Y = 4'b0101;
                            default: Y = 4'b0000;
                        endcase
                    end
                    default: Y = 4'b0000;
                endcase;
            end
            4'b0100: begin
                case(A)
                    4'b0100: begin
                        case(A)
                            4'b0100: Y = 4'b0100;
                            default: Y = 4'b0000;
                        endcase
                    end
                    default: Y = 4'b0000;
                endcase
            end
            4'b0101: begin
                case(A)
                    4'b0101: begin
                        case(A)
                            4'b0101: Y = 4'b1100;
                            default: Y = 4'b0000;
                        endcase
                    end
                    default: Y = 4'b0000;
                endcase
            end
            4'b0110: begin
                case(A)
                    4'b0110: begin
                        case(A)
                            4'b0110: Y = 4'b1101;
                            default: Y = 4'b0000;
                        endcase
                    end
                    default: Y = 4'b0000;
                endcase
            end                          
            4'b0111: begin
                case(A)
                    4'b0111: begin
                        case(A)
                            4'b0111: Y = 4'b1111;
                            default: Y = 4'b0000;
                        endcase
                    end
                    default: Y = 4'b0000;
                endcase
            end                                                                                                                        
            4'b1000: begin
                case(A)
                    4'b1000: begin
                        case(A)
                            4'b1000: Y = 4'b1110;
                            default: Y = 4'b0000;
                        endcase
                    end
                    default: Y = 4'b0000;
                endcase
            end  
            4'b1001: begin
                case(A)
                    4'b1001: begin
                        case(A)
                            4'b1001: Y = 4'b1010;
                            default: Y = 4'b0000;
                        endcase
                    end
                    default: Y = 4'b0000;
                endcase
            end  
            default: Y = 4'b0000;
        endcase                               
    end
endmodule