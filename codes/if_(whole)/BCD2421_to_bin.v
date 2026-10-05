`timescale 1ns/1ps

module BCD2421_to_bin (input wire[3:0]A, output reg [3:0]Y);
  always @(*)  
    begin
      if (A < 4'b0001)
        begin
        	Y = 4'bxxxx;
        end
      	else
            begin 
                if (A > 4'b0000 && A < 4'b0010)
                    Y = 4'b0001;
                else
                    begin 
                        if (A > 4'b0001 && A < 4'b0011)
                            Y = 4'b0010;
                        else
                            begin   
                                if (A > 4'b0010 && A < 4'b0100)
                                    Y = 4'b0011;
                                else
                                    begin   
                                        if (A > 4'b0011 && A < 4'b0101)
                                            Y = 4'b0100;
                                        else
                                            begin   
                                                if (A > 4'b1010 && A < 4'b1100)
                                                    Y = 4'b0101;
                                                else
                                                    begin   
                                                        if (A > 4'b1011 && A < 4'b1101)
                                                            Y = 4'b0110;
                                                        else
                                                            begin
                                                                if (A > 4'b1100 && A < 4'b1110)
                                                                    Y = 4'b0111;
                                                                else
                                                                    begin
                                                                        if (A > 4'b1101 && A < 4'b1111)
                                                                            Y = 4'b1000;
                                                                        else
                                                                            begin 
                                                                                if (A > 4'b1110 && A < 5'b10000)
                                                                                    Y = 4'b1001;
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