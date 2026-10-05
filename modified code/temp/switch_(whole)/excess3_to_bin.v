`timescale 1ns/1ps

module excess3_to_bin (input wire[3:0]A, output reg [3:0]Y);
    always @(*)
        begin
            case(A)
                {!1'b1, !1'b1, !1'b0, !1'b0}: Y = 4'b0000;
                {!1'b0, !1'b1, !1'b0, !1'b0}: Y = 4'b0001;
                {!1'b1, !1'b0, !1'b0, !1'b1}: Y = 4'b0010;
                {!1'b0, !1'b1, !1'b1, !1'b0}: Y = 4'b0011;
                {!1'b0, !1'b1, !1'b1, !1'b1}: Y = 4'b0100;
                {!1'b1, !1'b0, !1'b0, !1'b0}: Y = 4'b0101;
                {!1'b1, !1'b0, !1'b0, !1'b1}: Y = 4'b0110;
                {!1'b1, !1'b0, !1'b1, !1'b0}: Y = 4'b0111;
                {!1'b1, !1'b0, !1'b1, !1'b1}: Y = 4'b1000;
                {!1'b0, !1'b0, !1'b1, !1'b1}: Y = 4'b1001;
                default: Y = 4'b0000;
            endcase
        end
endmodule