`timescale 1ns / 1ps

module tb_game_core;

    logic clk;
    logic reset;
    logic drop_piece;
    logic [2:0] input_col;
    logic player_turn;
    logic [2:0] last_row, last_col;
    logic [1:0] board [0:5][0:6];
    logic victory_detected, draw_detected;

    // Instancia DUT
    game_core uut (
        .clk(clk),
        .reset(reset),
        .drop_piece(drop_piece),
        .input_col(input_col),
        .player_turn(player_turn),
        .victory_detected(victory_detected),
        .draw_detected(draw_detected),
        .last_row(last_row),
        .last_col(last_col),
        .board(board)
    );

    // Reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Mostrar tablero
    task display_board;
        for (int r = 0; r < 6; r++) begin
            $write("| ");
            for (int c = 0; c < 7; c++) begin
                $write("%0d ", board[r][c]);
            end
            $display("|");
        end
        $display("victory: %b, draw: %b\n", victory_detected, draw_detected);
    endtask

    // Realizar jugada
	 //Simular entradas de la fsm
    task drop(input [2:0] col, input logic turn);
        @(posedge clk);
        input_col = col;
        player_turn = turn;
        drop_piece = 1;
        @(posedge clk);
        drop_piece = 0;
        @(posedge clk);
        $display("Jugador %0d coloco en columna %0d", turn+1, col);
        display_board();
    endtask

    // Simulación
    initial begin
        reset = 1;
        drop_piece = 0;
        input_col = 0;
        player_turn = 0;
        @(posedge clk);
        reset = 0;

        //  victoria horizontal
        drop(1, 0);
        drop(0, 1);
        drop(2, 0);
        drop(0, 1);
        drop(3, 0);
        drop(0, 1);
        drop(4, 0);  // victoria jugador 1

        
       

        #20;
        $display("Completado");
     
    end

endmodule
