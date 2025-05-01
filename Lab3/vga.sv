/**
 * @module vga
 * @brief VGA video signal generator.
 *
 * This module generates VGA signals including synchronization, blanking,
 * and RGB color outputs. It uses a PLL to derive the required pixel clock
 * from the main FPGA clock and delegates timing and pixel color generation
 * to submodules.
 *
 * This code is an adaptation from the code provided in the book Digital Design and
 * Computer Architecture, Second Edition, by David Money Harris & Sarah L. Harris
 *
 * @param clk   50 MHz FPGA system clock input.
 * @param rst   Asynchronous reset input for PLL and system.
 * @param vgaclk Output pixel clock at 25.175 MHz for VGA.
 * @param hsync Horizontal sync signal for VGA.
 * @param vsync Vertical sync signal for VGA.
 * @param sync_b Composite sync signal (usually combined H/V sync, active low).
 * @param blank_b Blanking signal to indicate active video area (active low).
 * @param r     8-bit red color output to VGA DAC.
 * @param g     8-bit green color output to VGA DAC.
 * @param b     8-bit blue color output to VGA DAC.
 */
module vga(
	input logic clk,					// 50 MHz FPGA clock
	input logic rst,					// Reset Switch
	output logic vgaclk, 			// 25.175 MHz VGA clock
	output logic hsync, vsync,
	output logic sync_b, blank_b, // to monitor & DAC
	output logic [7:0] r, g, b    // to video DAC
); 

	logic [9:0] x = 0;
	logic [9:0] y = 0;
	

    logic [1:0] board [0:5][0:6];
	 
	 /**
     * @brief Initial board color setup.
     * 
     * This block initializes all cells to white (empty),
     * and sets a few colored pieces for testing.
     */
    initial begin
        integer i, j;
		  // Set all cells to white (empty holes)
        for (i = 0; i < 6; i = i + 1)
            for (j = 0; j < 7; j = j + 1)
                board[i][j] = 2'b00;

        // Example pieces
        board[5][3] = 2'b01; // // Red piece
        board[4][3] = 2'b10; // Yellow piece
        board[5][2] = 2'b01; // Red piece
        board[5][4] = 2'b10; // Yellow piece
    end

	// Use a PLL to create the 25.175 MHz VGA pixel clock
	// 25.175 MHz clk period = 39.772 ns
	// Screen is 800 clocks wide by 525 tall, but only 640 x 480 used for display
	// HSync = 1/(39.772 ns * 800) = 31.470 KHz
	// Vsync = 31.474 KHz / 525 = 59.94 Hz (~60 Hz refresh rate)
	pll vgapll(.refclk(clk), .rst(rst), .outclk_0(vgaclk), .locked());

	// generate monitor timing signals
	vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);

	// user-defined module to determine pixel color
	// Its needed to be instantiated this way to pass
	// the board as a matrix 
	videoGen videoGen(
    .x(x),
    .y(y),
    .selectColumn(3'd2),
    .board(board),
    .r(r),
    .g(g),
    .b(b)
	 );

	
endmodule

