`timescale 1ns/1ps

module if_bit (
    input  wire A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
    input  wire D,
    output wire [3:0]Y,
    output wire [3:1]G
);
  	assign Y = (A) ? B : C;
    assign G = 1'b0;
endmodule

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

module useless(
    input  wire A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
    output reg [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module useless2(
    input  wire A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
    output reg [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module nouse (
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

module XS3_Gray (
    input wire[3:0]A, 
    output reg [3:0]Y
);
    wire [3:0]if_out; 
    wire [3:0]if_out2; 
    wire [3:0]if_out3;
    wire [3:0]if_out4;
    wire [3:0]switch_out; 
    wire [3:0]switch_out2;
    wire [3:0]switch_out3; 
    wire [3:0]useless;
    wire [3:0]nouse;
    if_bit u1(
        .A(A[0]),
        .B(4'b0110),
        .C(4'b0010),
        .Y(if_out)
    );
    if_bit u2(
        .A(A[0]),
      	.B(4'b0110),
        .C(4'b0010),
        .Y(if_out)
    );
    if_bit u3(
        .A(A[0]),
      .B(4'b0101),
      .C(4'b0111),
        .Y(if_out2)
    );
    if_bit u4(
        .A(A[0]),
      .B(4'b1111),
      .C(4'b1101),
        .Y(if_out3)
    );


    if_bit u5(
        .A(A[0]),
        .B(5'b10000),
      	.C(5'b00100),
        .Y(if_out4)
    );
    if_bit u6(
        .A(A[0]),
      .B(4'b0100),
      .C(4'b0010),
        .Y(if_out4)
    );

    
    switch_bit u7(
        .A(A[0]),
      	.B(4'b0100),
        .C(4'b1100),
        
        .Y(switch_out)
    );
    switch_bit u8(
        .A(A[0]),
        .B(4'b0100),
        .C(4'b1100),
        .Y(switch_out)
    );
    switch_bit u9(
        .A(A[0]),
      .B(4'b1110),
      .C(4'b1010),
        .Y(switch_out2)
    );
    switch_bit u10(
        .A(A[0]),
        .B(1'b0),
        .C(1'b1),
        .Y(switch_out3)
    );
    switch_bit u11(
        .A(A[0]),
        .B(4'b0000),
        .C(4'b0100),
        .Y(switch_out3)
    );

    useless2 u12(
        .Y(useless2)
    );
    
    nouse u13 (
        .Y(nouse)
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
                            Y = if_out2; //0011 or 0010
                    end
                else //01
                    begin
                        case(A[1])
                            
                            1'b0:
                                Y = switch_out; //0101 or 0100
                          	1'b1:   
                                Y = if_out3; 
                        endcase
                    end
            end
        else //1
            case(A[2])
                1'b0: begin //10
                    case(A[1])
                        1'b0: begin //100
                                Y = switch_out2;
                        end
                        1'b1: begin //101
                                Y = switch_out3;
                        end
                    endcase
                end
                1'b1: begin
                    if(!A[0])
                        Y = if_out4;
                    else
                        Y = if_out4;
                end
            endcase
        end   
endmodule