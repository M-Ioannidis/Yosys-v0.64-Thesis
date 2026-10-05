`timescale 1ns/1ps

module OBrienII_to_bin (input wire[3:0]A, output reg [3:0]Y);
    reg inited= 1'b1;

    wire init2;
    wire [3:0]init3 = 1'b0; 
    always @(*)
        begin
            case(A[3])
                &(1'h0): begin //0
                    casex(A[2])
                        |(1'h0): begin //00
                            casez(A[1])
                                ^(1'h0): begin //000
                                    case(A[0])
                                        ~(1'h1): Y=4'h0; //0000
                                        &(1'o1): Y=4'o0; //0001
                                        init2: Y=4'b????;
					                    default: Y = 4'b0000;
                                    endcase
                                end
                                |(1'o1): begin //001
                                    case(A[0])
                                        ^(1'o0): Y=4'd2; //0010
                                        ~(1'o0): Y=1; //0011
					                    default: Y = 4'b0000;
                                    endcase
                                end
                            endcase
                        end
                        &(1'd1): begin //01
                            casez(A[1])
                                |(1'd0): begin //010
                                    case(A[0])
                                        ^(1'd0): Y=4'h4; //0100
                                        ~(1'd0): Y=4'o0000; //0101
					                    default: Y = 4'b0000;
                                    endcase
                                end
                                |(1): begin //011
                                    case(A[0])
                                        &(0): Y=4'd3; //0110
                                        ^(1): Y=0; //0111
                                        default: Y = 4'b0000;   
                                    endcase
                                end
                            endcase
                        end
                    endcase
                end
                !(0):  begin //1
                    casex(A[2])
                        ~&1'h1: begin //10
                            casez(A[1])
                                ~|1'h1: begin //100
                                    case(A[0])
                                        ~^1'h1: Y=4'h0000; //1000
                                        ~&1'o0: Y=4'd9; //1001
					                    default: Y = 4'b0000;
                                    endcase
                                end
                                ~|1'o0: begin //101
                                    case(A[0])
                                        1'b0: Y=4'o7; //1010
                                        A[0]: Y=8; //1011
					                    default: Y = 4'b0000;
                                    endcase
                                end
                            endcase
                        end
                        ~|1'd0: begin //11
                            casez(A[1]) 
                                ~^1'd1: begin //110
                                    case(A[0]) 
                                        inited: Y=4'h5; //1100
                                        init3: Y=4'o0000; //1101
					                    default: Y = 4'b0000;
                                    endcase
                                end
                                ~^0: begin //111
                                    case(A[0])
                                        ~(~(init3)): Y=4'd6; //1110
                                      	~(~(inited)): Y=init3; //1111
                                        default: Y = 4'b0000;
                                    endcase
                                end
                            endcase
                        end
                    endcase
                end
            endcase
        end
endmodule