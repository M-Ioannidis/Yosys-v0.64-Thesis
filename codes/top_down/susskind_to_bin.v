`timescale 1ns/1ps

module if1 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] if_out1;
  	wire [3:0] if_out2;
    wire [3:0] if_out3;
    if0000 u1 (
        .Y(if_out1)
    );
    if0001 u2 (
        .Y(if_out2)
    );
    if2 u3 (
        .A(A),
        .Y(if_out3)
    );
    always@ (*) begin
        if(A == 4'b0000)
            Y = if_out1;
        else if (A == 4'b0001)
            Y = if_out2; 
        else
            Y = if_out3;
    end
endmodule

module if2 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] if_out4;
  	wire [3:0] if_out5;
    wire [3:0] if_out6;
    if0010 u4 (
        .Y(if_out4)
    );
    if0011 u5 (
        .Y(if_out5)
    );
    if3 u6 (
        .A(A),
        .Y(if_out6)
    );
    always@ (*) begin
        if(A == 4'b0010)
            Y = if_out4;
        else if (A == 4'b0011)
            Y = if_out5; 
        else
            Y = if_out6;
    end
endmodule

module if3 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] if_out7;
  	wire [3:0] if_out8;
    wire [3:0] if_out9;
    if0100 u7 (
        .Y(if_out7)
    );
    if0101 u8 (
        .Y(if_out8)
    );
    if4 u9 (
        .A(A),
        .Y(if_out9)
    );
    always@ (*) begin
        if(A == 4'b0100)
            Y = if_out7;
        else if (A == 4'b0101)
            Y = if_out8; 
        else
            Y = if_out9;
    end
endmodule

module if4 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] if_out10;
  	wire [3:0] if_out11;
    wire [3:0] if_out12;
    if0110 u10 (
        .Y(if_out10)
    );
    if0111 u11 (
        .Y(if_out11)
    );
    if5 u12 (
        .A(A),
        .Y(if_out12)
    );
    always@ (*) begin
        if(A == 4'b0110)
            Y = if_out10;
        else if (A == 4'b0111)
            Y = if_out11; 
        else
            Y = if_out12;
    end
endmodule

module if5 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] if_out13;
  	wire [3:0] if_out14;
    wire [3:0] if_out15;
    if1000 u13 (
        .Y(if_out13)
    );
    if1001 u14 (
        .Y(if_out14)
    );
    if6 u15(
        .A(A),
        .Y(if_out15)
    );
    always@ (*) begin
        if(A == 4'b1000)
            Y = if_out13;
        else if (A == 4'b1001)
            Y = if_out14; 
        else
            Y = if_out15;
    end
endmodule

module if6 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] if_out16;
  	wire [3:0] if_out17;
    wire [3:0] if_out18;
    if1010 u16 (
        .Y(if_out16)
    );
    if1011 u17 (
        .Y(if_out17)
    );
    if7 u18 (
        .A(A),
        .Y(if_out18)
    );
    always@ (*) begin
        if(A == 4'b1010)
            Y = if_out16;
        else if (A == 4'b1011)
            Y = if_out17; 
        else
            Y = if_out18;
    end
endmodule

module if7 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] if_out19;
  	wire [3:0] if_out20;
    wire [3:0] if_out21;
    if1100 u19 (
        .Y(if_out19)
    );
    if1101 u20 (
        .Y(if_out20)
    );
    if8 u21 (
        .A(A),
        .Y(if_out21)
    );
    always@ (*) begin
        if(A == 4'b1100)
            Y = if_out19;
        else if (A == 4'b1101)
            Y = if_out20; 
        else
            Y = if_out21;
    end
endmodule

module if8 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] if_out22;
  	wire [3:0] if_out23;
    if1110 u22 (
        .Y(if_out22)
    );
    if1111 u23 (
        .Y(if_out23)
    );
    always@ (*) begin
        if(A == 4'b1110)
            Y = if_out22;
        else 
            Y = if_out23; 
    end
endmodule


module if0000 (
    output wire [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module if0001 (
    output wire [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module if0010 (
    output wire [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module if0011 (
    output wire [3:0]Y
);
    assign Y = 4'b0001;
endmodule

module if0100 (
    output wire [3:0]Y
);
    assign Y = 4'b0100;
endmodule

module if0101 (
    output wire [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module if0110 (
    output wire [3:0]Y
);
    assign Y = 4'b0011;
endmodule

module if0111 (
    output wire [3:0]Y
);
    assign Y = 4'b0010;
endmodule

module if1000 (
    output wire [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module if1001 (
    output wire [3:0]Y
);
    assign Y = 4'b1001;
endmodule

module if1010 (
    output wire [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module if1011 (
    output wire [3:0]Y
);
    assign Y = 4'b1000;
endmodule

module if1100 (
    output wire [3:0]Y
);
    assign Y = 4'b0101;
endmodule

module if1101 (
    output wire [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module if1110 (
    output wire [3:0]Y
);
    assign Y = 4'b0110;
endmodule

module if1111 (
    output wire [3:0]Y
);
    assign Y = 4'b0111;
endmodule

module susskind_to_bin (
    input wire[3:0]A, 
    output wire [3:0]Y
);
    wire [3:0]out;
    if1 u24 (
        .A(A),
        .Y(out)
    );
    assign Y = out;
endmodule