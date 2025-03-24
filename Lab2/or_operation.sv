module or_operation
	#(parameter N=4)
	(
		input logic [N-1:0] a,
		input logic [N-1:0] b,
		
		output logic [N-1:0] result,
		output logic [3:0] flags
	);

	always_comb begin
		// Operación OR
		result = a | b;

		// Flags
	 flags[0] = 0; // there is no negative in OR
    flags[1] = ~|result; // zero
    flags[2] = 0; // there is no carry in OR
    flags[3] = 0; // there is no overflow in OR
	end

endmodule
