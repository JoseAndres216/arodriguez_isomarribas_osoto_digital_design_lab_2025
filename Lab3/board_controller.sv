module board_controller (
    input  logic clk,
    input  logic reset,
    input  logic drop_piece,

    input  logic [2:0] input_col,
    input  logic player_turn,

    input  logic victory_detected,
    input  logic [2:0] win_r0, win_c0,
    input  logic [2:0] win_r1, win_c1,
    input  logic [2:0] win_r2, win_c2,
    input  logic [2:0] win_r3, win_c3,

    output logic [2:0] last_row,
    output logic [2:0] last_col,
    output logic [1:0] board [0:5][0:6]
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

            // Colocar ficha en flanco de subida
            if (~drop_piece_prev && drop_piece) begin
                last_col <= input_col;
                for (int r = 5; r >= 0; r--) begin
                    if (board[r][input_col] == 2'b00) begin
                        board[r][input_col] <= player_code;
                        last_row <= r[2:0];
                        break;
                    end
                end
            end

            // Marcar fichas ganadoras si hay victoria
            if (victory_detected) begin
                board[win_r0][win_c0] <= 2'b11;
                board[win_r1][win_c1] <= 2'b11;
                board[win_r2][win_c2] <= 2'b11;
                board[win_r3][win_c3] <= 2'b11;
            end
        end
    end

endmodule
