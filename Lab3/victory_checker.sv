module victory_checker (
    input  [1:0] board [0:5][0:6], // Tablero
    input  [2:0] last_row,
    input  [2:0] last_col,

    output reg victory_detected,
    output reg draw_detected,

    output reg [2:0] win_r0, win_c0,
    output reg [2:0] win_r1, win_c1,
    output reg [2:0] win_r2, win_c2,
    output reg [2:0] win_r3, win_c3
);

    reg [1:0] player;
    integer i, r, c;
    integer count;

    always @(*) begin
        // Inicializaciones
        player = board[last_row][last_col];
        victory_detected = 0;
        draw_detected = 1;

        win_r0 = 0; win_c0 = 0;
        win_r1 = 0; win_c1 = 0;
        win_r2 = 0; win_c2 = 0;
        win_r3 = 0; win_c3 = 0;

        if (player != 2'b00) begin

            // Chequeo horizontal
            count = 0;
            for (i = 0; i < 7; i = i + 1) begin
                if (board[last_row][i] == player)
                    count = count + 1;
                else
                    count = 0;

                if (count == 4) begin
                    victory_detected = 1;
                    win_r0 = last_row; win_c0 = i - 3;
                    win_r1 = last_row; win_c1 = i - 2;
                    win_r2 = last_row; win_c2 = i - 1;
                    win_r3 = last_row; win_c3 = i;
                end
            end

            // Chequeo vertical
            count = 0;
            for (i = 0; i < 6; i = i + 1) begin
                if (board[i][last_col] == player)
                    count = count + 1;
                else
                    count = 0;

                if (count == 4) begin
                    victory_detected = 1;
                    win_r0 = i - 3; win_c0 = last_col;
                    win_r1 = i - 2; win_c1 = last_col;
                    win_r2 = i - 1; win_c2 = last_col;
                    win_r3 = i;     win_c3 = last_col;
                end
            end

            // Diagonal ↘ (de arriba izquierda a abajo derecha)
            count = 0;
            for (i = -3; i <= 3; i = i + 1) begin
                r = last_row + i;
                c = last_col + i;
                if (r >= 0 && r < 6 && c >= 0 && c < 7) begin
                    if (board[r][c] == player)
                        count = count + 1;
                    else
                        count = 0;

                    if (count == 4) begin
                        victory_detected = 1;
                        win_r0 = r - 3; win_c0 = c - 3;
                        win_r1 = r - 2; win_c1 = c - 2;
                        win_r2 = r - 1; win_c2 = c - 1;
                        win_r3 = r;     win_c3 = c;
                    end
                end
            end

            // Diagonal ↙ (de arriba derecha a abajo izquierda)
            count = 0;
            for (i = -3; i <= 3; i = i + 1) begin
                r = last_row - i;
                c = last_col + i;
                if (r >= 0 && r < 6 && c >= 0 && c < 7) begin
                    if (board[r][c] == player)
                        count = count + 1;
                    else
                        count = 0;

                    if (count == 4) begin
                        victory_detected = 1;
                        win_r0 = r + 3; win_c0 = c - 3;
                        win_r1 = r + 2; win_c1 = c - 2;
                        win_r2 = r + 1; win_c2 = c - 1;
                        win_r3 = r;     win_c3 = c;
                    end
                end
            end
        end

        // Chequeo de empate (si no hay celdas vacías)
        for (r = 0; r < 6; r = r + 1) begin
            for (c = 0; c < 7; c = c + 1) begin
                if (board[r][c] == 2'b00)
                    draw_detected = 0;
            end
        end
    end

endmodule
