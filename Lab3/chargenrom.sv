/**
 * @module chargenrom
 * @brief Character generator ROM for VGA text display.
 *
 * This module retrieves a pixel value for a given character and offset position
 * by looking up a pre-loaded character ROM.
 *
 * The character ROM is initialized from an external text file ("charrom.txt").
 * Characters are stored starting from ASCII code 65 ('A').
 *
 * The code is an adaptation from:
 * "Digital Design and Computer Architecture, Second Edition"
 * by David Money Harris & Sarah L. Harris.
 *
 * @param ch    8-bit ASCII character code input (expects 'A' or higher).
 * @param xoff  Fine horizontal pixel offset within the character (0–7).
 * @param yoff  Fine vertical pixel offset within the character (0–7).
 * @param pixel Output pixel value (1 = on, 0 = off) for the specified character and offset.
 */
module chargenrom(
	input logic [7:0] ch,
	input logic [2:0] xoff, yoff,
	output logic pixel
);

logic [5:0] charrom[2047:0]; // character generator ROM
logic [7:0] line; // a line read from the ROM

	// initialize ROM with characters from text file
	initial
	$readmemb("charrom.txt", charrom);
	// index into ROM to find line of character
	assign line = charrom[yoff+{ch-65, 3'b000}]; // subtract 65 because A
	// is entry 0
	// reverse order of bits
	assign pixel = line[3'd7-xoff];
	
endmodule