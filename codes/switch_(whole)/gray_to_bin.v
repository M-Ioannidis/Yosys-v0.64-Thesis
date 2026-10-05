`timescale 1ns/1ps

module gray_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)
       begin
            case(A)
                4'b0000: Y=4'b0000;
                4'b0001: Y=4'b0001;
                4'b0011: Y=4'b0010;
                4'b0010: Y=4'b0011;
                4'b0110: Y=4'b0100;
                4'b0111: Y=4'b0101;
                4'b0101: Y=4'b0110;
                4'b0100: Y=4'b0111;
                4'b1100: Y=4'b1000;
                4'b1101: Y=4'b1001;
                4'b1111: Y=4'b1010;
                4'b1110: Y=4'b1011;
                4'b1010: Y=4'b1100;
                4'b1011: Y=4'b1101;
                4'b1001: Y=4'b1110;
                4'b1000: Y=4'b1111;
            endcase
       end
endmodule