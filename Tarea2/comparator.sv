module comparator (
	input [7:0] A, B,
	output equal
	);
	
assign equal = (A==B); // podría reemplazarse por compuertas


endmodule