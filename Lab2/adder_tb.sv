// Testbench for the adder module
module adder_tb;	

	logic [1:0] a2, b2;
	logic cin2, cin4, cin6, cin8, cin10;
	logic [1:0] s2;
	logic cout2, cout4, cout6, cout8, cout10;

	logic [3:0] a4, b4;
	logic [3:0] s4;

	logic [5:0] a6, b6;
	logic [5:0] s6;

	logic [7:0] a8, b8;
	logic [7:0] s8;

	logic [9:0] a10, b10;
	logic [9:0] s10;

	adder #(2) test2bits(a2, b2, cin2, s2, cout2);
	adder #(4) test4bits(a4, b4, cin4, s4, cout4);
	adder #(6) test6bits(a6, b6, cin6, s6, cout6);
	adder #(8) test8bits(a8, b8, cin8, s8, cout8);
	adder #(10) test10bits(a10, b10, cin10, s10, cout10);


	// Test procedure
	initial begin
		// Test Values 2 bits
		#10 a2= 2'b01; b2 = 2'b10; cin2 = 1'b0; // case: 1 + 2 + 0
		#10
		if(s2 === 2'b11 && cout2 === 1'b0) $display("Test 01 succeeded. %b + %b + %b = %b, carry-out = %b", a2, b2, cin2, s2, cout2);
		else  $display("Test 01 failed.  a = %b, b = %b, cin = %b, s = %b, cout = %b", a2, b2, cin2, s2, cout2);

		#10 
		a2= 2'b11; b2 = 4'b01; cin2 = 1'b0; 
		#10
		if(s2 === 2'b00 && cout2 === 1'b1) $display("Test 02 succeeded. %b + %b + %b = %b, carry-out = %b", a2, b2, cin2, s2, cout2);
		else  $display("Test 02 failed.  a = %b, b = %b, cin = %b, s = %b, cout = %b", a2, b2, cin2, s2, cout2);

		#10 a2= 2'b11; b2 = 2'b11; cin2 = 1'b1; 
		#10
		if(s2 === 2'b11 && cout2 === 1'b1) $display("Test 03 succeeded. %b + %b + %b = %b, carry-out = %b", a2, b2, cin2, s2, cout2);
		else  $display("Test 03 failed.  a = %b, b = %b, cin = %b, s = %b, cout = %b", a2, b2, cin2, s2, cout2);

		// Test Values 4 bits
		#10 
		a4= 4'b0001; b4 = 4'b0010; cin4 = 1'b0; 
		#10
		if(s4 === 4'b0011 && cout4 === 1'b0) $display("Test 04 succeeded. %b + %b + %b = %b, carry-out = %b", a4, b4, cin4, s4, cout4);
		else  $display("Test 04 failed.   a = %b, b = %b, cin = %b, s = %b, cout = %b", a4, b4, cin4, s4, cout4);

		#10 a4 = 4'b1111; b4 = 4'b0001; cin4 = 1'b0; 
		#10
		if(s4 === 4'b0000 && cout4 === 1'b1) $display("Test 05 succeeded. %b + %b + %b = %b, carry-out = %b", a4, b4, cin4, s4, cout4);
		else  $display("Test 05 failed.a = %b, b = %b, cin = %b, s = %b, cout = %b", a4, b4, cin4, s4, cout4);

		#10 a4 = 4'b1111; b4 = 4'b1111; cin4 = 1'b1;
		#10
		if(s4 === 4'b1111 && cout4 === 1'b1) $display("Test 06 succeeded. %b + %b + %b = %b, carry-out = %b", a4, b4, cin4, s4, cout4);
		else  $display("Test 06 failed. a = %b, b = %b, cin = %b, s = %b, cout = %b", a4, b4, cin4, s4, cout4);

		// Test Values 6 bits
		#10 
		a6 = 6'b000001; b6 = 6'b000010; cin6 = 1'b0; 
		#10
		if(s6 === 6'b000011 && cout6 === 1'b0) $display("Test 07 succeeded. %b + %b + %b = %b, carry-out = %b", a6, b6, cin6, s6, cout6);
		else  $display("Test 07 failed. a = %b, b = %b, cin = %b, s = %b, cout = %b", a6, b6, cin6, s6, cout6);

		#10 a6 = 6'b111111; b6 = 6'b000001; cin6 = 1'b0; 
		#10
		if(s6 === 6'b000000 && cout6 === 1'b1) $display("Test 08 succeeded. %b + %b + %b = %b, carry-out = %b", a6, b6, cin6, s6, cout6);
		else  $display("Test 08 failed. a = %b, b = %b, cin = %b, s = %b, cout = %b", a6, b6, cin6, s6, cout6);

		#10 a6 = 6'b111111; b6 = 6'b111111; cin6 = 1'b1;
		#10
		if(s6 === 6'b111111 && cout6 === 1'b1) $display("Test 09 succeeded. %b + %b + %b = %b, carry-out = %b", a6, b6, cin6, s6, cout6);
		else  $display("Test 09 failed. a = %b, b = %b, cin = %b, s = %b, cout = %b", a6, b6, cin6, s6, cout6);

		// Pruebas para 8 bits
		#10 a8 = 8'b00000001; b8 = 8'b00000010; cin8 = 1'b0; #10;
		if (s8 === 8'b00000011 && cout8 === 1'b0) $display("Test 10 succeeded. %b + %b + %b = %b, carry-out = %b", a8, b8, cin8, s8, cout8);
		else $display("Test 10 failed. a = %b, b = %b, cin = %b, s = %b, cout = %b", a8, b8, cin8, s8, cout8);

		#10 a8 = 8'b11111111; b8 = 8'b00000001; cin8 = 1'b0; #10;
		if (s8 === 8'b00000000 && cout8 === 1'b1) $display("Test 11 succeeded. %b + %b + %b = %b, carry-out = %b", a8, b8, cin8, s8, cout8);
		else $display("Test 11 failed. a = %b, b = %b, cin = %b, s = %b, cout = %b", a8, b8, cin8, s8, cout8);

		#10 a8 = 8'b11111111; b8 = 8'b11111111; cin8 = 1'b1; #10;
		if (s8 === 8'b11111111 && cout8 === 1'b1) $display("Test 12 succeeded. %b + %b + %b = %b, carry-out = %b", a8, b8, cin8, s8, cout8);
		else $display("Test 12 failed. a = %b, b = %b, cin = %b, s = %b, cout = %b", a8, b8, cin8, s8, cout8);


		// Pruebas para 10 bits
		#10 a10 = 10'b0000000001; b10 = 10'b0000000010; cin10 = 1'b0; #10;
		if (s10 === 10'b0000000011 && cout10 === 1'b0) $display("Test 10 succeeded. %b + %b + %b = %b, carry-out = %b", a10, b10, cin10, s10, cout10);
		else $display("Test 10 failed. a = %b, b = %b, cin = %b, s = %b, cout = %b", a10, b10, cin10, s10, cout10);

		#10 a10 = 10'b1111111111; b10 = 10'b0000000001; cin10 = 1'b0; #10;
		if (s10 === 10'b0000000000 && cout10 === 1'b1) $display("Test 11 succeeded. %b + %b + %b = %b, carry-out = %b", a10, b10, cin10, s10, cout10);
		else $display("Test 11 failed. a = %b, b = %b, cin = %b, s = %b, cout = %b", a10, b10, cin10, s10, cout10);

		#10 a10 = 10'b1111111111; b10 = 10'b1111111111; cin10 = 1'b1; #10;
		if (s10 === 10'b1111111111 && cout10 === 1'b1) $display("Test 11 succeeded. %b + %b + %b = %b, carry-out = %b", a10, b10, cin10, s10, cout10);
		else $display("Test 11 failed. a = %b, b = %b, cin = %b, s = %b, cout = %b", a10, b10, cin10, s10, cout10);

		$finish;
	end

endmodule
