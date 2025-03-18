// Parameterizable adder of n bits
module adder #(
	parameter int N = 4  // N bits of the inputs
) (
	input  logic [N-1:0] a, b,
	input  logic cin,
	output logic [N-1:0] s,    // sum
	output logic cout          // Final Carry-out
);

	// Auxiliar carry
	logic [N:0] carry_aux;

	// Initializes Carry-in
	assign carry_aux[0] = cin;

	// Apply 1 bit full adder to each bit
	genvar i;
	generate
		for (i = 0; i < N; i++) begin : adder1bit
			assign s[i] = (a[i] ^ b[i]) ^ carry_aux[i];           // Sum for bit i
			assign carry_aux[i+1] = (a[i] & b[i]) | (carry_aux[i] & (a[i] ^ b[i])); // next carry
		end
	endgenerate

	// carry-out final
	assign cout = carry_aux[N];

endmodule
