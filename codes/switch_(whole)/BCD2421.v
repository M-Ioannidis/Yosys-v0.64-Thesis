`timescale 1ns/1ps

module BCD2421 (input wire[3:0]A, output reg [3:0]Y);
    always @(A)
        begin
            case(A)
                4'b0000: Y=4'b0000;
                4'b0001: Y=4'b0001;
                4'b0010: Y=4'b0010;
                4'b0011: Y=4'b0011;
                4'b0100: Y=4'b0100;
                4'b0101: Y=4'b1011;
                4'b0110: Y=4'b1100;
                4'b0111: Y=4'b1101;
                4'b1000: Y=4'b1110;
                4'b1001: Y=4'b1111;
                default: Y=4'b0000;
            endcase
            case(A)
                4'b0000: Y=4'b0000;
                4'b0001: Y=4'b0001;
                4'b0010: Y=4'b0010;
                4'b0011: Y=4'b0011;
                4'b0100: Y=4'b0100;
                4'b0101: Y=4'b1011;
                4'b0110: Y=4'b1100;
                4'b0111: Y=4'b1101;
                4'b1000: Y=4'b1110;
                4'b1001: Y=4'b1111;
                default: Y=4'b0000;
            endcase
        end
endmodule