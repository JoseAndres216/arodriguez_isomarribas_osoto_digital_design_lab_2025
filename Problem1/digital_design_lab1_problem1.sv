module digital_design_lab1_problem1(
	input logic a, b, c, d, 
	output logic [6:0] segU, segD);

    // Definición de señales
	logic y0, y1, y2, y3, y4, y5, y6;
		
	always @(*)
		begin
		
			y0 = 0;
			y1 = 0;
			y2 = 0;
			y3 = 0;
			y4 = 0;
			y5 = 0;
			y6 = 0;
		
			y0 = (a & ~c) | (b & d) | (c & ~a) | (~d & ~b);
			y1 = ~b | (~c & ~d) | (a & ~d) | (a & ~c) | (~a & c & d);
			y2 = d | (a & ~b) | (~a & b) | (~b & ~c) | (b & c);
			y3 = (a & ~c) | (~a & ~b & c) | (~a & c & ~d) | (b & ~c & d) | (a & b & d) | (~b & ~d);
			y4 = (a & ~c & ~d) | (~a & c & ~d) | (~b & ~d);
			y5 = (~a & b & ~c) | (a & ~b & ~c) | (a & b & c) | (~a & ~c & ~d) | (a & ~b & ~d) | (~a & b & ~d);
			y6 = (a & b) | (a & ~c) | (b & ~c) | (~a & c & ~d) | (~a & ~b & c);
			
			segU = {~y6, ~y5, ~y4, ~y3, ~y2, ~y1, ~y0};
			
			#10;
			
			y0 = 0;
			y1 = (a & b) | (a & c);
			y2 = (a & b) | (a & c);
			y3 = 0;
			y4 = 0;
			y5 = 0;
			y6 = 0;
			
			segD = {~y6, ~y5, ~y4, ~y3, ~y2, ~y1, ~y0};
			
		end

endmodule