module toplevelFinal( 
input logic [14:0] data, 
input logic push,toggle,rst,  
input logic clk, 
output logic [6:0] r1, Ar1,Ar2, Br1, Br2,
output logic [6:0] r2, result, 
output logic  S1,S2,S3,S4,z, 
output logic [5:0] add1,subtract1, 
output logic Cout1, Overflow1, Cout2, Overflow2,
output logic [3:0] wradder1, radder1,
output logic wen1, 
output logic [14:0] q,
output logic [5:0] A1, 
output logic [5:0] B1);

//fifo

		logic temp1;
		logic temp2;
		logic temp3;
		logic oclk;
		

		clockdiv callx0 (.iclk(clk), .oclk(oclk));
// add oclk to modules for board, use "clk" for simulations
		
		resetSync callx1 (.clk(oclk), .rst(rst), .rstSync(temp3));
		
		edgeDet call0(.clk(oclk), .push(push), .edgeD(temp1));
		
		FSM  call1(.clk(oclk), .push(temp1), .toggle(toggle), .wradder(wradder1), .radder(radder1), .wen(wen1), .rstSync(temp3));
		
		FIFO call2(.data(data), .wradder(wradder1), .radder(radder1), .wren(wen1), .clk(oclk), .q(q));	
	
	
// computational logic	

							
		
		FSM1 call3(.clk(oclk), .E(temp1), .z(z));
		
		logic Co1;
		logic Ov1;
		logic Co2;
		logic Ov2;
		logic S11;
		logic S22;
		logic S33;
		logic S44;
					
					
		logic [5:0]A;
		logic [5:0]B;
		
		assign A = q[5:0];
		assign B = q[11:6];
		
		addsub1 call4(.A(A), .B(B), .add(add1), .subtract(subtract1), .Cout1(Co1), .Overflow1(Ov1), .Cout2(Co2), .Overflow2(Ov2));
		
		compare call5(.A(A), .B(B), .S1(S11), .S2(S22), .S3(S33), .S4(S44));
		
		
always_ff @(posedge clk)
				begin
				
case (toggle)
1'b0:
begin
				
if (z == 1'b1)
begin
	A1 <= A;
	B1 <= B;
	case(q[14:12])
		
		3'b000: 
		begin
		result <= add1;
		Cout1 <= Co1;
		Overflow1 <= Ov1;
		end
		3'b001: 
		begin
		result <= subtract1;
		Cout2 <= Co2;
		Overflow2 <= Ov2;
		end
		3'b100: 
		begin
		result <= S11;
		end
		3'b101: 
		begin
		result <= S22;
		end
		3'b110:
		begin
		result <= S33;
		end
		3'b111:
		begin
		result <= S44;
		end
		
		default:
		begin
				A1 <= A1;
				B1 <= B1;
				add1 <= add1;
				subtract1 <= subtract1;
				Cout1 <= Cout1;
				Overflow1 <= Overflow1;
				Cout2 <= Cout2;
				Overflow2 <= Overflow2;
				S1 <= S1;
				S2 <= S2;
				S3 <= S3;
				S4 <= S4;
				result <= 6'b000000;
		end
	
	endcase
				
				
end		
				
end


default:
begin
				A1 <= A1;
				B1 <= B1;
				add1 <= add1;
				subtract1 <= subtract1;
				Cout1 <= Cout1;
				Overflow1 <= Overflow1;
				Cout2 <= Cout2;
				Overflow2 <= Overflow2;
				S1 <= S1;
				S2 <= S2;
				S3 <= S3;
				S4 <= S4;
				result <= 6'b000000;
end



endcase
end
				
							
		sevenSeg call6(.sum(result), .r1(r1), .r2(r2));
		sevenSeg call7(.sum(A1), .r1(Ar1), .r2(Ar2));
		sevenSeg call8(.sum(B1), .r1(Br1), .r2(Br2));
		


endmodule