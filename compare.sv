module compare(input logic [5:0] A, B, 
                        output logic  S1,S2,S3,S4);



				
									assign S1 = (A == B);

									assign S2 = (A > B);
									
									assign S3 = (A < B);
							
									assign S4 = (A == 6'b00000);
															



endmodule