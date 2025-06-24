/**
 * @module vgaController
 * @brief VGA controller for generating synchronization and blanking signals.
 *
 * This module generates horizontal and vertical synchronization signals,
 * blanking signals, and tracks the current pixel position (x, y) according
 * to standard VGA timing parameters.
 *
 * The code is an adaptation from the book:
 * "Digital Design and Computer Architecture, Second Edition" 
 * by David Money Harris & Sarah L. Harris.
 *
 * @param HACTIVE Number of active horizontal pixels (default: 640).
 * @param HFP     Horizontal front porch size (default: 16).
 * @param HSYN    Horizontal sync pulse width (default: 96).
 * @param HBP     Horizontal back porch size (default: 48).
 * @param HMAX    Total horizontal pixels (computed).
 * @param VBP     Vertical back porch size (default: 32).
 * @param VACTIVE Number of active vertical lines (default: 480).
 * @param VFP     Vertical front porch size (default: 11).
 * @param VSYN    Vertical sync pulse width (default: 2).
 * @param VMAX    Total vertical lines (computed).
 *
 * @param vgaclk  VGA pixel clock input (e.g., 25.175 MHz).
 * @param hsync   Horizontal sync output (active low).
 * @param vsync   Vertical sync output (active low).
 * @param sync_b  Composite sync signal (active low).
 * @param blank_b Blanking signal indicating active video area (high when active).
 * @param x       Current horizontal pixel position.
 * @param y       Current vertical pixel position.
 */
module vgaController 
	#(
	parameter HACTIVE = 10'd640,
	HFP = 10'd16,
	HSYN = 10'd96,
	HBP = 10'd48,
	HMAX = HACTIVE + HFP + HSYN + HBP,
	VBP = 10'd32,
	VACTIVE = 10'd480,
	VFP = 10'd11,
	VSYN = 10'd2,
	VMAX = VACTIVE + VFP + VSYN + VBP
	)
	(
	input logic vgaclk,
	output logic hsync, vsync, sync_b, blank_b,
	output logic [9:0] x, y
	);

	// counters for horizontal and vertical positions
	always @(posedge vgaclk) begin
		x++;
		if (x == HMAX) begin
			x = 0;
			y++;
			if (y == VMAX) 
				y = 0;
		end
	end

	// compute sync signals (active low)
	assign hsync = ~(x >= HACTIVE + HFP & x < HACTIVE + HFP + HSYN);
	assign vsync = ~(y >= VACTIVE + VFP & y < VACTIVE + VFP + VSYN);
	assign sync_b = hsync & vsync;
	// force outputs to black when outside the legal display area
	assign blank_b = (x < HACTIVE) & (y < VACTIVE);
	
endmodule