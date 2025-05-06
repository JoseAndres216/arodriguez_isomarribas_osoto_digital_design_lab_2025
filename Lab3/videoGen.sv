/**
 * @module videoGen
 * @brief VGA pixel color generator for a Connect4 game board.
 *
 * This module determines the color output (R, G, B) for each pixel on a VGA display
 * based on the game board state of a Connect4 game. It displays:
 * - A 7x6 grid representing the board
 * - Circular "holes" where player pieces are placed
 * - A green selector rectangle highlighting the selected column
 *
 * @param x            Horizontal pixel coordinate (range: 0 to 639).
 * @param y            Vertical pixel coordinate (range: 0 to 479).
 * @param selectColumn Selected column index (0 to 6), indicates where a new piece will be placed.
 * @param board        6x7 array representing the Connect4 board.
 *                     Each cell can be:
 *                       2'b00 = empty (white),
 *                       2'b01 = red piece,
 *                       2'b10 = yellow piece.
 * @param r            8-bit red component of the pixel output.
 * @param g            8-bit green component of the pixel output.
 * @param b            8-bit blue component of the pixel output.
 */

module videoGen(
    input logic [9:0] x, y,
    input logic [2:0] selectColumn,
    input logic [1:0] board [0:5][0:6],
    output logic [7:0] r, g, b
);

    // Signals from the board grid detector
    logic grid_on;         ///< High when the current pixel is within the board grid area
    logic [2:0] col, row;  ///< Column and row indices derived from the (x, y) position
    logic in_hole;         ///< High when the pixel is inside a circular hole
    logic in_selector;     ///< High when the pixel is inside the selection box

    // Grid decoder: identifies if (x,y) is in the board and maps it to a row/col
    boardGrid grid(
        .x(x),
        .y(y),
        .grid_on(grid_on),
        .col(col),
        .row(row),
        .in_hole(in_hole)
    );

    // Selector box module: highlights the selected column with a green rectangle
    selectBox selector(
        .x(x),
        .y(y),
        .selected_col(selectColumn),
        .grid_top(50),
        .in_select(in_selector)
    );

    /**
     * @brief Main combinational block for pixel color generation.
     *
     * Determines the color of the current pixel based on:
     * - Whether it's in the selector
     * - Whether it's in the board grid
     * - Whether it's inside a circular hole
     * - What value is present in the board[row][col]
     */
    always_comb begin
        if (in_selector) begin
            // Green selector rectangle
            r = 8'h00;
            g = 8'hFF;
            b = 8'h00;
        end else if (grid_on) begin
            if (in_hole) begin
                // Inside a circular hole, show the color based on the board state
                if (board[row][col] == 2'b00) begin
                    // Empty hole (white)
                    r = 8'hFF;
                    g = 8'hFF;
                    b = 8'hFF;
                end else if (board[row][col] == 2'b01) begin
                    // Red piece
                    r = 8'hFF;
                    g = 8'h00;
                    b = 8'h00;
                end else if (board[row][col] == 2'b10) begin
                    // Yellow piece
                    r = 8'hFF;
                    g = 8'hFF;
                    b = 8'h00;
                end else begin
                    // Safety fallback (white)
                    r = 8'hFF;
                    g = 8'hFF;
                    b = 8'hFF;
                end
            end else begin
                // Inside grid but not in a hole (board background - blue)
                r = 8'h00;
                g = 8'h00;
                b = 8'hFF;
            end
        end else begin
            // Outside of the board grid (black background)
            r = 8'h00;
            g = 8'h00;
            b = 8'h00;
        end
    end

endmodule
