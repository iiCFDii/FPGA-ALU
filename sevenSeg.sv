module sevenSeg(input logic [5:0] sum, output logic [6:0] r1,output logic [6:0]r2);

logic [5:0] sum1;

always_comb
begin
if (sum[5] == 1)
begin
sum1 = ~sum + 1;


end
else 
begin
sum1 = sum;
end

end

always_comb begin

					case(sum1)
					
					                 6'b000000: 
										  begin 
										  r2 <= 7'b1000000; 
										  r1 <= 7'b0000001; 
										  end //0
										  6'b000001:
										  begin 
										  r2 <= 7'h79;
										  r1 <= 7'b0000001; 
										  end//1
                                6'b000010: 
										  begin
										  r2 <= 7'h12; 
										  r1 <= 7'b0000001; 
										  end 
										  //2
                                6'b000011: 
										  begin
										  r2 <= 7'h06;
										  r1 <= 7'b0000001; 
										  end//3
                                6'b000100: 
										  begin
										  r2 <= 7'b0001101;
										  r1 <= 7'b0000001; 
										  end//4
                                6'b000101: 
										  begin
										  r2 <= 7'b0100100;
										  r1 <= 7'b0000001; 
										  end//5
                                6'b000110:
										  begin
										  r2 <= 7'b0100000;
										  r1 <= 7'b0000001; 
										  end//6
                                6'b000111: 
										  begin
										  r2 <= 7'b1001110; 
										  r1 <= 7'b0000001; 
											end//7
                                6'b001000: 
										  begin
										  r2 <= 7'h00; 
										  r1 <= 7'b0000001;
										  end //8
                                6'b001001: 
										  begin
										  r2 <= 7'h0C; 
										  r1 <= 7'b0000001; 
										  end//9
                                6'b001010:
										  begin 
										  r1 <= 7'h79; 
										  r2 <= 7'b1000000; 
										  end//10
                                6'b001011: 
										  begin
										  r1 <= 7'h79; 
										  r2 <= 7'h79; 
										  end//11
                                6'b001100: 
										  begin
										  r1 <= 7'h79; 
										  r2 <= 7'h12; 
										  end//12
                                6'b001101: 
										  begin
										  r1 <= 7'h79; 
										  r2 <= 7'h06; 
										  end//13
                                6'b001110: 
										  begin
										  r1 <= 7'h79; 
										  r2 <= 7'b0001101; 
										  end//14
                                6'b001111:
										  begin
										  r1 <= 7'h79; 
										  r2 <= 7'b0100100; 
										  end//15 
										  6'b010000:
										  begin
										  r1 <= 7'h79; 
										  r2 <= 7'b0100000; 
										  end//16
										  6'b010001: 
										  begin
										  r1 <= 7'h79; 
										  r2 <= 7'b1001110;
										  end //17
										  6'b010010: 
										  begin
										  r1 <= 7'h79; 
										  r2 <= 7'h00; 
										  end//18
										  6'b010011: 
										  begin
										  r1 <= 7'h79; 
										  r2 <= 7'h0C; 
										  end//19
										  6'b010100: 
										  begin
										  r1 <= 7'h12; 
										  r2 <= 7'b1000000; 
										  end//20
										  6'b010101: 
										  begin
										  r1 <= 7'h12; 
										  r2 <= 7'h79; 
										  end//21
										  6'b010110: 
										  begin
										  r1 <= 7'h12; 
										  r2 <= 7'h12; 
										  end//22
										  6'b010111:
										 begin 
										  r1 <= 7'h12; 
										  r2 <= 7'h06;
										 end //23
										  6'b011000: 
										  begin
										  r1 <= 7'h12; 
										  r2 <= 7'b0001101;
										  end//24
										  6'b011001: 
										  begin
										  r1 <= 7'h12; 
										  r2 <= 7'b0100100; 
										  end//25
										  6'b011010: 
										  begin
										  r1 <= 7'h12; 
										  r2 <= 7'b0100000;
										 end //26
										  6'b011011: 
										  begin
										  r1 <= 7'h12; 
										  r2 <= 7'b1001110; 
										  end//27
										  6'b011100: 
										  begin
										  r1 <= 7'h12; 
										  r2 <= 7'h00; 
										  end//28
										  6'b011101: 
										  begin
										  r1 <= 7'h12; 
										  r2 <= 7'h0C; 
										  end//29
										  6'b011110: 
										  begin
										  r1 <= 7'h06;
										  r2 <= 7'b1000000; 
										  end//30
										  6'b011111: 
										  begin
										  r1 <= 7'h06;
										  r2 <= 7'h79; 
										  end//31		
										  
										  default: 
										  begin 
										  r2 <= 7'b1000000;
										  r1 <= 7'b1000000;
										  end
										  
										  
										  
					
					endcase
					end
endmodule