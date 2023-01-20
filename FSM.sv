module FSM (input logic clk, push,toggle,rstSync, output logic [3:0] wradder, radder,output logic wen);

typedef enum logic [2:0] {idle,read,write,hold} Statetype;
					
					Statetype presentState = idle,nextState;
					
					always_ff @(posedge clk)
					begin
						presentState <= nextState;
						
					end
						
						
						logic full;
						logic empty;
						
						assign full = ((wradder[3]!= radder[3]) && (wradder[2:0]==radder[2:0]));
						assign empty =  (wradder == radder);
						
					always_comb
					begin
						case(presentState) 
						
					
									
									
						idle:	if (toggle == 1'b1 && push == 1'b1 && full != 1'b1 ) 
									nextState <= write;
								
								else if (toggle == 1'b0 && push == 1'b1 && empty != 1'b1) 
									nextState <= read;
									
								else 
									nextState <= idle;
								
									
									
						read: nextState <= hold;
								
						
						write: nextState <= hold;
									
					
						hold: if (toggle == 1'b1 && push == 1'b1 && full != 1'b1)
									nextState <= write;
									
								else if (toggle == 1'b0 && push == 1'b1 && empty != 1'b1)
									nextState <= read;
									
								else 
									nextState <= hold;
							
							
						default: nextState <= hold;
						
					endcase
					end
					
					
					always_comb
					begin
						if (presentState == idle) 
						begin
							wen <= 1'b0;
							end
							
							
						else if (presentState == write)
						begin
							wen <= 1'b1;
							end
							
						else if (presentState == read)
						begin
							wen <= 1'b0;
							end
						else if (presentState == hold)
						begin
							wen <= 1'b0;
							end	
							
						else
						begin
						   wen <= 1'b0;
							end
						
						end
						
						
						always_ff @(posedge clk)
						begin
						if (presentState == read)
						begin
						if (rstSync == 1'b1)begin
						radder <= radder + 1'b1;
						wradder <= wradder;
						end
						else begin
						wradder <= 4'b0000;
						radder <= 4'b0000;
						end
						
						end
						
						else if (presentState == write)
						begin
						if (rstSync == 1'b1)begin
						wradder <= wradder + 1'b1;
						radder <= radder;
						end
						else begin
						wradder <= 4'b0000;
						radder <= 4'b0000;
						end
						end
						
						else if (presentState == idle)
						begin
						wradder <= 4'b0000;
						radder <= 4'b0000;
						end
						
						else if (presentState == hold)
						begin
						if (rstSync == 1'b1)begin
						wradder <= wradder;
						radder <= radder;
						end
						else begin
						wradder <= 4'b0000;
						radder <= 4'b0000;
						end
						end
						
						else 
						begin
						wradder <= wradder;
						radder <= radder;
						end
						
						end
						
					
							
						
						
						
						
		endmodule