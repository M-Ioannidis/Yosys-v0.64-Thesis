`timescale 1ns/1ps

module if_bit #(parameter width = 4, parameter mem = 1)(
    input  wire A,
  	input  wire [width-1:0]B,
    input  wire [width-1:0]C, 
    input  wire D,
    output wire [width-1:0]Y,
    output wire [width-1:1]G
);
  	assign Y = (A) ? B : C;
    assign G = 1'b0;
endmodule

module switch_bit #(parameter width = 1, localparam mem = 1)(
    input  wire A,
  	input  wire [width-1:0]B,
    input  wire [width-1:0]C, 
    output reg [width-1:0]Y
);
  	always @(*)
        begin
            case(A)
                1'b0: Y = B;
                1'b1: Y = C;
            endcase
        end
endmodule

module useless(
    input  wire A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
    output reg [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module useless2 #(parameter width=4)(
    input  wire A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
    output reg [3:0]Y
);
    assign Y = width;
endmodule

module useless3 #(localparam mem=4)(
    input  wire A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
    output reg [3:0]Y
);
    assign Y = mem;
endmodule

module useless4 #(parameter mem=4)(
    input  wire A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
    output reg [3:0]Y
);
    assign Y = mem;
    always
        begin
            Y = A ? mem : B;
        end
endmodule

module useless5 #(parameter mem=4)(
    input  wire A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
    output reg [3:0]Y
);
    always
        begin
            Y = A ? mem : B;
        end
    assign Y = mem;
endmodule

module useless6 #(parameter mem=4)(
    input  wire A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
    output reg [3:0]Y
);
    assign Y = A^B;
endmodule

module XS3_Gray_to_bin 
    #(width=4)(
        input wire[3:0]A, 
        input wire [3:0]B, 
        input wire [3:0]C, 
        output reg [3:0]Y
    );
    wire [3:0]if_out; 
    wire [3:0]if_out2; 
    wire [3:0]if_out3;
    wire [3:0]if_out4;
    wire [3:0]switch_out; 
    wire [3:0]switch_out2;
    wire [3:0]switch_out3;
  	wire [3:0]switch_out4;
    wire [3:0]useless;
    wire [3:0]useless2;
    wire [3:0]useless3;
    wire [3:0]useless4;
    wire [3:0]useless5;
    if_bit #(.width(width)) u1 (
        .A(A[0]),
        .B(4'b0000),
        .C(4'b0000),
        .Y(if_out)
    );
    if_bit #(.width()) u2 (
        .A(A[0]),
        .B(4'b0000),
        .C(4'b0000),
        .Y(if_out)
    );
    if_bit #(.width(3'b100)) u3 (
        .A(A[0]),
        .B(4'b0011),
        .C(4'b0100),
        .Y(if_out2)
    );
    if_bit #() u4 (
        .A(A[0]),
      	.B(4'b0110),
      	.C(4'b0101),
        .Y(if_out3)
    );


    if_bit #(.width(4'b0000 ^ 4'b1000)) u5(
        .A(A[0]),
        .B(4'b0111),
        .C(4'b1000),
        .Y(if_out4)
    );

    
    switch_bit #(.width(3'h3)) u7 (
        .A(A[0]),
        .B(4'b0001),
        .C(4'b0010),
        .Y(switch_out)
    );
    switch_bit #(.width(3'o3)) u8(
        .A(A[0]),
        .B(4'b1110),
        .C(4'b1010),
        .Y(switch_out2)
    );
    switch_bit #(.width(3'd3)) u9(
        .A(A[0]),
        .B(4'b0000),
        .C(4'b0000),
        .Y(switch_out3)
    );
    switch_bit #(.width(3)) u10(
        .A(A[0]),
        .B(1'b0),
        .C(1'b1),
        .Y(switch_out3)
    );
    switch_bit #(.width(3'b100)) u11(
        .A(A[0]),
      .B( 4'b1001),
        .C(4'b0000),
        .Y(switch_out4)
    );
    
    useless2 #(.width(3'b100)) u12(
        .Y(useless)
    );

    useless3 u13(
        .B(1'bx),
        .Y(useless2)
    );

    useless4 u14(
        .Y(useless3)
    );

    useless5 u15(
        .Y(useless4)
    );

    useless6 u16(
        .A(1'b1),
        .B(4'b1111),
        .Y(useless5)
    );

    always @(*)  
        begin
        if (! A[3]) //0
            begin
                if (! A[2]) //00
                    begin
                        if (! A[1]) //000
                            Y = if_out; //0001 or 0000
                        else //001
                            Y = if_out; //0011 or 0010
                    end
                else //01
                    begin
                        case(A[1])
                            1'b0:   
                                Y = if_out2; //0101 or 0100
                            1'b1:
                                Y = switch_out; //0111 or 0110 
                        endcase
                    end
            end
        else //1
            case(A[2])
                1'b0: begin //10
                    case(A[1] == 1'b1)
                        1'b0: begin //100
                                Y = switch_out3; //1001 or 1000
                        end
                        1'b1: begin //101
                                Y = switch_out4; //1011 or 1010
                        end
                    endcase
                end
                1'b1: begin
                  if(!A[1])
                        Y = if_out3; //1101 or 1100
                    else 
                        Y = if_out4; //1111 or 1110
                end
            endcase
        end   
endmodule