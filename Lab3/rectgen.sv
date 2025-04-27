/**
 * @module rectgen
 * @brief Rectangle generator for VGA display.
 *
 * This module determines whether a given (x, y) pixel coordinate
 * falls within a defined rectangular region on the screen.
 *
 * The code is an adaptation from:
 * "Digital Design and Computer Architecture, Second Edition"
 * by David Money Harris & Sarah L. Harris.
 *
 * @param x       Current horizontal pixel position.
 * @param y       Current vertical pixel position.
 * @param left    Left boundary of the rectangle (inclusive).
 * @param top     Top boundary of the rectangle (inclusive).
 * @param right   Right boundary of the rectangle (exclusive).
 * @param bot     Bottom boundary of the rectangle (exclusive).
 * @param inrect  Output signal: high ('1') if (x, y) is inside the rectangle, low ('0') otherwise.
 */
module rectgen(

	input logic [9:0] x, y, left, top, right, bot,
	output logic inrect
	);
	
	assign inrect = (x >= left & x < right & y >= top & y < bot);
	
endmodule