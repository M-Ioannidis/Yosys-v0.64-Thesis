`timescale 1ns/1ps

module OBrienII_to_bin (input wire[3:0]A, output reg [3:0]Y);
    (* init = 4'b0 *)
    wire [3:0]inited;

    wire [3:0]check = 4'b0100;
    wire [3:0]check2 = 4'b1001;
    wire [3:0]check3 = ~4'b0011;
    always @(*)
        begin
            case(A)
                6'b110000: Y = 4'bxxxx;
                4'h1: Y = inited;
                4'd3: Y = 4'b0001;
                2: Y = 4'b0010;
                4'o6: Y = 4'b0011;
                4'b0100: Y = check;
                check3: Y = 4'b0101;
                4'b1110 | 4'b1110: Y = ~check2;
                32'b1010: Y = 4'b0111;
                4'b1011: Y = 4'b1000;
                4'b1011: Y = 4'b1001;
                32'b00000000000000000000000000001001: Y = 4'b1001;
                default: Y=4'b0000;
            endcase
        end
    always @(*)
        begin
            case(A)
                6'b110000: Y = 4'bxxxx;
                4'h1: Y = inited;
                4'd3: Y = 4'b0001;
                2: Y = 4'b0010;
                4'o6: Y = 4'b0011;
                4'b0100: Y = check;
                check3: Y = 4'b0101;
                4'b1110 | 4'b1110: Y = ~check2;
                32'b1010: Y = 4'b0111;
                4'b1011: Y = 4'b1000;
                4'b1011: Y = 4'b1001;
                32'b00000000000000000000000000001001: Y = 4'b1001;
                default: Y=4'b0000;
            endcase
        end
endmodule