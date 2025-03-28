module and_operation 
	#(parameter N = 8) 
	(
		input logic [N-1:0] a,
		input logic [N-1:0] b,
		
		output logic [N-1:0] result,
		output logic [3:0] flags
);

    assign result = a & b;       
	 
    assign flags[0] = 0; // there is no negative in AND
    assign flags[1] = ~|result; // zero
    assign flags[2] = 0; // there is no carry in AND
    assign flags[3] = 0; // there is no overflow in AND

endmodule
