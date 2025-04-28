/**
 * @module tableGrid
 * @brief Connect4 grid detector and cell mapper for VGA display.
 *
 * This module determines if a given pixel coordinate (x, y) belongs to the Connect4 board,
 * computes the corresponding cell indices (column and row),
 * and detects whether the pixel is inside a circular hole (piece slot).
 *
 * @param x Horizontal pixel coordinate (0 to 639).
 * @param y Vertical pixel coordinate (0 to 479).
 * @param grid_on High ('1') if (x, y) is inside the board area.
 * @param col Column index (0 to 6) if inside board, undefined otherwise.
 * @param row Row index (0 to 5) if inside board, undefined otherwise.
 * @param in_hole High ('1') if (x, y) is inside a circular hole of the cell.
 */
module tableGrid(
    input logic [9:0] x, y,
    output logic grid_on,
    output logic [2:0] col,
    output logic [2:0] row,
    output logic in_hole
);

    localparam GRID_LEFT   = 100;
    localparam GRID_TOP    = 50;
    localparam CELL_WIDTH  = 60;
    localparam CELL_HEIGHT = 60;
    localparam HOLE_RADIUS = 20;
    localparam CENTER_X = CELL_WIDTH/2;
    localparam CENTER_Y = CELL_HEIGHT/2;

    logic [9:0] local_x, local_y;
    logic [9:0] cell_x, cell_y;
    
    assign grid_on = (x >= GRID_LEFT) && (x < GRID_LEFT + 7 * CELL_WIDTH) &&
                     (y >= GRID_TOP)  && (y < GRID_TOP + 6 * CELL_HEIGHT);

    assign local_x = x - GRID_LEFT;
    assign local_y = y - GRID_TOP;

    assign col = local_x / CELL_WIDTH;
    assign row = local_y / CELL_HEIGHT;

    assign cell_x = local_x % CELL_WIDTH;
    assign cell_y = local_y % CELL_HEIGHT;

    assign in_hole = ((cell_x - CENTER_X)*(cell_x - CENTER_X) +
                      (cell_y - CENTER_Y)*(cell_y - CENTER_Y)) <= (HOLE_RADIUS * HOLE_RADIUS);

endmodule
