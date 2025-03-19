// Multiplier main file

module multiplier #(parameter N = 4)(input logic [N-1:0] a, b, output logic [2*N-1:0] r);
	
	logic [2*N-1:0] additions [N-1:0];
	logic [2*N-1:0] addition;
	
	always_comb
		begin
			// Initialize "adittions" on 0 in every position.
			for (int i = 0; i < N; i++) 
            additions[i] = 0;
				
				// Multiplies every position of b (one by one starting in b[0]) with every position in a, saving
			// every multiplication in "addition" (starting on addition[0]).At the end of every b iteration,
			// "addition" shifts left "i" times and it is saved in "additions" (starting in additions[0]).
			for (int i = 0; i < N; i++) begin
				addition = 0;
				for (int j = 0; j < N; j++) begin
					addition[j] = b[i] & a[j];
				end
				
				addition = addition << i;
				additions[i] = addition;
				
			end
			
			// Initialize r in 0.
			r = 0;
			
			// r gets the value of the addition of every item in "additions".
			for(int i = 0; i < N; i++) begin
				
				r = r + additions[i];
				
			end
		end

endmodule
