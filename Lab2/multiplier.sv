// Multiplier main file

module multiplier #(parameter N = 4)(input logic [N-1:0] a, b, output logic [2*N-1:0] r);
	
	logic [2*N-1:0] additions [N-1:0];
	logic [2*N-1:0] addition;
	
	logic [2*N-1:0] shifttedAddition;
	
	logic [2*N-1:0] partialAdditions [N:0];
	logic [2*N-1:0] partialCouts [N:0];
	
	genvar g;
	
	generate
        for (g = 0; g < N; g++) begin : adders
            adder #(2*N) adderX (additions[g], partialAdditions[g], partialCouts[g], partialAdditions[g+1], partialCouts[g+1]);
        end
    endgenerate
	
		
	always_comb
		begin
			
			// // // // // // // // // //		Initialization of matrixes and vars 	\\ \\ \\ \\ \\ \\ \\ \\ \\ \\
		
			// Initialize "adittions" on 0 in every position.
			for (int i = 0; i < N; i++) 
            additions[i] = 0;
				
			// Initialize "partialAdditions" and "partialCouts" on 0 in every position.
			partialAdditions[0] = 0;
			partialCouts[0] = 0;
			
			// Initialize r in 0.
			r = 0;
			
			// // // // // // // // // //		 Multiplication process (and gates) 	\\ \\ \\ \\ \\ \\ \\ \\ \\ \\
				
				// Multiplies every position of b (one by one starting in b[0]) with every position of a, saving
			// every multiplication in "addition" (starting on addition[0]).At the end of every b iteration,
			// "addition" shifts left "i" times and it is saved in "additions" (starting in additions[0]).
			for (int i = 0; i < N; i++) begin
				addition = 0;
				for (int j = 0; j < N; j++) begin
					addition[j] = b[i] & a[j];
				end
				
				//Simulates an HDL left shift behavior. 
				
				shifttedAddition = addition;
			
				for (int t = 0; t < i; t++) begin
				
					shifttedAddition = 0;
				
					for(int k = 1; k < 2*N-1; k++) begin
					
						shifttedAddition[k] = addition[k-1];
						
					end
					
					addition = shifttedAddition;
					
				end
				
				
					
				additions[i] = shifttedAddition;
					
			end
			
			// // // // // // // // // //		 	Addition of multiplications 			\\ \\ \\ \\ \\ \\ \\ \\ \\ \\
			
			// r gets the value of the addition of every item in "additions".
			
			// Method 1: Using tarditional addition (+).
			
			/*
			
			for(int i = 0; i < N; i++) begin
				
				r = r + additions[i];
				
			end
			
			*/
			
			// Method 2: Using full adder consecutive additions.
			
			// /*
			
			r = partialAdditions[N];
			
			// */

		end

endmodule
