module addsub1(input logic [5:0] A, B,
                        output logic [5:0] add,subtract, output logic Cout1, Overflow1,Cout2, Overflow2 );
								
						
								
									
											assign add = A + B;
											
									
											assign subtract = A + ~B + 1;
									
											
									
				assign Overflow1 = ((A[5] & B[5] & ~add[5]) | (~A[5] & ~B[5] & add[5]));
				assign Cout1 = add[5];
				
				assign Overflow2 = ((A[5] & B[5] & ~subtract[5]) | (~A[5] & ~B[5] & subtract[5]));
				assign Cout2 = subtract[5];
								

endmodule