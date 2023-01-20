module resetSync(input logic clk,rst,output logic rstSync);
	
	logic intrst;
						
						
						always_ff@(posedge clk or negedge rst)
						begin
						if (!rst) begin
							intrst  <= 1'b0;
							rstSync <= 1'b0;
						end
						else
						begin
						intrst <= 1'b1;
						rstSync <= intrst;
						end
						
						end
						
endmodule