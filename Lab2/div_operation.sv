module div_operation #(parameter N = 4)(
	input  logic [N-1:0] a, b,
	output logic [N-1:0] result,
	output logic [3:0] flags   
);

	always_comb begin
	
		result = (b == 0) ? 0 : (a/b);
		flags[0] = 0; // negative
		flags[1] = ~|result; // zero
		flags[2] = (a % b != 0); // carry
		flags[3] = (b != 0) && ((a / b) > ((1 << N) - 1)); // Overflow if the quotient is greater than N bits
		
	end
	
endmodule