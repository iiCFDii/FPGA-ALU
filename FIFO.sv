module FIFO(input logic [14:0] data, input logic [3:0] wradder, radder, input logic wren, clk, 
								output logic [14:0] q);
								
								
								logic [14:0]mem[7:0];
								
								initial begin
									for(int i = 0; i < 8; i++)
											mem[i] <= i;
											
								end
								
								always_ff @(posedge clk)
								begin
								
								if(wren)
								begin
								mem[wradder] <= data;
								end
								
								
								q <= mem[radder];
								
								end
								
endmodule