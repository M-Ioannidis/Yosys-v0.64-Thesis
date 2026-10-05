`timescale 1ns/1ps

module susskind (input wire[3:0]A, output reg [3:0]Y);
    always @(A)
        begin
            casez(A)
            	1'b?: Y = 1'bx;
                4'b0000: Y=4'h1;
                4'b0001: Y=4'o3;
                4'b0010: Y=4'd7;
                4'b0011: Y=6;
                4'b0100: Y=4'b0100;
                4'b0101: Y=4'b1100;
                4'b0110: Y=4'b1110;
                4'b0111: Y=4'b1111;
                4'b0111: Y=4'b1111;
                4'b1000: Y=4'b1011;
                4'b1001: Y=4'b1001;
                default: Y=4'b0000;
            endcase
            casex(A)
            	4'bxxxx: Y=4'bxxxx;
                4'b0000: Y=4'h1;
                4'b0001: Y=4'o3;
                4'b0010: Y=4'd7;
                4'b0011: Y=4'b0110;
                4'b0100: Y=4'b0100;
                4'b0101: Y=4'b1100;
                4'b0110: Y=4'b1110;
                4'b0111: Y=4'b1111;
                4'b0111: Y=4'b1111;
                4'b1000: Y=4'b1011;
                4'b1001: Y=4'b1001;
                4'b1010: Y=4'b0000;
                default: Y=4'b0000;
            endcase
            case(A)
                4'b0000: Y=4'h1;
                4'b0001: Y=4'o3;
                4'b0010: Y=4'd7;
                4'b0011: Y=4'b0110;
                4'b0100: Y=4'b0100;
                4'b0101: Y=4'b1100;
                4'b0110: Y=4'b1110;
                4'b0111: Y=4'b1111;
                4'b0111: Y=4'b1111;
                4'b1000: Y=4'b1011;
                4'b1001: Y=4'b1001;
                default: Y=4'b0000;
            endcase
        end
endmodule