/**
 * @module selectBox
 * @brief Generates a selection box to highlight the selected column.
 *
 * This module will display a selection box (a rectangle) at the top of the selected column
 * to visually indicate which column is currently selected for placing a piece in Connect4.
 *
 * @param x          Current horizontal pixel position.
 * @param y          Current vertical pixel position.
 * @param selected_col  Column that is selected (0 to 6).
 * @param grid_top   Top boundary of the grid where the box will be drawn.
 * @param in_select  Output signal: high ('1') if (x, y) is inside the selected box area, low ('0') otherwise.
 */
module selectBox(
    input logic [9:0] x, y,
    input logic [2:0] selected_col,
    input logic [9:0] grid_top,
    output logic in_select
);

    localparam CELL_WIDTH = 60;
    localparam BOX_HEIGHT = 10;

    // Determine the horizontal position of the selection box based on the selected column
    logic [9:0] box_left, box_right, box_top, box_bottom;
    
    assign box_left = 100 + selected_col * CELL_WIDTH;   // Left boundary of the selection box
    assign box_right = box_left + CELL_WIDTH;            // Right boundary (exclusive)
    assign box_top = grid_top - BOX_HEIGHT;              // Just above the grid
    assign box_bottom = grid_top;                         // Just below the box

    // Use rectgen to check if the pixel (x, y) is inside the selection box
    rectgen box_rectgen(
        .x(x),
        .y(y),
        .left(box_left),
        .top(box_top),
        .right(box_right),
        .bot(box_bottom),
        .inrect(in_select)
    );
    
endmodule
