module digital_design_lab1_problem1_tb();

	reg a, b, c, d, y0, y1, y2, y3, y4, y5, y6;
	logic [6:0] segU, segD;

	digital_design_lab1_problem1 decoder(a, b, c, d, segU, segD);

	initial 
		begin

			// Test for number 0
			a=0;
			b=0;
			c=0;
			d=0;
			#20;

			// Test for number 1
			a=0;
			b=0;
			c=0;
			d=1;
			#20;

			// Test for number 2
			a=0;
			b=0;
			c=1;
			d=0;
			#20;

			// Test for number 3
			a=0;
			b=0;
			c=1;
			d=1;
			#20;

			// Test for number 4
			a=0;
			b=1;
			c=0;
			d=0;
			#20;

			// Test for number 5
			a=0;
			b=1;
			c=0;
			d=1;
			#20;

			// Test for number 6
			a=0;
			b=1;
			c=1;
			d=0;
			#20;

			// Test for number 7
			a=0;
			b=1;
			c=1;
			d=1;
			#20;

			// Test for number 8
			a=1;
			b=0;
			c=0;
			d=0;
			#20;

			// Test for number 9
			a=1;
			b=0;
			c=0;
			d=1;
			#20;

			// Test for number 10
			a=1;
			b=0;
			c=1;
			d=0;
			#20;

			// Test for number 11
			a=1;
			b=0;
			c=1;
			d=1;
			#20;

			// Test for number 12
			a=1;
			b=1;
			c=0;
			d=0;
			#20;

			// Test for number 13
			a=1;
			b=1;
			c=0;
			d=1;
			#20;

			// Test for number 14
			a=1;
			b=1;
			c=1;
			d=0;
			#20;

			// Test for number 15
			a=1;
			b=1;
			c=1;
			d=1;
			#20;

		end

endmodule