module connect4_fsm (
    input logic clk,
    input logic reset,
    input logic start_button,
    input logic player1_move,
    input logic player2_move,
    input logic timeout,
    input logic victory_detected,
    input logic draw_detected,
    output logic enable_timer,
    output logic reset_timer,
    output logic random_move,
    output logic drop_piece,
    output logic switch_player,
    output logic show_winner,
    output logic show_draw,
    output logic show_start_screen,
	 output logic activate_selector,
	 output logic [3:0] estado

);


    typedef enum logic [3:0] {
        S_START_SCREEN,
        S_WAIT_FOR_MOVE,
        S_START_SCREEN1,
        S_START_SCREEN2,
        S_TIMEOUT_RANDOM_MOVE,
        S_DROP_PIECE,
        S_CHECK_VICTORY,
        S_VICTORY,
        S_DRAW,
        S_SWITCH_PLAYER
    } state_t;

    state_t current_state, next_state;

    // Estado actual
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S_START_SCREEN;
            switch_player <= 1'b0;
        end else begin
            current_state <= next_state;
            if (current_state == S_SWITCH_PLAYER) 
                switch_player <= !switch_player; // Cambiar de jugador
            end
    end

    // Lógica de transición de estados y señales de control
    always_comb begin


        next_state = current_state;

        case (current_state)

            S_START_SCREEN: begin
                if (start_button)
                    next_state = S_START_SCREEN1;
            end

            S_START_SCREEN1: begin
                if (start_button)
                    next_state = S_WAIT_FOR_MOVE;
            end

            S_WAIT_FOR_MOVE: begin
                
                if (start_button)
                    next_state = S_DROP_PIECE;
                else if (timeout)
                    next_state = S_TIMEOUT_RANDOM_MOVE;
            end

            S_TIMEOUT_RANDOM_MOVE: begin
                next_state = S_CHECK_VICTORY;
            end

            S_DROP_PIECE: begin
                next_state = S_CHECK_VICTORY;
            end

            S_CHECK_VICTORY: begin
                if (victory_detected)
                    next_state = S_VICTORY;
                else if (draw_detected)
                    next_state = S_DRAW;
                else
                    next_state = S_SWITCH_PLAYER; // CAMBIAR ESTOOOO
            end

            S_VICTORY: begin
               next_state = S_START_SCREEN; // Volver a la pantalla de inicio después de mostrar el ganador
            //show_winner = 1; // Mostrar el ganador
            end

            S_DRAW: begin
               // show_draw = 1;
                // No cambio de estado, se queda mostrando empate
            end

            S_SWITCH_PLAYER: begin
                //switch_player = 1;
               // reset_timer = 1;
                next_state = S_WAIT_FOR_MOVE;
            end

            default: next_state = S_START_SCREEN;

        endcase
    end

assign estado = current_state;
assign activate_selector = ((current_state == S_WAIT_FOR_MOVE) && player1_move) ? 1 : 0; // Activar selector solo en este estado
assign reset_timer = ((current_state == S_SWITCH_PLAYER) || (current_state == S_START_SCREEN) ) ? 1 : 0; 
assign random_move = (current_state == S_TIMEOUT_RANDOM_MOVE) ? 1 : 0; // Activar random_move solo en este estado
assign drop_piece = ((current_state == S_DROP_PIECE) || (current_state == S_TIMEOUT_RANDOM_MOVE)) ? 1 : 0; // Activar drop_piece solo en este estado
//assign switch_player = (current_state == S_SWITCH_PLAYER) ? 1 : 0; // Activar switch_player solo en este estado

endmodule