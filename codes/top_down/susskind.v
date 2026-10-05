`timescale 1ns/1ps
module if_whole (
    input  wire [3:0]A,
  	input  wire [3:0]B,
    input  wire [3:0]C, 
    input  wire [3:0]D,
  output reg [3:0]Y
);
    always @(*) begin
  	    if (A == B)
            Y = C;
        else
            Y = D;
    end
endmodule


module susskind (
    input wire[3:0]A, 
    output reg [3:0]Y
);
    wire [3:0]if_out;
    wire [3:0]if_out2;
    wire [3:0]if_out3;
    wire [3:0]if_out4;
    wire [3:0]if_out5;
    if_whole u1(
        .A(A),
        .B(4'b0000),
        .C(4'b0001),
        .D(4'b0011),
        .Y(if_out)
    );
    if_whole u2(
        .A(A),
        .B(4'b0010),
        .C(4'b0111),
        .D(4'b0110),
        .Y(if_out2)
    );
    if_whole u3(
        .A(A),
        .B(4'b0100),
        .C(4'b0100),
        .D(4'b1100),
        .Y(if_out3)
    );
    if_whole u4(
        .A(A),
        .B(4'b0110),
        .C(4'b1110),
        .D(4'b1111),
        .Y(if_out4)
    );
    if_whole u5(
        .A(A),
        .B(4'b1000),
        .C(4'b1011),
        .D(4'b1001),
        .Y(if_out5)
    );

    always @(*)  
    begin
      if (A == 4'b0000 )
        begin
            Y = if_out;
        end
      	else
            begin 
                if (A == 4'b0001)
                    Y = if_out;
                else
                    begin 
                        if (A == 4'b0010)
                            Y = if_out2;
                        else
                            begin   
                                if (A == 4'b0011)
                                    Y = if_out2;
                                else
                                    begin   
                                        if (A == 4'b0100)
                                            Y = if_out3;
                                        else
                                            begin   
                                                if (A == 4'b0101)
                                                    Y = if_out3;
                                                else
                                                    begin   
                                                        if (A == 4'b0110)
                                                            Y = if_out4;
                                                        else
                                                            begin   
                                                                if (A == 4'b0111)
                                                                    Y = if_out4;
                                                                else
                                                                    begin   
                                                                        if (A == 4'b1000)
                                                                            Y = if_out5;
                                                                        else
                                                                            begin   
                                                                                if (A == 4'b1001)
                                                                                    Y = if_out5;
                                                                                else
                                                                                    Y = 4'b0000;
                                                                            end 
                                                                    end 
                                                            end 
                                                    end 
                                            end 
                                    end 
                            end 
                    end       
            end        
    end
endmodule