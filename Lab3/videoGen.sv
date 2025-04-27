/**
 * @module videoGen
 * @brief Simple video generator for VGA display.
 *
 * This module generates pixel color outputs (R, G, B) based on the current
 * screen coordinates (x, y). It draws characters from a character ROM and
 * a green rectangle overlay.
 *
 * The code is an adaptation from:
 * "Digital Design and Computer Architecture, Second Edition"
 * by David Money Harris & Sarah L. Harris.
 *
 * @param x Current horizontal pixel position (0 to 639).
 * @param y Current vertical pixel position (0 to 479).
 * @param r 8-bit red color output.
 * @param g 8-bit green color output.
 * @param b 8-bit blue color output.
 */
module videoGen(

	input logic [9:0] x, y, 
	output logic [7:0] r, g, b
	);

	logic pixel, inrect;
	
	// given y position, choose a character to display
	// then look up the pixel value from the character ROM
	// and display it in red or blue. Also draw a green rectangle.
	chargenrom chargenromb(y[8:3]+8'd65, x[2:0], y[2:0], pixel);
	rectgen rectgen(x, y, 10'd120, 10'd150, 10'd200, 10'd230, inrect);
	assign {r, b} = (y[3]==0) ? {{8{pixel}},8'h00} : {8'h00,{8{pixel}}};
	assign g = inrect ? 8'hFF : 8'h00;
	
endmodule