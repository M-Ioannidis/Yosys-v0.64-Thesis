`timescale 1ns/1ps

module switch_bit (
    input  wire A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
    output reg [3:0]Y
);
  	always @(*)
        begin
            case(A)
                1'b0: Y = B;
                1'b1: Y = C;
            endcase
        end
endmodule

module BCD2421 (
    input wire[3:0]A, 
    output reg [3:0]Y
);
    wire [3:0] switch_out;
    wire [3:0] switch_out2;
    wire [3:0] switch_out3;
    wire [3:0] switch_out4;
    wire [3:0] switch_out5;
    switch_bit u1(
        .A(A[0]),
        .B(4'b0000),
        .C(4'b0001),
        .Y(switch_out)
    );

    switch_bit u2(
        .A(A[0]),
        .B(4'b0010),
        .C(4'b0011),
      .Y(switch_out2)
    );

    switch_bit u3(
        .A(A[0]),
        .B(4'b0100),
        .C(4'b1011),
      .Y(switch_out3)
    );

    switch_bit u4(
        .A(A[0]),
        .B(4'b1100),
        .C(4'b1101),
      .Y(switch_out4)
    );

    switch_bit u5(
        .A(A[0]),
        .B(4'b1110),
        .C(4'b1111),
      .Y(switch_out5)
    );
    
    always @(*)
        begin
            case(A[3])
                1'b0: begin //0
                    case(A[2])
                        1'b0: begin //00
                            case(A[1])
                                1'b0: begin //0000
                                    Y = switch_out;
                                end
                              	1'b1: begin //001
                                    Y = switch_out2;
                                end
                            endcase
                        end
                        1'b1: begin //01
                            case(A[1])
                                1'b0: begin //010
                                    Y = switch_out3;
                                end
                                1'b1: begin //011
                                    Y = switch_out4;
                                end
                            endcase
                        end
                    endcase
                end
                1'b1: begin
                    case(A[2])
                        1'b0: begin //00
                            case(A[1])
                                1'b0: begin //0000
                                    Y = switch_out5;
                                end
                              	1'b1: Y= 4'b0000;
                            endcase
                        end
                        1'b1: Y=4'b0000;
                    endcase
                end
                default: Y=4'b0000;
            endcase
        end
endmodule