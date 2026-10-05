`timescale 1ns/1ps

module XS3_Gray_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)  
        begin
            if (A == 4'b0010 )
                begin
                    case(A == 4'b0010 )
                        1'b0: Y = 4'b0000; 
                        1'b1: Y = 4'b0000;
                    endcase
                end
            else
                begin 
                    if (A == 4'b0110)
                        case(A == 4'b0110 )
                            1'b0: Y = 4'b0000; 
                            1'b1: Y = 4'b0001;
                        endcase
                    else
                        begin 
                            if (A == 4'b0111)
                                case(A == 4'b0111 )
                                    1'b0: Y = 4'b0000; 
                                    1'b1: Y = 4'b0010;
                                endcase
                            else
                                begin   
                                    if (A == 4'b0101)
                                        case(A == 4'b0101 )
                                            1'b0: Y = 4'b0000; 
                                            1'b1: Y = 4'b0011;
                                        endcase
                                    else
                                        begin 
                                            if (A == 4'b0100)
                                                case(A == 4'b0100 )
                                                    1'b0: Y = 4'b0000; 
                                                    1'b1: Y = 4'b0100;
                                                endcase 
                                            else 
                                            begin
                                                if (A == 4'b1100)
                                                    case(A == 4'b1100 )
                                                        1'b0: Y = 4'b0000; 
                                                        1'b1: Y = 4'b0101;
                                                    endcase
                                                else
                                                    begin   
                                                        if (A == 4'b1101)
                                                            case(A == 4'b1101 )
                                                                1'b0: Y = 4'b0000; 
                                                                1'b1: Y = 4'b0110;
                                                            endcase
                                                        else
                                                            begin   
                                                                if (A == 4'b1111)
                                                                    case(A == 4'b1111 )
                                                                        1'b0: Y = 4'b0000; 
                                                                        1'b1: Y = 4'b0111;
                                                                    endcase
                                                                else
                                                                    begin
                                                                        if (A == 4'b1110)
                                                                            case(A == 4'b1110 )
                                                                                1'b0: Y = 4'b0000; 
                                                                                1'b1: Y = 4'b1000;
                                                                            endcase
                                                                        else
                                                                            begin
                                                                                if (A == 4'b1010)
                                                                                    case(A == 4'b1010 )
                                                                                        1'b0: Y = 4'b0000; 
                                                                                        1'b1: Y = 4'b1001;
                                                                                    endcase
                                                                                else
                                                                                    begin
                                                                                        if (A == 4'b1001)
                                                                                            case(A == 4'b1001 )
                                                                                                1'b0: Y = 4'b0000; 
                                                                                                1'b1: Y = 4'b0000;
                                                                                            endcase
                                                                                            
                                                                                        else
                                                                                            case(A)
                                                                                                default: Y = 1'b0;
                                                                                            endcase
                                                                                    end
                                                                            end
                                                                    end
                                                            end 
                                                    end 
                                            end
                                        end 
                                end 
                        end       
                end        
        end
endmodule