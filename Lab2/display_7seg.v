module display_7seg #(
	parameter N = 4 
)(
	input [N-1:0] value,
	output reg [6:0] segU,
	output reg [6:0] segT
);

	reg [3:0] valueUnits;
	reg [3:0] valueTens;

	always @(*) begin
		valueUnits = value % 10;  
		valueTens = value / 10;

			case (valueUnits)
				4'b0000: segU = 7'b1000000; // 0
				4'b0001: segU = 7'b1111001; // 1
				4'b0010: segU = 7'b0100100; // 2
				4'b0011: segU = 7'b0110000; // 3
				4'b0100: segU = 7'b0011001; // 4
				4'b0101: segU = 7'b0010010; // 5
				4'b0110: segU = 7'b0000010; // 6
				4'b0111: segU = 7'b1111000; // 7
				4'b1000: segU = 7'b0000000; // 8
				4'b1001: segU = 7'b0010000; // 9
				default: segU = 7'b1111111; // Default (apagado)
			endcase

			case(valueTens)
				4'b0000: segT = 7'b1000000; // 0
				4'b0001: segT = 7'b1111001; // 1
				4'b0010: segT = 7'b0100100; // 2
				4'b0011: segT = 7'b0110000; // 3
				4'b0100: segT = 7'b0011001; // 4
				4'b0101: segT = 7'b0010010; // 5
				4'b0110: segT = 7'b0000010; // 6
				4'b0111: segT = 7'b1111000; // 7
				4'b1000: segT = 7'b0000000; // 8
				4'b1001: segT = 7'b0010000; // 9
				default: segT = 7'b1111111; // Default (off)
			endcase
    end
endmodule
