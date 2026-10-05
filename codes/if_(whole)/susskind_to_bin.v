`timescale 1ns/1ps

module susskind_to_bin (input wire[3:0]A, output reg [3:0]Y, output wire unused);
    (* init = 1'b0 *)
    wire inited=1'b0;

    wire [3:0]check = 4'b0100;
    wire [3:0]check2 = 4'b1001;
    always @(*)  
        begin
            if (A > 4'b0000 && A < 4'b0000)
                Y = 4'b0000;
            if (B == 4'b0000)
                M = 4'b0;
	    else
		M = 4'bz;
            if (A == 4'h0000 )
                begin
                    Y = inited;
                end
            else
                begin 
                    if (A == 4'd1)
                        Y = 4'b0000;
                    else
                        begin 
                            if (A == 4'o2)
                                Y = 4'b0000;
                            else
                                begin   
                                    if (A == 3)
                                        Y = 4'b0001;
                                    else
                                        begin   
                                            if (A == check)
                                                Y = 4'b0100;
                                            else
                                                begin   
                                                    if ((~A) == 4'b1010)
                                                        Y = 4'b0000;
                                                    else
                                                        begin   
                                                            if (A == ~(check2))
                                                                Y = 4'b0011;
                                                            else
                                                                begin   
                                                                    if (A == 4'b0111 == 1'b1 == 1'b1 === 1'b1)
                                                                        Y = 4'b0010;
                                                                    else
                                                                        begin   
                                                                            if (A == 4'b1000 && 1'bx === 1'bx)
                                                                                Y = 4'b0000;
                                                                            else
                                                                                begin   
                                                                                    if (A == 4'b1001 && 1'bz === 1'bz)
                                                                                        Y = 4'b1001;
                                                                                    else
                                                                                        begin   
                                                                                            if (A == (4'b1010 & 4'b1010 | 4'b1010))
                                                                                                Y = 4'b0000;
                                                                                            else
                                                                                                begin   
                                                                                                    if ((A & A) == (4'b1011 & 4'b1011) )
                                                                                                        Y = 4'b1000;
                                                                                                    else
                                                                                                        begin   
                                                                                                            if (4'b1100 == A)
                                                                                                                Y = 4'b0101;
                                                                                                            else
                                                                                                                begin   
                                                                                                                    if (A == 4'b1101 != 1'b0)
                                                                                                                        Y = 4'b0000;
                                                                                                                    else
                                                                                                                        begin   
                                                                                                                            if (A == 4'b1110)
                                                                                                                                Y = 4'b0110;
                                                                                                                            else
                                                                                                                                Y = 4'b0111; 
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
    always @(*)  
        begin
            if (A > 4'b0000 && A < 4'b0000)
                Y = 4'b0000;
            if (B == 4'b0000)
                M = 4'b0;
	    else
		M = 4'bz;
            if (A == 4'h0000 )
                begin
                    Y = inited;
                end
            else
                begin 
                    if (A == 4'd1)
                        Y = 4'b0000;
                    else
                        begin 
                            if (A == 4'o2)
                                Y = 4'b0000;
                            else
                                begin   
                                    if (A == 3)
                                        Y = 4'b0001;
                                    else
                                        begin   
                                            if (A == check)
                                                Y = 4'b0100;
                                            else
                                                begin   
                                                    if ((~A) == 4'b1010)
                                                        Y = 4'b0000;
                                                    else
                                                        begin   
                                                            if (A == ~(check2))
                                                                Y = 4'b0011;
                                                            else
                                                                begin   
                                                                    if (A == 4'b0111 == 1'b1 == 1'b1 === 1'b1)
                                                                        Y = 4'b0010;
                                                                    else
                                                                        begin   
                                                                            if (A == 4'b1000 && 1'bx === 1'bx)
                                                                                Y = 4'b0000;
                                                                            else
                                                                                begin   
                                                                                    if (A == 4'b1001 && 1'bz === 1'bz)
                                                                                        Y = 4'b1001;
                                                                                    else
                                                                                        begin   
                                                                                            if (A == (4'b1010 & 4'b1010 | 4'b1010))
                                                                                                Y = 4'b0000;
                                                                                            else
                                                                                                begin   
                                                                                                    if ((A & A) == (4'b1011 & 4'b1011) )
                                                                                                        Y = 4'b1000;
                                                                                                    else
                                                                                                        begin   
                                                                                                            if (4'b1100 == A)
                                                                                                                Y = 4'b0101;
                                                                                                            else
                                                                                                                begin   
                                                                                                                    if (A == 4'b1101 != 1'b0)
                                                                                                                        Y = 4'b0000;
                                                                                                                    else
                                                                                                                        begin   
                                                                                                                            if (A == 4'b1110)
                                                                                                                                Y = 4'b0110;
                                                                                                                            else
                                                                                                                                Y = 4'b0111; 
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