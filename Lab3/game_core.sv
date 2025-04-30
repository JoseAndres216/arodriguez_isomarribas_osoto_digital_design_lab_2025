//Modulo para testear union entre victory_checker y board_controller
module game_core (
    input  logic clk,
    input  logic reset,
    input  logic drop_piece,
    input  logic [2:0] input_col,
    input  logic player_turn,
    output logic victory_detected,
    output logic draw_detected,
    output logic [2:0] last_row,
    output logic [2:0] last_col,
    output logic [1:0] board [0:5][0:6]
);

    // Instancia del controlador del tablero
    board_controller bc (
        .clk(clk),
        .reset(reset),
        .drop_piece(drop_piece),
        .input_col(input_col),
        .player_turn(player_turn),
        .last_row(last_row),
        .last_col(last_col),
        .board(board)
    );

    // Instancia del verificador de victoria
    victory_checker vc (
        .board(board),
        .last_row(last_row),
        .last_col(last_col),
        .victory_detected(victory_detected),
        .draw_detected(draw_detected)
    );

endmodule
