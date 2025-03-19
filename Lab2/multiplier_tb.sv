// Multiplier self-checking testbench main file

module multiplier_tb();

	// Parameters dor 2 bits multiplier tests.
   parameter N2 = 2;

	logic [N2-1:0] a2, b2;
   logic [2*N2-1:0] r2;
	
	// Parameters dor 4 bits multiplier tests.
   parameter N4 = 4;

	logic [N4-1:0] a4, b4;
   logic [2*N4-1:0] r4;
	
	// Parameters dor 6 bits multiplier tests.
   parameter N6 = 6;

	logic [N6-1:0] a6, b6;
   logic [2*N6-1:0] r6;
	
	// Parameters dor 8 bits multiplier tests.
   parameter N8 = 8;

	logic [N8-1:0] a8, b8;
   logic [2*N8-1:0] r8;
	
	// Parameters dor 10 bits multiplier tests.
   parameter N10 = 10;

	logic [N10-1:0] a10, b10;
   logic [2*N10-1:0] r10;

   //Initialization of 2, 4, 6, 8 and 10 bits multipliers.
   multiplier #(N2) multiplier2Bits (a2, b2, r2);
	multiplier #(N4) multiplier4Bits (.a(a4), .b(b4), .r(r4));
	multiplier #(N6) multiplier6Bits (.a(a6), .b(b6), .r(r6));
	multiplier #(N8) multiplier8Bits (.a(a8), .b(b8), .r(r8));
	multiplier #(N10) multiplier10Bits (.a(a10), .b(b10), .r(r10));

   initial 
		begin
      
		// 2 bits multiplier tests
		
		//Test 01: 00 * 00 = 0000. 
		a2= 2'b00; b2 = 2'b00; #10;
		if(r2 === 4'b0000) $display("Test 01 succeeded.");
		else  $display("Test 01 failed. Expected value r2 = 0000. Value got r2 = %b", r2);
		
		//Test 02: 10 * 10 = 0100. 
		a2= 2'b10; b2 = 2'b10; #10;
		if(r2 === 4'b0100) $display("Test 02 succeeded.");
		else  $display("Test 02 failed. Expected value r2 = 0100. Value got r2 = %b", r2);
		
		//Test 03: 11 * 11 = 1001. 
		a2= 2'b11; b2 = 2'b11; #10;
		if(r2 === 4'b1001) $display("Test 03 succeeded.");
		else  $display("Test 03 failed. Expected value r2 = 1001. Value got r2 = %b", r2);
		
		
		
		// 4 bits multiplier tests

		//Test 04: 0000 * 0000 = 00000000. 
		a4 = 4'b0000; b4 = 4'b0000; #10;
		if(r4 === 8'b00000000) $display("Test 04 succeeded.");
		else  $display("Test 04 failed. Expected value r4 = 00000000. Value got r4 = %b", r4);
		
		//Test 05: 0100 * 0101 = 00010100. 
		a4 = 4'b0100; b4 = 4'b0101; #10;
		if(r4 === 8'b00010100) $display("Test 05 succeeded.");
		else  $display("Test 05 failed. Expected value r4 = 00010100. Value got r4 = %b", r4);
		
		//Test 06: 1111 * 1111 = 11100001. 
		a4 = 4'b1111; b4 = 4'b1111; #10;
		if(r4 === 8'b11100001) $display("Test 06 succeeded.");
		else  $display("Test 06 failed. Expected value r4 = 11100001. Value got r4 = %b", r4);
		
		

		// 6 bits multiplier tests

		//Test 07: 000000 * 000000 = 000000000000. 
		a6 = 6'b000000; b6 = 6'b000000; #10;
		if(r6 === 12'b000000000000) $display("Test 07 succeeded.");
		else  $display("Test 07 failed. Expected value r6 = 000000000000. Value got r6 = %b", r6);
		
		//Test 08: 100110 * 011011 = 010000000010. 
		a6 = 6'b100110; b6 = 6'b011011; #10;
		if(r6 === 12'b010000000010) $display("Test 08 succeeded.");
		else  $display("Test 08 failed. Expected value r6 = 010000000010. Value got r6 = %b", r6);
		
		//Test 09: 111111 * 111111 = 111110000001. 
		a6 = 6'b111111; b6 = 6'b111111; #10;
		if(r6 === 12'b111110000001) $display("Test 09 succeeded.");
		else  $display("Test 09 failed. Expected value r6 = 111110000001. Value got r6 = %b", r6);
		
		

		// 8 bits multiplier tests

		//Test 10: 00000000 * 00000000 = 0000000000000000. 
		a8 = 8'b00000000; b8 = 8'b00000000; #10;
		if(r8 === 16'b0000000000000000) $display("Test 10 succeeded.");
		else  $display("Test 10 failed. Expected value r8 = 0000000000000000. Value got r8 = %b", r8);
		
		//Test 11: 11001010 * 00110101 = 0010100111010010. 
		a8 = 8'b11001010; b8 = 8'b00110101; #10;
		if(r8 === 16'b0010100111010010) $display("Test 11 succeeded.");
		else  $display("Test 11 failed. Expected value r8 = 0010100111010010. Value got r8 = %b", r8);
		
		//Test 12: 11111111 * 11111111 = 1111111000000001. 
		a8 = 8'b11111111; b8 = 8'b11111111; #10;
		if(r8 === 16'b1111111000000001) $display("Test 12 succeeded.");
		else  $display("Test 12 failed. Expected value r8 = 1111111000000001. Value got r8 = %b", r8);
		
		

		// 10 bits multiplier tests

		//Test 13: 0000000000 * 0000000000 = 00000000000000000000. 
		a10 = 10'b0000000000; b10 = 10'b0000000000; #10;
		if(r10 === 20'b00000000000000000000) $display("Test 13 succeeded.");
		else  $display("Test 13 failed. Expected value r10 = 00000000000000000000. Value got r10 = %b", r10);
		
		//Test 14: 1010101010 * 0101010101 = 00111000110001110010. 
		a10 = 10'b1010101010; b10 = 10'b0101010101; #10;
		if(r10 === 20'b00111000110001110010) $display("Test 14 succeeded.");
		else  $display("Test 14 failed. Expected value r10 = 00111000110001110010. Value got r10 = %b", r10);
		
		//Test 15: 1111111111 * 1111111111 = 11111111100000000001. 
		a10 = 10'b1111111111; b10 = 10'b1111111111; #10;
		if(r10 === 20'b11111111100000000001) $display("Test 15 succeeded.");
		else  $display("Test 15 failed. Expected value r10 = 11111111100000000001. Value got r10 = %b", r10);


      $stop;
    end
endmodule

