module digital_design_lab1_problem3_tb();

	logic reset2, reset4, reset6, decrease_btn2, decrease_btn4, decrease_btn6, isNegative2, isNegative4, isNegative6, increase_btn2, increase_btn4, increase_btn6;
	logic [6:0] segUnits2, segTens2, segSign2, segUnits4, segTens4, segSign4, segUnits6, segTens6, segSign6;
	logic [1:0] value2;
	logic [3:0] value4;	
	logic [5:0] value6;
	
	digital_design_lab1_problem3 #(2) tstbench1(reset2, decrease_btn2, increase_btn2, segUnits2, segTens2, segSign2, value2, isNegative2);
	digital_design_lab1_problem3 #(4) tstbench2(reset4, decrease_btn4, increase_btn4, segUnits4, segTens4, segSign4, value4, isNegative4);
	digital_design_lab1_problem3 #(6) tstbench3(reset6, decrease_btn6, increase_btn6, segUnits6, segTens6, segSign6, value6, isNegative6);
	
	initial begin
	
		reset2 = 1;
		#20
		reset2 = 0;
		
		#20
		
		decrease_btn2 = 0;
		#20
		decrease_btn2 = 1;
		
		#20
		
		if(value2 === 2'b00 && isNegative2 === 1'b0) $display("2 bits: Test 01 -1 = 00 succeeded.");
		else  $display("2 bits: Test 01 -1 = 00 failed.");
		
		#20
		
		decrease_btn2 = 0;
		#20
		decrease_btn2 = 1;
		
		#20
		
		if(value2 === 2'b01 && isNegative2 === 1'b1) $display("2 bits: Test 00 -1 = -01  succeeded.");
		else  $display("2 bits: Test 00 -1 = -01 failed. ");
		
		#20
		
		decrease_btn2 = 0;
		#20
		decrease_btn2 = 1;
		
		#20
		
		if(value2 === 2'b10 && isNegative2 === 1'b1) $display("2 bits: Test -01 -1 = -10 succeeded.");
		else  $display("2 bits: Test -01 -1 = -10 failed.");
		
		#20
		
		decrease_btn2 = 0;
		#20
		decrease_btn2 = 1;
		
		#20
		
		if(value2 === 2'b11 && isNegative2 === 1'b1) $display("2 bits: Test -10 -1 = -11 succeeded.");
		else  $display("2 bits: Test -10 -1 = -11 failed.");
		
		#20
		decrease_btn2 = 0;
		#20
		decrease_btn2 = 1;
		#20
		
		if(value2 === 2'b11 && isNegative2 === 1'b1) $display("2 bits: Test -11 -1 = -11 succeeded.");
		else  $display("2 bits: Test -11 -1 = -11 failed.");
		
		#20
		decrease_btn2 = 0;
		#20
		increase_btn2 = 0;
		#20
		increase_btn2 = 1;
		#20
		
		if(value2 === 2'b10 && isNegative2 === 1'b1) $display("2 bits: Test -11 +1 = -10 succeeded.");
		else  $display("2 bits: Test -11 +1 = -10 failed.");
		
		#20
		increase_btn2 = 0;
		#20
		increase_btn2 = 1;
		#20
		
		if(value2 === 2'b01 && isNegative2 === 1'b1) $display("2 bits: Test -10 +1 = -01 succeeded.");
		else  $display("2 bits: Test -10 +1 = -01 failed.");
		
		#20
		increase_btn2 = 0;
		#20
		increase_btn2 = 1;
		#20
		
		if(value2 === 2'b00 && isNegative2 === 1'b0) $display("2 bits: Test -01 +1 = 00 succeeded.");
		else  $display("2 bits: Test -01 +1 = 0 failed.");
		
		#20
		increase_btn2 = 0;
		#20
		increase_btn2 = 1;
		#20
		
		if(value2 === 2'b01 && isNegative2 === 1'b0) $display("2 bits: Test 00 +1 = 01 succeeded.");
		else  $display("2 bits: Test 00 +1 = 01 failed.");
			
		/*
		#20
		
		decrease_btn4 = 0;
		#20
		decrease_btn4 = 1;
		
		#20
		
		if(value4 === 4'b0001 && isNegative2 === 1'b1) $display("4 bits: Test -1 succeeded.");
		else  $display("4 bits: Test -1 failed.");
		
		#20
		
		decrease_btn4 = 0;
		#20
		decrease_btn4 = 1;
		
		#20
		
		if(value4 === 4'b0011 && isNegative2 === 1'b1) $display("4 bits: Test -2 succeeded.");
		else  $display("4 bits: Test -2 failed.");
		
		#20
		
		decrease_btn4 = 0;
		#20
		decrease_btn4 = 1;
		
		#20
		
		if(value4 === 4'b0011 && isNegative2 === 1'b1) $display("4 bits: Test -3 succeeded.");
		else  $display("4 bits: Test -3 failed.");
		
		*/
		
	
	end
   

endmodule
