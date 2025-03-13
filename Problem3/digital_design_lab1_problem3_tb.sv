module digital_design_lab1_problem3_tb();
	
	reg reset, clk; 
	logic isNegativeR2, isNegativeR4, isNegativeR6, changingA;
	logic [1:0] a2, b2, eVar2, r2;
	logic [3:0] a4, b4, eVar4, r4;
	logic [5:0] a6, b6, eVar6, r6;
	logic [6:0] segDA2, segUA2, segDB2, segUB2, segDR2, segUR2;
	logic [6:0] segDA4, segUA4, segDB4, segUB4, segDR4, segUR4;
	logic [6:0] segDA6, segUA6, segDB6, segUB6, segDR6, segUR6;
	
	digital_design_lab1_problem3 #(2) rest2(clk, reset, changingA, a2, b2, eVar2, isNegativeR2, r2, segDA2, segUA2, segDB2, segUB2, segDR2, segUR2);
	digital_design_lab1_problem3 #(4) rest4(clk, reset, changingA, a4, b4, eVar4, isNegativeR4, r4, segDA4, segUA4, segDB4, segUB4, segDR4, segUR4);
	digital_design_lab1_problem3 #(6) rest6(clk, reset, changingA, a6, b6, eVar6, isNegativeR6, r6, segDA, segUA6, segDB6, segUB6, segDR6, segUR6);
	
	always #5 clk = ~clk;
	
	initial
		begin
		
			clk = 0;
			reset = 1;
			isNegativeR2 = 0;
			isNegativeR4 = 0;
			isNegativeR6 = 0;
			a2 = 2'b00;
			b2 = 2'b00;
			a4 = 4'b0000;
			b4 = 4'b0000;
			a6 = 6'b000000;
			b6 = 6'b000000;
			
			

			
			#20
			
			reset=1;
			reset=0;
			a2=2'b10;
			b2=2'b01;
			
			// Self checking
			if(r2 !== 2'b01 && isNegativeR2 !== 1'b0) $display("10-01 test failed.");
			else $display("10-01 test succeeded.");
			
			#20
			
			reset=1;
			reset=0;
			a2=2'b11;
			b2=2'b10;
			
			// Self checking
			if(r2 !== 2'b01 && isNegativeR2 !== 1'b0) $display("11-10 test failed.");
			else $display("11-10 test succeeded.");
			
			#20
			
			reset=1;
			reset=0;
			a2=2'b11;
			b2=2'b10;
			
			// Self checking
			if(r2 === 2'b01 && isNegativeR2 === 1'b0) $display("11-10 test succeeded.");
			else $display("11-10 test failed.");
			
			#20
			
			reset=1;
			reset=0;
			a2=2'b01;
			b2=2'b11;
			
			#20
			
			// Self checking
			if(r2 === 2'b10 && isNegativeR2 === 1'b1) $display("01-11 test succeeded.");
			else  $display("01-11 test failed. r2 = %b, isNegativeR2 = %b", r2, isNegativeR2);
			
			#20
			
			reset=1;
			reset=0;
			a4=4'b0101;
			b4=4'b0001;
			
			#20
			

			// Self checking
			if(r4 === 2'b0100 && isNegativeR4 === 1'b0) $display("C test succeeded.");
			else  $display("b0101 test failed. r4 = %b, isNegativeR4 = %b", r4, isNegativeR4);
			
			// Self checking
			
			#20
			
			reset=1;
			reset=0;
			a4=4'b0001;
			b4=4'b0101;
			
			// Self checking
			
			#20
			
			// Self checking
			if(r4 === 2'b0100 && isNegativeR4 === 1'b1) $display("C test succeeded.");
			else  $display("b0101 test failed. r4 = %b, isNegativeR4 = %b", r4, isNegativeR4);
			
			
			reset=1;
			reset=0;
			a6=6'b111111;
			b6=6'b010101;
			
			// Self checking
			
			#20
			
			reset=1;
			reset=0;
			a6=6'b010101;
			b6=6'b111111;
			
			// Self checking
			
			#20
			
			$finish;
		end
	
endmodule