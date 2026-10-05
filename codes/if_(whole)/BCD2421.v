`timescale 1ns/1ps

module BCD2421 (input wire[3:0]A, output reg [3:0]Y);
  always @(*)  
    begin
        if (A <= 4'b0000 )
        begin
        	Y = 4'b0000;
        end
      	else
            begin 
                if (A >= 4'b0001 && A <= 4'b0001)
                    Y = 4'b0001;
                else
                    begin 
                        if (A >= 4'b0010 && A <= 4'b0010)
                            Y = 4'b0010;
                        else
                            begin   
                                if (A >= 4'b0011 && A <= 4'b0011)
                                    Y = 4'b0011;
                                else
                                    begin   
                                        if (A >= 4'b0100 && A <= 4'b0100)
                                            Y = 4'b0100;
                                        else
                                            begin   
                                                if (A >= 4'b0101 && A <= 4'b0101)
                                                    Y = 4'b1011;
                                                else
                                                    begin   
                                                        if (A >= 4'b0110 && A <= 4'b0110)
                                                            Y = 4'b1100;
                                                        else
                                                            begin
                                                                if (A >= 4'b0111 && A <= 4'b0111)
                                                                    Y = 4'b1101;
                                                                else
                                                                    begin
                                                                        if (A >= 4'b1000 && A <= 4'b1000)
                                                                            Y = 4'b1110;
                                                                        else
                                                                            begin
                                                                                if (A >= 4'b1001 && A <= 4'b1001)
                                                                                    Y = 4'b1111;
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