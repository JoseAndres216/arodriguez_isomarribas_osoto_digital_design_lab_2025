// Multiplier self-checking testbench main file

module multiplier_tb();

	// Parameters dor 2 bits multiplier tests.
   parameter N2 = 2;

	logic [N2-1:0] a2, b2, r2;
	logic [3:0] flags2;
	
	// Parameters dor 4 bits multiplier tests.
   parameter N4 = 4;

	logic [N4-1:0] a4, b4, r4;
	logic [3:0] flags4;
	
	// Parameters dor 6 bits multiplier tests.
   parameter N6 = 6;

	logic [N6-1:0] a6, b6, r6;
	logic [3:0] flags6;
	
	// Parameters dor 8 bits multiplier tests.
   parameter N8 = 8;

	logic [N8-1:0] a8, b8, r8;
	logic [3:0] flags8;
	
	// Parameters dor 10 bits multiplier tests.
   parameter N10 = 10;

	logic [N10-1:0] a10, b10, r10;
	logic [3:0] flags10;

   //Initialization of 2, 4, 6, 8 and 10 bits multipliers.
   multiplier #(N2) multiplier2Bits (a2, b2, r2, flags2);
	multiplier #(N4) multiplier4Bits (a4, b4, r4, flags4);
	multiplier #(N6) multiplier6Bits (a6, b6, r6, flags6);
	multiplier #(N8) multiplier8Bits (a8, b8, r8, flags8);
	multiplier #(N10) multiplier10Bits (a10, b10, r10, flags10);

   initial 
		begin
      
		// 2 bits multiplier tests
		
		//Test 01: 00 * 00 = 00. 
		a2= 2'b00; b2 = 2'b00; #10;
		if(r2 === 2'b00 && flags2 == 4'b0010) $display("Test 01 succeeded.");
		else  $display("Test 01 failed. Expected values r2 = 00 and flags2 = 0010. Value got r2 = %b and flags = %b", r2, flags2);
		
		//Test 02: 10 * 01 = 10. 
		a2= 2'b10; b2 = 2'b01; #10;
		if(r2 === 2'b10 && flags2 == 4'b0000) $display("Test 02 succeeded.");
		else  $display("Test 02 failed. Expected values r2 = 10 and flags2 = 0000. Value got r2 = %b and flags = %b", r2, flags2);
		
		//Test 03: 11 * 11 = 01. 
		a2= 2'b11; b2 = 2'b11; #10;
		if(r2 === 2'b01 && flags2 == 4'b1000) $display("Test 03 succeeded.");
		else  $display("Test 03 failed. Expected values r2 = 01 and flags2 = 1000. Value got r2 = %b and flags = %b", r2, flags2);
		
		
		
		// 4 bits multiplier tests

		//Test 04: 0000 * 0000 = 0000. 
		a4 = 4'b0000; b4 = 4'b0000; #10;
		if(r4 === 4'b0000 && flags4 == 4'b0010) $display("Test 04 succeeded.");
		else  $display("Test 04 failed. Expected values r4 = 0000 and flags4 = 0010. Value got r4 = %b and flags4 = %b", r4, flags4);
		
		//Test 05: 0101 * 0010 = 1010. 
		a4 = 4'b0101; b4 = 4'b0010; #10;
		if(r4 === 4'b1010 && flags4 == 4'b0000) $display("Test 05 succeeded.");
		else  $display("Test 05 failed. Expected values r4 = 1010 and flags4 = 0000. Value got r4 = %b and flags4 = %b", r4, flags4);
		
		//Test 06: 1111 * 1111 = 0001. 
		a4 = 4'b1111; b4 = 4'b1111; #10;
		if(r4 === 4'b0001 && flags4 == 4'b1000) $display("Test 06 succeeded.");
		else  $display("Test 06 failed. Expected values r4 = 0001 and flags4 = 1000. Value got r4 = %b and flags4 = %b", r4, flags4);
		
		

		// 6 bits multiplier tests

		//Test 07: 000000 * 000000 = 000000. 
		a6 = 6'b000000; b6 = 6'b000000; #10;
		if(r6 === 6'b000000 && flags6 == 4'b0010) $display("Test 07 succeeded.");
		else  $display("Test 07 failed. Expected values r6 = 000000 and flags6 = 0010. Value got r6 = %b and flags6 = %b", r6, flags6);
		
		//Test 08: 010110 * 000010 = 101100. 
		a6 = 6'b010110; b6 = 6'b000010; #10;
		if(r6 === 6'b101100 && flags6 == 4'b0000) $display("Test 08 succeeded.");
		else  $display("Test 08 failed. Expected values r6 = 101100 and flags6 = 0000. Value got r6 = %b and flags6 = %b", r6, flags6);
		
		//Test 09: 111111 * 111111 = 000001. 
		a6 = 6'b111111; b6 = 6'b111111; #10;
		if(r6 === 6'b000001 && flags6 == 4'b1000) $display("Test 09 succeeded.");
		else  $display("Test 09 failed. Expected values r6 = 000001 and flags6 = 1000. Value got r6 = %b and flags6 = %b", r6, flags6);
		
		

		// 8 bits multiplier tests

		//Test 10: 00000000 * 00000000 = 00000000. 
		a8 = 8'b00000000; b8 = 8'b00000000; #10;
		if(r8 === 8'b00000000 && flags8 == 4'b0010) $display("Test 10 succeeded.");
		else  $display("Test 10 failed. Expected values r8 = 00000000 and flags8 = 0010. Value got r8 = %b and flags8 = %b", r8, flags8);
		
		//Test 11: 01011101 * 00000010 = 10111010. 
		a8 = 8'b01011101; b8 = 8'b00000010; #10;
		if(r8 === 8'b10111010 && flags8 == 4'b0000) $display("Test 11 succeeded.");
		else  $display("Test 11 failed. Expected values r8 = 10111010 and flags8 = 0000. Value got r8 = %b and flags8 = %b", r8, flags8);
		
		//Test 12: 11111111 * 11111111 = 00000001. 
		a8 = 8'b11111111; b8 = 8'b11111111; #10;
		if(r8 === 8'b00000001 && flags8 == 4'b1000) $display("Test 12 succeeded.");
		else  $display("Test 12 failed. Expected values r8 = 00000001 and flags8 = 1000. Value got r8 = %b and flags8 = %b", r8, flags8);
		
		

		// 10 bits multiplier tests

		//Test 13: 0000000000 * 0000000000 = 0000000000. 
		a10 = 10'b0000000000; b10 = 10'b0000000000; #10;
		if(r10 === 10'b0000000000 && flags10 == 4'b0010) $display("Test 13 succeeded.");
		else  $display("Test 13 failed. Expected values r10 = 0000000000 and flags10 = 0010. Value got r10 = %b and flags10 = %b", r10, flags10);
		
		//Test 14: 0101101010 * 0000000010 = 1011010100. 
		a10 = 10'b0101101010; b10 = 10'b0000000010; #10;
		if(r10 === 10'b1011010100 && flags10 == 4'b0000) $display("Test 14 succeeded.");
		else  $display("Test 14 failed. Expected values r10 = 1011010100 and flags10 = 0000. Value got r10 = %b and flags10 = %b", r10, flags10);
		
		//Test 15: 1111111111 * 1111111111 = 0000000001. 
		a10 = 10'b1111111111; b10 = 10'b1111111111; #10;
		if(r10 === 10'b0000000001) $display("Test 15 succeeded.");
		else  $display("Test 15 failed. Expected values r10 = 0000000001 and flags10 = 1000. Value got r10 = %b and flags10 = %b", r10, flags10);

		

      $stop;
    end
endmodule

