module digital_design_lab1_problem3
	#(parameter n = 6)
	(input logic clk, reset, changingA, input logic [n-1:0] a, b, eVar,  
	output logic isNegativeR, output logic [n-1:0] r, output logic [6:0] segDA, segUA, segDB, segUB, segDR, segUR);
	
	logic [n-1:0] aO, bO, rO;
	
	logic [3:0] dA, uA;  // Para 'aO'
	logic [3:0] dB, uB;  // Para 'bO'
	logic [3:0] dR, uR;  // Para 'rO'
	
	logic isNegativeRO;
	
	always @(*)
		begin
		
			if(reset) 
				begin
				
					aO = 0;
					bO = 0;
					
				end
			else if(changingA) aO = eVar;
			else bO = eVar;
			
		end
	
	always @(posedge clk)
		begin
			if(a > b)
				
					begin
					
						r = a-b;
						if((aO !==  0) && (bO !== 0)) isNegativeR = isNegativeRO;
						else isNegativeR = 0;
							
					
					end
				else if (a < b)
					begin
					
						r = b-a;
						if((aO !==  0) && (bO !== 0)) isNegativeR = isNegativeRO;
						else isNegativeR = 1;
					
					end
				else
					begin
					
					r = 0;
					if((aO !==  0) && (bO !== 0)) isNegativeR = isNegativeRO;
						else isNegativeR = 0;
					
					end
				
			if((aO > bO) && !reset)
				begin
				
					rO = aO-bO;
					isNegativeRO = 0;
				
				end
			else if ((aO < bO) && ~reset)
				begin
				
					rO = bO-aO;
					isNegativeRO = 1;
				
				end
			else
				begin
				
					rO = 0;
					isNegativeRO = 0;
				
				end
			
			// Convertir 'aO' a decimales
			 dA = aO / 10;  // Decenas de 'aO'
			 uA = aO % 10;  // Unidades de 'aO'

			 // Convertir 'bO' a decimales
			 dB = bO / 10;  // Decenas de 'bO'
			 uB = bO % 10;  // Unidades de 'bO'

			 // Convertir 'rO' a decimales
			 dR = rO / 10;  // Decenas de 'rO'
			 uR = rO % 10;  // Unidades de 'rO'
			 
			 // Mapeo del primer dígito de 'aO' (decenas)
			 case(dA)
					4'b0000: segDA = 7'b1000000; // 0
					4'b0001: segDA = 7'b1111001; // 1
					4'b0010: segDA = 7'b0100100; // 2
					4'b0011: segDA = 7'b0110000; // 3
					4'b0100: segDA = 7'b0011001; // 4
					4'b0101: segDA = 7'b0010010; // 5
					4'b0110: segDA = 7'b0000010; // 6
					4'b0111: segDA = 7'b1111000; // 7
					4'b1000: segDA = 7'b0000000; // 8
					4'b1001: segDA = 7'b0010000; // 9
					default: segDA = 7'b1111111; // Default (off)

			 endcase

			 // Mapeo del segundo dígito de 'aO' (unidades)
			 case(uA)
					4'b0000: segUA = 7'b1000000; // 0
					4'b0001: segUA = 7'b1111001; // 1
					4'b0010: segUA = 7'b0100100; // 2
					4'b0011: segUA = 7'b0110000; // 3
					4'b0100: segUA = 7'b0011001; // 4
					4'b0101: segUA = 7'b0010010; // 5
					4'b0110: segUA = 7'b0000010; // 6
					4'b0111: segUA = 7'b1111000; // 7
					4'b1000: segUA = 7'b0000000; // 8
					4'b1001: segUA = 7'b0010000; // 9
					default: segUA = 7'b1111111; // Default (off)
			 endcase

			 // Mapeo del primer dígito de 'bO' (decenas)
			 case(dB)
					4'b0000: segDB = 7'b1000000; // 0
					4'b0001: segDB = 7'b1111001; // 1
					4'b0010: segDB = 7'b0100100; // 2
					4'b0011: segDB = 7'b0110000; // 3
					4'b0100: segDB = 7'b0011001; // 4
					4'b0101: segDB = 7'b0010010; // 5
					4'b0110: segDB = 7'b0000010; // 6
					4'b0111: segDB = 7'b1111000; // 7
					4'b1000: segDB = 7'b0000000; // 8
					4'b1001: segDB = 7'b0010000; // 9
					default: segDB = 7'b1111111; // Default (off)
			 endcase

			 // Mapeo del segundo dígito de 'bO' (unidades)
			 case(uB)
					4'b0000: segUB = 7'b1000000; // 0
					4'b0001: segUB = 7'b1111001; // 1
					4'b0010: segUB = 7'b0100100; // 2
					4'b0011: segUB = 7'b0110000; // 3
					4'b0100: segUB = 7'b0011001; // 4
					4'b0101: segUB = 7'b0010010; // 5
					4'b0110: segUB = 7'b0000010; // 6
					4'b0111: segUB = 7'b1111000; // 7
					4'b1000: segUB = 7'b0000000; // 8
					4'b1001: segUB = 7'b0010000; // 9
					default: segUB = 7'b1111111; // Default (off)
			 endcase

			 // Mapeo del primer dígito de 'rO' (decenas)
			 case(dR)
					4'b0000: segDR = 7'b1000000; // 0
					4'b0001: segDR = 7'b1111001; // 1
					4'b0010: segDR = 7'b0100100; // 2
					4'b0011: segDR = 7'b0110000; // 3
					4'b0100: segDR = 7'b0011001; // 4
					4'b0101: segDR = 7'b0010010; // 5
					4'b0110: segDR = 7'b0000010; // 6
					4'b0111: segDR = 7'b1111000; // 7
					4'b1000: segDR = 7'b0000000; // 8
					4'b1001: segDR = 7'b0010000; // 9
					default: segDR = 7'b1111111; // Default (off)
			 endcase

			 // Mapeo del segundo dígito de 'rO' (unidades)
			 case(uR)
					4'b0000: segUR = 7'b1000000; // 0
					4'b0001: segUR = 7'b1111001; // 1
					4'b0010: segUR = 7'b0100100; // 2
					4'b0011: segUR = 7'b0110000; // 3
					4'b0100: segUR = 7'b0011001; // 4
					4'b0101: segUR = 7'b0010010; // 5
					4'b0110: segUR = 7'b0000010; // 6
					4'b0111: segUR = 7'b1111000; // 7
					4'b1000: segUR = 7'b0000000; // 8
					4'b1001: segUR = 7'b0010000; // 9
					default: segUR = 7'b1111111; // Default (off)
			 endcase
			 
		end
		
	initial
		begin
				
			aO = 0;
			bO = 0;
			rO = 0;
			
		end
		
endmodule