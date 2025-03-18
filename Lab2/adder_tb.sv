// Testbench for the adder module
module adder_tb;

	parameter int N = 4; 

	// Signals for DUT (Design Under Test)
	logic [N-1:0] a, b;
	logic cin;           // Carry-in
	logic [N-1:0] s;     // Sum final result
	logic cout;          // Final carry-out

	// Instance
	adder #(.N(N)) DUT (
		.a(a),
		.b(b),
		.cin(cin),
		.s(s),
		.cout(cout)
	);

	// Test procedure
	initial begin
		$monitor("Tiempo=%0t | A=%b | B=%b | Cin=%b | S=%b | Cout=%b", 
				  $time, a, b, cin, s, cout);

		// Initializes values
		a = 0; b = 0; cin = 0;

		// Test Values
		#10 a= 4'b0001; b = 4'b0010; cin = 1'b0; // case: 1 + 2 + 0
		#10
		if(s === 4'b0011 && cout === 4'b0) $display("Test 01 succeeded.");
		else  $display("Test 01 failed. s = %b, cout = %b", s, cout);
		
		#10 a= 4'b0101; b = 4'b0011; cin = 1'b1; // case: 5 + 3 + 1
		#10
		if(s === 4'b1001 && cout === 4'b0) $display("Test 02 succeeded.");
		else  $display("Test 02 failed. s = %b, cout = %b", s, cout);
		
		#10 a= 4'b1111; b = 4'b0001; cin = 1'b0; // case: 15 + 1 + 0
		#10
		if(s === 4'b0000 && cout === 4'b1) $display("Test 03 succeeded.");
		else  $display("Test 03 failed. s = %b, cout = %b", s, cout);
		
		#10 a= 4'b1111; b = 4'b1111; cin = 1'b1; // case: 15 + 15 + 1
		#10
		if(s === 4'b1111 && cout === 4'b1) $display("Test 04 succeeded.");
		else  $display("Test 04 failed. s = %b, cout = %b", s, cout);

		$finish;
	end

endmodule
