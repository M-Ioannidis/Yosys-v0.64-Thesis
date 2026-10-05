`timescale 1ns/1ps

module case1 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] case_out1;
  	wire [3:0] case_out2;
    wire [3:0] case_out3;
    case0000 u1 (
        .Y(case_out1)
    );
    case0001 u2 (
        .Y(case_out2)
    );
    case2 u3 (
        .A(A),
        .Y(case_out3)
    );
    always@ (*) begin
        case(A)
            4'b0000: Y = case_out1;
            4'b0001: Y = case_out2; 
            default: Y = case_out3;
        endcase
    end
endmodule

module case2 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] case_out4;
  	wire [3:0] case_out5;
    wire [3:0] case_out6;
    case0010 u4 (
        .Y(case_out4)
    );
    case0011 u5 (
        .Y(case_out5)
    );
    case3 u6 (
        .A(A),
        .Y(case_out6)
    );
    always@ (*) begin
        case(A)
            4'b0010: Y = case_out4;
            4'b0011: Y = case_out5; 
            default: Y = case_out6;
        endcase
    end
endmodule

module case3 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] case_out7;
  	wire [3:0] case_out8;
    wire [3:0] case_out9;
    case0100 u7 (
        .Y(case_out7)
    );
    case0101 u8 (
        .Y(case_out8)
    );
    case4 u9 (
        .A(A),
        .Y(case_out9)
    );
    always@ (*) begin
        case(A)
            4'b0100: Y = case_out7;
            4'b0101: Y = case_out8; 
            default: Y = case_out9;
        endcase
    end
endmodule

module case4 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] case_out10;
  	wire [3:0] case_out11;
    wire [3:0] case_out12;
    case0110 u10 (
        .Y(case_out10)
    );
    case0111 u11 (
        .Y(case_out11)
    );
    case5 u12 (
        .A(A),
        .Y(case_out12)
    );
    always@ (*) begin
        case(A)
            4'b0110: Y = case_out10;
            4'b0111: Y = case_out11; 
            default: Y = case_out12;
        endcase
    end
endmodule

module case5 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] case_out13;
  	wire [3:0] case_out14;
    wire [3:0] case_out15;
    case1000 u13 (
        .Y(case_out13)
    );
    case1001 u14 (
        .Y(case_out14)
    );
    case6 u15(
        .A(A),
        .Y(case_out15)
    );
    always@ (*) begin
        case(A)
            4'b1000: Y = case_out13;
            4'b1001: Y = case_out14; 
            default: Y = case_out15;
        endcase
    end
endmodule

module case6 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] case_out16;
  	wire [3:0] case_out17;
    wire [3:0] case_out18;
    case1010 u16 (
        .Y(case_out16)
    );
    case1011 u17 (
        .Y(case_out17)
    );
    case7 u18 (
        .A(A),
        .Y(case_out18)
    );
    always@ (*) begin
        case(A)
            4'b1010: Y = case_out16;
            4'b1011: Y = case_out17; 
            default: Y = case_out18;
        endcase
    end
endmodule

module case7 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] case_out19;
  	wire [3:0] case_out20;
    wire [3:0] case_out21;
    case1100 u19 (
        .Y(case_out19)
    );
    case1101 u20 (
        .Y(case_out20)
    );
    case8 u21 (
        .A(A),
        .Y(case_out21)
    );
    always@ (*) begin
        case(A)
            4'b1100: Y = case_out19;
            4'b1101: Y = case_out20; 
            default: Y = case_out21;
        endcase
    end
endmodule

module case8 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] case_out22;
  	wire [3:0] case_out23;
    case1110 u22 (
        .Y(case_out22)
    );
    case1111 u23 (
        .Y(case_out23)
    );
    always@ (*) begin
        case(A)
            4'b1110: Y = case_out22;
            4'b1111: Y = case_out23; 
            default: Y = 4'b0000;
        endcase
    end
endmodule


module case0000 (
    output reg [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module case0001 (
    output reg [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module case0010 (
    output reg [3:0]Y
);
    assign Y = 4'b0010;
endmodule

module case0011 (
    output reg [3:0]Y
);
    assign Y = 4'b0001;
endmodule

module case0100 (
    output reg [3:0]Y
);
    assign Y = 4'b0100;
endmodule

module case0101 (
    output reg [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module case0110 (
    output reg [3:0]Y
);
    assign Y = 4'b0011;
endmodule

module case0111 (
    output reg [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module case1000 (
    output reg [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module case1001 (
    output reg [3:0]Y
);
    assign Y = 4'b1001;
endmodule

module case1010 (
    output reg [3:0]Y
);
    assign Y = 4'b0111;
endmodule

module case1011 (
    output reg [3:0]Y
);
    assign Y = 4'b1000;
endmodule

module case1100 (
    output reg [3:0]Y
);
    assign Y = 4'b0101;
endmodule

module case1101 (
    output reg [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module case1110 (
    output reg [3:0]Y
);
    assign Y = 4'b0110;
endmodule

module case1111 (
    output reg [3:0]Y
);
    assign Y = 4'b0000;
endmodule

module OBrienII_to_bin (
    input wire[3:0]A, 
    output wire [3:0]Y
);
    wire [3:0]out;
    case1 u24 (
        .A(A),
        .Y(out)
    );
    assign Y = out;
endmodule