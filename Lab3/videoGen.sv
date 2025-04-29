/**
 * @module videoGen
 * @brief Connect4 video generator
 *
 * This module generates VGA pixel color outputs (R, G, B) for a Connect4 board.
`include "color_types.sv"
 *
 * Displays a board with 6 rows and 7 columns and a selection rectangle
 * 
 * @param x Horizontal pixel coordinate (0 to 639).
 * @param y Vertical pixel coordinate (0 to 479).
 * @param r 8-bit red color output.
 * @param g 8-bit green color output.
 * @param b 8-bit blue color output.
 */

module videoGen(
    input logic [9:0] x, y,
	 input logic [2:0] selectColumn,
	 input color_t board [0:5][0:6],
    output logic [7:0] r, g, b
);

    // Signals for grid detection and cell identification
    logic grid_on;      ///< High if (x,y) is inside the game board
    logic [2:0] col;     ///< Column index (0 to 6)
    logic [2:0] row;     ///< Row index (0 to 5)
    logic in_hole;      ///< High if (x,y) is inside a hole (circle) in the board
	 logic in_selector;



    /**
     * @brief Grid generator instance.
     * 
     * This module detects whether the current pixel belongs to the game board
     * and maps pixel coordinates to board row/column indices.
     */
    boardGrid grid(x, y, grid_on, col, row, in_hole);
	 
	 selectBox selector(x, y, selectColumn, 50, in_selector);

    

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
