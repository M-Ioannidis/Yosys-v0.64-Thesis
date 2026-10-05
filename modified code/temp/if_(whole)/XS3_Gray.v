
`timescale 1ns/1ps

module XS3_Gray (
    input  wire [3:0] A,
    output reg  [3:0] Y
);
    always @(*) begin
        if (A == 4'b0000)
            begin
                if (A == 4'b0000)
                    begin
                        if (A == 4'b0000)
                            Y = 4'b0010;
                        else
                            Y = 4'b0000;
                    end
                else
                    Y = 4'b0000;
            end

        else begin
            if (A == 4'b0001)
                begin
                    if (A == 4'b0001)
                        begin
                            if (A == 4'b0001)
                                Y = 4'b0110;
                            else
                                Y = 4'b0000;
                        end
                    else
                        Y = 4'b0000;
                end
            else begin
                if (A == 4'b0010)
                    begin
                        if (A == 4'b0010)
                            begin
                                if (A == 4'b0010)
                                    Y = 4'b0111;
                                else
                                    Y = 4'b0000;
                            end
                        else
                            Y = 4'b0000;
                    end
                else begin
                    if (A == 4'b0011)
                        begin
                            if (A == 4'b0011)
                                begin
                                    if (A == 4'b0011)
                                        Y = 4'b0101;
                                    else
                                        Y = 4'b0000;
                                end
                            else
                                Y = 4'b0000;
                        end
                    else begin
                        if (A == 4'b0100)
                            begin
                                if (A == 4'b0100)
                                    begin
                                        if (A == 4'b0100)
                                            Y = 4'b0100;
                                        else
                                            Y = 4'b0000;
                                    end
                                else
                                    Y = 4'b0000;
                            end
                        else begin
                            if (A == 4'b0101)
                                begin
                                    if (A == 4'b0101)
                                        begin
                                            if (A == 4'b0101)
                                                Y = 4'b1100;
                                            else
                                                Y = 4'b0000;
                                        end
                                    else
                                        Y = 4'b0000;
                                end
                            else begin
                                if (A == 4'b0110)
                                    begin
                                        if (A == 4'b0110)
                                            begin
                                                if (A == 4'b0110)
                                                    Y = 4'b1101;
                                                else
                                                    Y = 4'b0000;
                                            end
                                        else
                                            Y = 4'b0000;
                                    end
                                else begin
                                    if (A == 4'b0111)
                                        begin
                                            if (A == 4'b0111)
                                                begin
                                                    if (A == 4'b0111)
                                                        Y = 4'b1111;
                                                    else
                                                        Y = 4'b0000;
                                                end
                                            else
                                                Y = 4'b0000;
                                        end
                                    else begin
                                        if (A == 4'b1000)
                                            begin
                                                if (A == 4'b1000)
                                                    begin
                                                        if (A == 4'b1000)
                                                            Y = 4'b1110;
                                                        else
                                                            Y = 4'b0000;
                                                    end
                                                else
                                                    Y = 4'b0000;
                                            end
                                        else begin
                                            if (A == 4'b1001)
                                                begin
                                                    if (A == 4'b1001)
                                                        begin
                                                            if (A == 4'b1001)
                                                                Y = 4'b1010;
                                                            else
                                                                Y = 4'b0000;
                                                        end
                                                    else
                                                        Y = 4'b0000;
                                                end
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
