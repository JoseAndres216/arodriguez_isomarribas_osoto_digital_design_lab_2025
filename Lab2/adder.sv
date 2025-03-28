// Parameterizable adder of n bits
module adder #(
	parameter int N = 4  // N bits of the inputs
) (
	input  logic [N-1:0] a, b,
	input  logic cin,
	output logic [N-1:0] s,    // sum
	output logic cout,
	output logic [3:0] flags          
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
	
	assign cout = carry_aux[N];
	
	// carry_aux[N] = final carry
	
	assign flags[0] = 0; // negative
	assign flags[1] = ~|s; // zero
	assign flags[2] = carry_aux[N]; // carry
	assign flags[3] = carry_aux[N]; // overflow

endmodule
