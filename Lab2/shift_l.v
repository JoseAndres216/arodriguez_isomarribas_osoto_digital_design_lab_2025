module shift_l
	#(parameter N=4)
	(
		input [N-1:0] a, b,
		output [N-1:0] result,
		output [3:0] flags
	);

	// Operación de desplazamiento a la izquierda
	assign result = a << b;

	// Asignación de los flags dentro del bloque procedural
	assign flags[0] = 0;  // Negative flag (no aplica en este caso)
	assign flags[1] = ~|result; // Zero flag: se activa si todos los bits de 'result' son 0
	assign flags[2] = (b != 0) && ((a & (1 << (N - b))) != 0); // Carry flag: se activa si un bit alto se desplaza fuera
	assign flags[3] = (b >= N); // Overflow flag: se activa si el desplazamiento excede el tamaño de N

endmodule
