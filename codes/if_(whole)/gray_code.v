`timescale 1ns/1ps

module gray_code (input wire[3:0]A, output reg [3:0]Y);
  always @(*)  
    begin
      	if (A == 4'b0000 )
        begin
        	Y = 4'b0000;
        end
      	else
            begin 
                if (A == 4'b0001)
                    Y = 4'b0001;
                else
                    begin 
                        if (A == 4'b0010)
                            Y = 4'b0011;
                        else
                            begin   
                                if (A == 4'b0011)
                                    Y = 4'b0010;
                                else
                                    begin   
                                        if (A == 4'b0100)
                                            Y = 4'b0110;
                                        else
                                            begin   
                                                if (A == 4'b0101)
                                                    Y = 4'b0111;
                                                else
                                                    begin   
                                                        if (A == 4'b0110)
                                                            Y = 4'b0101;
                                                        else
                                                            begin   
                                                                if (A == 4'b0111)
                                                                    Y = 4'b0100;
                                                                else
                                                                   begin   
                                                                        if (A == 4'b1000)
                                                                            Y = 4'b1100;
                                                                        else
                                                                            begin   
                                                                                if (A == 4'b1001)
                                                                                    Y = 4'b1101;
                                                                                else
                                                                                    begin   
                                                                                        if (A == 4'b1010)
                                                                                            Y = 4'b1111;
                                                                                        else
                                                                                            begin   
                                                                                                if (A == 4'b1011)
                                                                                                    Y = 4'b1110;
                                                                                                else
                                                                                                    begin   
                                                                                                        if (A == 4'b1100)
                                                                                                            Y = 4'b1010;
                                                                                                        else
                                                                                                            begin   
                                                                                                                if (A == 4'b1101)
                                                                                                                    Y = 4'b1011;
                                                                                                                else
                                                                                                                    begin   
                                                                                                                        if (A == 4'b1110)
                                                                                                                            Y = 4'b1001;
                                                                                                                        else
                                                                                                                            Y = 4'b1000; 
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
                                    end 
                            end 
                    end       
            end        
    end
endmodule