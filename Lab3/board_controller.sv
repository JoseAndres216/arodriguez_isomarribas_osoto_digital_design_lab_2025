module board_controller (
    input  logic clk,
    input  logic reset,

    input  logic drop_piece, // Señal de la FSM para "activar" el módulo (con flanco de subida)

    input  logic [2:0] input_col,       // columna seleccionada (0–6)
    input  logic player_turn,          // 0 = jugador 1, 1 = jugador 2 - Jugador Actual

    output logic [2:0] last_row, // Esto se necesita para el chequeo de victoria
    output logic [2:0] last_col, // Esto se necesita para el chequeo de victoria

    output logic [1:0] board [0:5][0:6] // Tablero
    // 2'b00 = vacío, 2'b01 = jugador 1, 2'b10 = jugador 2
);

    logic [1:0] player_code;
    logic drop_piece_prev;

    always_comb begin
        player_code = (player_turn == 1'b0) ? 2'b01 : 2'b10;
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            for (int r = 0; r < 6; r++)
                for (int c = 0; c < 7; c++)
                    board[r][c] <= 2'b00;
            last_row <= 0;
            last_col <= 0;
            drop_piece_prev <= 0;
        end else begin
            drop_piece_prev <= drop_piece;

            if (~drop_piece_prev && drop_piece) begin // Flanco de subida
                last_col <= input_col;
                for (int r = 5; r >= 0; r--) begin
                    if (board[r][input_col] == 2'b00) begin
                        board[r][input_col] <= player_code;
                        last_row <= r[2:0];
                        break;
                    end
                end
            end
        end
    end

endmodule
