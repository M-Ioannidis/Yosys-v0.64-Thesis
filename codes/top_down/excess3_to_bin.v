`timescale 1ns/1ps

module if3 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] if2_out1;
  	wire [3:0] if2_out2;
    if2_0 u1 (
        .A(A),
        .Y(if2_out1)
    );
    if2_1 u2 (
        .A(A),
        .Y(if2_out2)
    );
    always@ (*) begin
        if(!A[3])
            Y = if2_out1;
        else 
            Y = if2_out2; 
    end
endmodule

module if2_0 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] if2_out3;
  	wire [3:0] if2_out4;
    if1_00 u3 (
        .A(A),
        .Y(if2_out3)
    );
    if1_01 u4 (
        .A(A),
        .Y(if2_out4)
    );
    always@ (*) begin
        if(!A[2])
            Y = if2_out3;
        else     
            Y = if2_out4;
    end
endmodule

module if2_1 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
  	wire [3:0] if2_out5;
  	wire [3:0] if2_out6;
    if1_10 u5 (
        .A(A),
        .Y(if2_out5)
    );
    if1_11 u6 (
        .A(A),
        .Y(if2_out6)
    );
    always@ (*) begin
        if(!A[2])
            Y = if2_out5;
        else     
            Y = if2_out6;
    end
endmodule

module if1_00 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
  	wire [3:0] if1_out1;
  	wire [3:0] if1_out2;
    if0_000 u7 (
        .A(A),
        .Y(if1_out1)
    );
    if0_001 u8 (
        .A(A),
        .Y(if1_out2)
    );
    always@ (*) begin
        if(!A[1])
            Y = if1_out1;
        else     
            Y = if1_out2;
    end
endmodule

module if1_01 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
  	wire [3:0] if1_out3;
  	wire [3:0] if1_out4;
    if0_010 u9 (
        .A(A),
        .Y(if1_out3)
    );
    if0_011 u10 (
        .A(A),
        .Y(if1_out4)
    );
    always@ (*) begin
        if(!A[1])
            Y = if1_out3;
        else     
            Y = if1_out4;
    end
endmodule

module if1_10 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
  	wire [3:0] if1_out5;
  	wire [3:0] if1_out6;
    if0_100 u11 (
        .A(A),
        .Y(if1_out5)
    );
    if0_101 u12 (
        .A(A),
        .Y(if1_out6)
    );
    always@ (*) begin
        if(!A[1])
            Y = if1_out5;
        else     
            Y = if1_out6;
    end
endmodule

module if1_11 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
  	wire [3:0] if1_out7;
  	wire [3:0] if1_out8;
    if0_110 u13 (
        .A(A),
        .Y(if1_out7)
    );
    if0_111 u14 (
        .A(A),
        .Y(if1_out8)
    );
    always@ (*) begin
        if(!A[1])
            Y = if1_out7;
        else     
            Y = if1_out8;
    end
endmodule

module if0_000 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        if(!A[0])
            Y=4'b0000; //0000
        else
            Y=4'b0000; //0001
    end
endmodule

module if0_001 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        if(!A[0])
            Y=4'b0000; //0010
        else
            Y=4'b0000; //0011
    end
endmodule

module if0_010 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        if(!A[0])
            Y=4'b0001; //0100
        else
            Y=4'b0010; //0101
    end
endmodule

module if0_011 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        if(!A[0])
            Y=4'b0011; //0110
        else
            Y=4'b0100; //0111
    end
endmodule

module if0_100 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        if(!A[0])
            Y=4'b0101; //1000
        else
            Y=4'b0110; //1001
    end
endmodule

module if0_101 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        if(!A[0])
            Y=4'b0111; //1010
        else
            Y=4'b1000; //1011
    end
endmodule

module if0_110 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        if(!A[0])
            Y=4'b1001; //1100
        else
            Y=4'b0000; //1101
    end
endmodule

module if0_111 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        if(!A[0])
            Y=4'b0000; //1110
        else
            Y=4'b0000; //1111
    end
endmodule

module excess3_to_bin (
    input wire[3:0]A, 
    output wire [3:0]Y
);
    wire [3:0]out;
    if3 u15 (
        .A(A),
        .Y(out)
    );
    assign Y = out;
endmodule