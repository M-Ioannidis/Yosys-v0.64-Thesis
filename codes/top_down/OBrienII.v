`timescale 1ns/1ps
module case_whole (
    input  wire [3:0]A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
    input  wire [3:0]D,
  output reg [3:0]Y
);
    always @(*) begin
  	    case (A)
            B: Y = C;
            default: Y = D;
        endcase
    end
endmodule


module OBrienII (
    input wire[3:0]A, 
    output reg [3:0]Y
);
    wire [3:0]case_out;
    wire [3:0]case_out2;
    wire [3:0]case_out3;
    wire [3:0]case_out4;
    wire [3:0]case_out5;
    case_whole u1(
        .A(A),
        .B(4'b0000),
        .C(4'b0001),
        .D(4'b0011),
        .Y(case_out)
    );
    case_whole u2(
        .A(A),
        .B(4'b0010),
        .C(4'b0010),
        .D(4'b0110),
        .Y(case_out2)
    );
    case_whole u3(
        .A(A),
        .B(4'b0100),
        .C(4'b0100),
        .D(4'b1100),
        .Y(case_out3)
    );
    case_whole u4(
        .A(A),
        .B(4'b0110),
        .C(4'b1110),
        .D(4'b1010),
        .Y(case_out4)
    );
    case_whole u5(
        .A(A),
        .B(4'b1000),
        .C(4'b1011),
        .D(4'b1001),
        .Y(case_out5)
    );

    always @(*)  
    begin
        case (A)
            4'b0000: begin
                case(A)
                    4'b0000: Y = case_out;
                    default: Y = 4'b0000;
                endcase
            end
            4'b0001: begin
                case(A)
                    4'b0001: Y = case_out;
                    default: Y = 4'b0000;
                endcase
            end
            4'b0010: begin 
                case(A)
                    4'b0010: Y = case_out2;
                    default: Y = 4'b0000;    
                endcase
            end
            4'b0011: begin
                case(A)
                    4'b0011: Y = case_out2;
                    default: Y = 4'b0000;
                endcase
            end
            4'b0100: begin
                case(A)
                    4'b0100: Y = case_out3;
                    default: Y = 4'b0000;
                endcase
            end
            4'b0101: begin
                case(A)
                    4'b0101: Y = case_out3;
                    default: Y = 4'b0000;
                endcase
            end
            4'b0110: begin
                case(A)
                    4'b0110: Y = case_out4;
 		    default: Y = 4'b0000;
                endcase
            end                          
            4'b0111: begin
                case(A)
                    4'b0111: Y = case_out4;
                    default: Y = 4'b0000;
                endcase
            end                                                                                                                                
            4'b1000: begin
                case(A)
                    4'b1000: Y = case_out5;
                    default: Y = 4'b0000;
                endcase
            end
            4'b1001: begin
                case(A)
                    4'b1001: Y = case_out5;
		    default: Y = 4'b0000;
                endcase
            end
            default: Y = 4'b0000;
        endcase
                                           
    end
endmodule