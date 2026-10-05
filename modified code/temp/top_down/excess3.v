`timescale 1ns/1ps

module if_bit (
    input  wire A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
  output wire [3:0]Y
);
  	assign Y = (A) ? B : C;
endmodule

module excess3 (
    input wire[3:0]A, 
    output reg [3:0]Y
);
  wire [3:0] if_out;
  wire [3:0] if_out2;
  wire [3:0] if_out3;
  wire [3:0] if_out4;
  wire [3:0] if_out5;
  wire [3:0] if_out6;
  wire [3:0] if_out7;
    if_bit u1(
        .A(A[0]),
        .B(4'b0100),
        .C(4'b0011),
        .Y(if_out)
    );

    if_bit u2(
        .A(A[0]),
        .B(4'b0110),
        .C(4'b0101),
      .Y(if_out2)
    );

    if_bit u3(
        .A(A[0]),
        .B(4'b1000),
        .C(4'b0111),
      .Y(if_out3)
    );

    if_bit u4(
        .A(A[0]),
        .B(4'b1010),
        .C(4'b1001),
      .Y(if_out4)
    );

    if_bit u5(
        .A(A[0]),
      	.B(4'b1100),
      	.C(4'b1011),
      .Y(if_out5)
    ); //1001 or 1000

    if_bit u6(
        .A(A[0]),
        .B(4'b0),
        .C(4'b0),
      .Y(if_out6)
    ); //1011 or 1010

    if_bit u7(
        .A(A[0]),
        .B(4'b0),
        .C(4'b0),
      .Y(if_out7)
    );
    always @(*)  
        begin
        if (! A[3]) //0
            begin
                if (! A[2]) //00
                    begin
                        if (! A[1]) begin //000
                            
                            Y = if_out; //0001 or 0000
                        end
                        else begin//001
                            
                            Y = if_out2 ; //0011 or 0010
                        end
                    end
                else //01
                    begin
                        if (! A[1]) begin//010
                            
                            Y = if_out3; //0101 or 0100
                        end
                        else begin//011
                            
                            Y = if_out4 ; //0111 or 0110
                        end
                    end
            end
        else //1
            begin
                if (! A[2]) //10
                    begin
                        if (! A[1]) begin//100
                            
                      		Y = if_out5 ;
                        end
                        else begin//101
                            
                            Y = if_out6;
                        end
                    end
                else begin//11
                    
                    Y = if_out7;
                end
            end
        end        
endmodule