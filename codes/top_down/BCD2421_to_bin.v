`timescale 1ns/1ps

module case3 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] case2_out1;
  	wire [3:0] case2_out2;
    case2_0 u1 (
        .A(A),
        .Y(case2_out1)
    );
    case2_1 u2 (
        .A(A),
        .Y(case2_out2)
    );
    always@ (*) begin
        case(A[3])
            1'b0: begin 
                Y = case2_out1;
            end
            1'b1: begin 
                Y = case2_out2;
            end    
        endcase
    end
endmodule

module case2_0 (
    input  wire [3:0]A,
    output reg [3:0]Y
);
  	wire [3:0] case2_out3;
  	wire [3:0] case2_out4;
    case1_00 u3 (
        .A(A),
        .Y(case2_out3)
    );
    case1_01 u4 (
        .A(A),
        .Y(case2_out4)
    );
    always@ (*) begin
        case(A[2])
            1'b0: begin 
                Y = case2_out3;
            end
            1'b1: begin 
                Y = case2_out4;
            end    
        endcase
    end
endmodule

module case2_1 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
  	wire [3:0] case2_out5;
  	wire [3:0] case2_out6;
    case1_10 u5 (
        .A(A),
        .Y(case2_out5)
    );
    case1_11 u6 (
        .A(A),
        .Y(case2_out6)
    );
    always@ (*) begin
        case(A[2])
            1'b0: begin 
                Y = case2_out5;
            end
            1'b1: begin 
                Y = case2_out6;
            end    
        endcase
    end
endmodule

module case1_00 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
  	wire [3:0] case1_out1;
  	wire [3:0] case1_out2;
    case0_000 u7 (
        .A(A),
        .Y(case1_out1)
    );
    case0_001 u8 (
        .A(A),
        .Y(case1_out2)
    );
    always@ (*) begin
        case(A[1])
            1'b0: begin 
                Y = case1_out1;
            end
            1'b1: begin 
                Y = case1_out2;
            end    
        endcase
    end
endmodule

module case1_01 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
  	wire [3:0] case1_out3;
  	wire [3:0] case1_out4;
    case0_010 u9 (
        .A(A),
        .Y(case1_out3)
    );
    case0_011 u10 (
        .A(A),
        .Y(case1_out4)
    );
    always@ (*) begin
        case(A[1])
            1'b0: begin 
                Y = case1_out3;
            end
            1'b1: begin 
                Y = case1_out4;
            end    
        endcase
    end
endmodule

module case1_10 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
  	wire [3:0] case1_out5;
  	wire [3:0] case1_out6;
    case0_100 u11 (
        .A(A),
        .Y(case1_out5)
    );
    case0_101 u12 (
        .A(A),
        .Y(case1_out6)
    );
    always@ (*) begin
        case(A[1])
            1'b0: begin 
                Y = case1_out5;
            end
            1'b1: begin 
                Y = case1_out6;
            end    
        endcase
    end
endmodule

module case1_11 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
  	wire [3:0] case1_out7;
  	wire [3:0] case1_out8;
    case0_110 u13 (
        .A(A),
        .Y(case1_out7)
    );
    case0_111 u14 (
        .A(A),
        .Y(case1_out8)
    );
    always@ (*) begin
        case(A[1])
            1'b0: begin 
                Y = case1_out7;
            end
            1'b1: begin 
                Y = case1_out8;
            end    
        endcase
    end
endmodule

module case0_000 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        case(A[0])
            1'b0: Y=4'b0000; //0000
            1'b1: Y=4'b0001; //0001
        endcase
    end
endmodule

module case0_001 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        case(A[0])
            1'b0: Y=4'b0010; //0010
            1'b1: Y=4'b0011; //0011
        endcase
    end
endmodule

module case0_010 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        case(A[0])
            1'b0: Y=4'b0100; //0100
            1'b1: Y=4'b0000; //0101
        endcase
    end
endmodule

module case0_011 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        case(A[0])
            1'b0: Y=4'b0000; //0110
            1'b1: Y=4'b0000; //0111
        endcase
    end
endmodule

module case0_100 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        case(A[0])
            1'b0: Y=4'b0000; //1000
            1'b1: Y=4'b0000; //1001
        endcase
    end
endmodule

module case0_101 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        case(A[0])
            1'b0: Y=4'b0000; //1010
            1'b1: Y=4'b0101; //1011
        endcase
    end
endmodule

module case0_110 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        case(A[0])
            1'b0: Y=4'b0110; //1100
            1'b1: Y=4'b0111; //1101
        endcase
    end
endmodule

module case0_111 (
    input  wire [3:0] A,
    output reg [3:0]Y
);
    always@ (*) begin
        case(A[0])
            1'b0: Y=4'b1000; //1110
            1'b1: Y=4'b1001; //1111
        endcase
    end
endmodule

module BCD2421_to_bin (
    input wire[3:0]A, 
    output wire [3:0]Y
);
    wire [3:0]out;
    case3 u15 (
        .A(A),
        .Y(out)
    );
    assign Y = out;
endmodule