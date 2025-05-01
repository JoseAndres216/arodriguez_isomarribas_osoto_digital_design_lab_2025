module FSM (
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
    output logic update_board
);

    // Definición de estados
    typedef enum logic [3:0] {
        S_RESET,
        S_INICIO,
        S_ESPERAR_MOVIMIENTO,
        S_JUGADA_AZAR,
        S_CAER_FICHA,
        S_VERIFICAR_VICTORIA,
        S_VICTORIA,
        S_EMPATE,
        S_CAMBIAR_TURNO
    } state_t;

    state_t current_state, next_state;

    // Lógica secuencial: cambio de estado
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S_RESET;
        else
            current_state <= next_state;
    end

    // Lógica combinacional: definición de siguiente estado y salidas
    always_comb begin
        // Valores por defecto
        enable_timer = 0;
        reset_timer = 0;
        random_move = 0;
        drop_piece = 0;
        switch_player = 0;
        show_winner = 0;
        show_draw = 0;
        show_start_screen = 0;
        update_board = 0;

        next_state = current_state;

        case (current_state)
            S_RESET: begin
                reset_timer = 1;
                show_start_screen = 1;
                next_state = S_INICIO;
            end

            S_INICIO: begin
                show_start_screen = 1;
                if (start_button)
                    next_state = S_ESPERAR_MOVIMIENTO;
            end

            S_ESPERAR_MOVIMIENTO: begin
                enable_timer = 1;
                if (player1_move || player2_move)
                    next_state = S_CAER_FICHA;
                else if (timeout)
                    next_state = S_JUGADA_AZAR;
            end

            S_JUGADA_AZAR: begin
                random_move = 1;
                next_state = S_CAER_FICHA;
            end

            S_CAER_FICHA: begin
                drop_piece = 1;
                update_board = 1;
                next_state = S_VERIFICAR_VICTORIA;
            end

            S_VERIFICAR_VICTORIA: begin
                if (victory_detected)
                    next_state = S_VICTORIA;
                else if (draw_detected)
                    next_state = S_EMPATE;
                else
                    next_state = S_CAMBIAR_TURNO;
            end

            S_VICTORIA: begin
                show_winner = 1;
                // Se queda aquí hasta que se resetea
            end

            S_EMPATE: begin
                show_draw = 1;
                // Se queda aquí hasta que se resetea
            end

            S_CAMBIAR_TURNO: begin
                switch_player = 1;
                reset_timer = 1;
                next_state = S_ESPERAR_MOVIMIENTO;
            end

            default: next_state = S_RESET;
        endcase
    end

endmodule