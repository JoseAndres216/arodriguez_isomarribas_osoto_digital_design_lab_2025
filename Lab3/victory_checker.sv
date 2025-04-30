module victory_checker (

    input  [1:0] board [0:5][0:6], //Tablero
	 
    input  [2:0] last_row,
    input  [2:0] last_col,
	 
    output reg victory_detected,
    output reg draw_detected
);

    reg [1:0] player;
    integer i, r, c;
    integer count;

    always @(*) begin
        player = board[last_row][last_col];
        victory_detected = 0;

        // Chequeo horizontal
        count = 0;
        for (i = 0; i < 7; i = i + 1) begin
            if (board[last_row][i] == player)
                count = count + 1;
            else
                count = 0;

            if (count == 4)
                victory_detected = 1;
        end

        // Chequeo Vertical
        count = 0;
        for (i = 0; i < 6; i = i + 1) begin
            if (board[i][last_col] == player)
                count = count + 1;
            else
                count = 0;

            if (count == 4)
                victory_detected = 1;
        end

        //Chequeo diagonal derecha
        count = 0;
        for (i = -3; i <= 3; i = i + 1) begin
            r = last_row + i;
            c = last_col + i;
            if (r >= 0 && r < 6 && c >= 0 && c < 7) begin
                if (board[r][c] == player)
                    count = count + 1;
                else
                    count = 0;

                if (count == 4)
                    victory_detected = 1;
            end
        end

        // Chequeo diagonal izquierda
        count = 0;
        for (i = -3; i <= 3; i = i + 1) begin
            r = last_row - i;
            c = last_col + i;
            if (r >= 0 && r < 6 && c >= 0 && c < 7) begin
                if (board[r][c] == player)
                    count = count + 1;
                else
                    count = 0;

                if (count == 4)
                    victory_detected = 1;
            end
        end

        // Chequeo empate
        draw_detected = 1;
        for (r = 0; r < 6; r = r + 1) begin
            for (c = 0; c < 7; c = c + 1) begin
                if (board[r][c] == 2'b00)
                    draw_detected = 0;
            end
        end
    end

endmodule
