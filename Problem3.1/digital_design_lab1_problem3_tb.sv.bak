module digital_design_lab1_problem3_tb();

	logic reset2, reset4, reset6, decrease_btn2, decrease_btn4, decrease_btn6, isNegative2, isNegative4, isNegative6;
	logic [6:0] segUnits2, segTens2, segSign2, segUnits4, segTens4, segSign4, segUnits6, segTens6, segSign6;
	logic [1:0] value2;
	logic [3:0] value4;	
	logic [5:0] value6;
	
	digital_design_lab1_problem3 #(2) tstbench1(reset2, decrease_btn2, segUnits2, segTens2, segSign2, value2, isNegative2);
	digital_design_lab1_problem3 #(4) tstbench2(reset4, decrease_btn4, segUnits4, segTens4, segSign4, value4, isNegative4);
	digital_design_lab1_problem3 #(6) tstbench3(reset6, decrease_btn6, segUnits6, segTens6, segSign6, value6, isNegative6);
	
	initial begin
		reset2 = 1;
		reset2 = 0;
		
		#20
		
		decrease_btn2 = 0;
		decrease_btn2 = 1;
		
		#20
		
		if(value2 === 2'b01 && isNegative2 === 1'b1) $display("C test succeeded.");
		else  $display("test -2 failed.");
			
		decrease_btn2 = 0;
		decrease_btn2 = 1;
		
		#20
		
		if(value2 === 2'b10 && isNegative2 === 1'b1) $display("C test succeeded.");
		else  $display("test -2 failed.");
		
		
		decrease_btn2 = 0;
		decrease_btn2 = 1;
		
		#20
		
		if(value2 === 2'b11 && isNegative2 === 1'b1) $display("C test succeeded.");
		else $display("test -2 failed.");
		
		
		
	
	end
   

endmodule
