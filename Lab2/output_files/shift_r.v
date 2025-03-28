module shift_r #(parameter N = 4)(
	input [N-1:0] a, 
	input [N-1:0] b, // b del mismo tamaño que a
	output [N-1:0] result,
	output [3:0] flags   
);

	assign result = a >> b; // Desplazamiento a la derecha

	assign flags[0] = 0;  // Negative flag: si el MSB es 1 (para signed)
	assign flags[1] = ~|result;      // Zero flag: si result es 0000
	assign flags[2] = (b != 0) && (a & (1 << (b - 1))); // Carry: si un bit 1 se pierde
	assign flags[3] = (b >= N);      // Overflow si el desplazamiento es mayor o igual a N

endmodule
