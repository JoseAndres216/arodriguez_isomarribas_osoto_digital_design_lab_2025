module digital_design_lab1_problem3
	#(parameter n = 6)
	(input logic reset, decrease_btn, output logic [6:0] segUnits, segTens, segSign, output logic [n-1:0] value, output logic isNegative);
	
	logic [3:0] valueUnits;  
	logic [3:0] valueTens;  
	
	initial begin 
		isNegative = 0;
		value = 1; // Inicializar en 1
		segSign = 7'b1111111;

	end
	
	always @(posedge decrease_btn or posedge reset) 
		begin
			if (reset) 
				begin 
					value <= 1;   // Inicializar en 1
					isNegative <= 0;
					segSign = 7'b1111111;
				end 
			else if (decrease_btn) // decrease protocol
				begin
					if (value === 0)
						begin
							isNegative = 1;
							segSign = 7'b0111111; // -
							value <= value + 1;  // Decrementar en 1
						end
					else if (value == (2**n - 1)) // max number
						begin
							// reached minimum number
						end
					else if (isNegative === 1)
							value <= value + 1;  // Decrementar en 1
					else if (isNegative === 0)
						value <= value - 1;  // Decrementar en 1
				end
			//else if con sumador
				
			// conversion to only units and tens from value
			 valueUnits = value % 10;  
			 valueTens = value / 10;
			 
			 // Mapeo del primer dígito de 'aO' (decenas)
			 case(valueTens)
					4'b0000: segTens = 7'b1111111; // 0
					4'b0001: segTens = 7'b1111001; // 1
					4'b0010: segTens = 7'b0100100; // 2
					4'b0011: segTens = 7'b0110000; // 3
					4'b0100: segTens = 7'b0011001; // 4
					4'b0101: segTens = 7'b0010010; // 5
					4'b0110: segTens = 7'b0000010; // 6
					4'b0111: segTens = 7'b1111000; // 7
					4'b1000: segTens = 7'b0000000; // 8
					4'b1001: segTens = 7'b0010000; // 9
					default: segTens = 7'b1111111; // Default (off)

			 endcase
			 
			 // Mapeo del segundo dígito de 'aO' (unidades)
			 case(valueUnits)
					4'b0000: segUnits = 7'b1000000; // 0
					4'b0001: segUnits = 7'b1111001; // 1
					4'b0010: segUnits = 7'b0100100; // 2
					4'b0011: segUnits = 7'b0110000; // 3
					4'b0100: segUnits = 7'b0011001; // 4
					4'b0101: segUnits = 7'b0010010; // 5
					4'b0110: segUnits = 7'b0000010; // 6
					4'b0111: segUnits = 7'b1111000; // 7
					4'b1000: segUnits = 7'b0000000; // 8
					4'b1001: segUnits = 7'b0010000; // 9
					default: segUnits = 7'b1111111; // Default (off)
			 endcase
		end

endmodule
	
	
	
	