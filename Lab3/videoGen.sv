/**
 * @module videoGen
 * @brief Connect4 video generator - version with per-cell color initialization.
 *
 * This module generates VGA pixel color outputs (R, G, B) for a Connect4 board.
 * Each cell can be assigned an individual color (8-bit RGB).
 *
 * The board has 6 rows and 7 columns.
 * 
 * @param x Horizontal pixel coordinate (0 to 639).
 * @param y Vertical pixel coordinate (0 to 479).
 * @param r 8-bit red color output.
 * @param g 8-bit green color output.
 * @param b 8-bit blue color output.
 */

module videoGen(
    input logic [9:0] x, y,
    output logic [7:0] r, g, b
);

    // Signals for grid detection and cell identification
    logic grid_on;      ///< High if (x,y) is inside the game board
    logic [2:0] col;     ///< Column index (0 to 6)
    logic [2:0] row;     ///< Row index (0 to 5)
    logic in_hole;      ///< High if (x,y) is inside a hole (circle) in the board
	 logic in_selector;

    /**
     * @typedef color_t
     * @brief Structure to hold 8-bit RGB color for each cell.
     */
    typedef struct packed {
        logic [7:0] r;   ///< Red component (0-255)
        logic [7:0] g;   ///< Green component (0-255)
        logic [7:0] b;   ///< Blue component (0-255)
    } color_t;

    /**
     * @var board
     * @brief 6x7 matrix of cell colors.
     */
    color_t board [0:5][0:6];

    /**
     * @brief Grid generator instance.
     * 
     * This module detects whether the current pixel belongs to the game board
     * and maps pixel coordinates to board row/column indices.
     */
    boardGrid grid(x, y, grid_on, col, row, in_hole);
	 
	 selectBox selector(x, y, 3'd2, 50, in_selector);

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
            for (j = 0; j < 7; j = j + 1) begin
                board[i][j].r = 8'hFF;
                board[i][j].g = 8'hFF;
                board[i][j].b = 8'hFF;
            end

        // Example pieces
        board[5][3].r = 8'hFF; board[5][3].g = 8'h00; board[5][3].b = 8'h00; // Red piece
        board[4][3].r = 8'hFF; board[4][3].g = 8'hFF; board[4][3].b = 8'h00; // Yellow piece
        board[5][2].r = 8'hFF; board[5][2].g = 8'h00; board[5][2].b = 8'h00; // Red piece
        board[5][4].r = 8'hFF; board[5][4].g = 8'hFF; board[5][4].b = 8'h00; // Yellow piece
    end

    // pixel color logic
    always_comb begin
		 if (in_selector) begin
					// Dibujamos un rectángulo verde para la columna seleccionada
					r = 8'h00;
					g = 8'hFF;
					b = 8'h00;
        end 
		  else if (grid_on) begin
            if (in_hole) begin
                // Output color of the corresponding cell
                r = board[row][col].r;
                g = board[row][col].g;
                b = board[row][col].b;
            end else begin
                // Draw the board (blue background)
                r = 8'h00;
                g = 8'h00;
                b = 8'hFF;
            end
        end else begin
            // Outside the board (black background)
            r = 8'h00;
            g = 8'h00;
            b = 8'h00;
        end
    end

endmodule
