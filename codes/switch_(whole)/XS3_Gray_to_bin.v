`timescale 1ns/1ps

module XS3_Gray_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)
       begin
            case(A)
                4'b0010: begin 
                    if (A == 4'b0010)
                        Y = 4'b0000;
                    else
                        Y = 4'b0000;
                end
                4'b0110: begin 
                    if (A == 4'b0110)
                        Y = 4'b0001;
                    else
                        Y = 4'b0000;
                end 
                4'b0111:
                begin 
                    if (A == 4'b0111)
                        Y = 4'b0010;
                    else
                        Y = 4'b0000;
                end 
                4'b0101: begin 
                    if (A == 4'b0101)
                        Y = 4'b0011;
                    else
                        Y = 4'b0000;
                end 
                4'b0100: begin 
                    if (A == 4'b0100)
                        Y = 4'b0100;
                    else
                        Y = 4'b0000;
                end 
                4'b1100: begin 
                    if (A == 4'b1100)
                        Y = 4'b0101;
                    else
                        Y = 4'b0000;
                end
                4'b1101:begin 
                    if (A == 4'b1101)
                        Y = 4'b0110;
                    else
                        Y = 4'b0000;
                end 
                4'b1111: begin 
                    if (A == 4'b1111)
                        Y = 4'b0111;
                    else
                        Y = 4'b0000;
                end
                4'b1110:
                begin 
                    if (A == 4'b1110)
                        Y = 4'b1000;
                    else
                        Y = 4'b0000;
                end 
                4'b1010: begin 
                    if (A == 4'b1010)
                        Y = 4'b1001;
                    else
                        Y = 4'b0000;
                end
                default: Y=4'b0000;
            endcase
       end
endmodule