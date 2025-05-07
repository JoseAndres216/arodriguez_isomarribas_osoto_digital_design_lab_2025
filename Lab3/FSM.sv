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
        if (reset)
            current_state <= S_START_SCREEN;
        else
            current_state <= next_state;
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
               // show_winner = 1;
                // No cambio de estado, se queda mostrando victoria
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
	 
	  
    always_comb begin
        // Valores por defecto EXPLÍCITOS al inicio
        enable_timer = 0;
        show_winner = 0;
        show_draw = 0;
        show_start_screen = 0;
      

        // Asignaciones específicas por estado
        case (current_state)
            S_START_SCREEN: begin
					 show_start_screen = 1;
            end

            S_WAIT_FOR_MOVE: begin
					 enable_timer = 1;
            end

          
            default: ;
        endcase
    end

assign estado = current_state;
assign activate_selector = ((current_state == S_WAIT_FOR_MOVE) && player1_move) ? 1 : 0; // Activar selector solo en este estado
assign reset_timer = ((current_state == S_SWITCH_PLAYER) || (current_state == S_START_SCREEN) ) ? 1 : 0; 
assign random_move = (current_state == S_TIMEOUT_RANDOM_MOVE) ? 1 : 0; // Activar random_move solo en este estado
assign drop_piece = ((current_state == S_DROP_PIECE) || (current_state == S_TIMEOUT_RANDOM_MOVE)) ? 1 : 0; // Activar drop_piece solo en este estado

endmodule