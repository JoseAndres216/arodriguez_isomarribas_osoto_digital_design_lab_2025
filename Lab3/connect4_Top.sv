module connect4_Top (	
	input logic clk,				// 50 MHz FPGA clock
	input logic rst,				// Reset Switch
	input logic changeBtn,	// change column button
	input logic playBtn,	// select button 2
	input  logic rx_pin,           // Pin conectado al TX del Arduino
	output logic tx_pin,           // Pin conectado al RX del Arduino
	output logic vgaclk, 			// 25.175 MHz VGA clock
	output logic hsync, vsync,
	output logic sync_b, blank_b, // to monitor & DAC
	output logic [7:0] r, g, b,    // to video DAC
	output logic [6:0] hex0,       // Dígito menos significativo
	output logic [6:0] hex1,        // Dígito más significativo
	output logic change_LED,
	output logic play_LED	// 0 = player 1, 1 = player 2
);

	logic [1:0] board [0:5][0:6];
	logic [7:0] display_data; // note to self: can be deleted after debug communication
	logic timeOut;  // t0
   	logic [3:0] current_seconds;  // Para 10 segundos, se necesitan 4 bits (log2(11) ≈ 3.5)
	logic [2:0] selectedColumn; // Column to be highlighted (selected column)
	logic changeColumn; // debounced Button signal  to change the selected column
	logic play; //  debounced Button signal to confirm the selected column or play the piece
	logic player1_move, player2_move; // Signals to indicate the player's move,
	logic activate_selector; // Initialize the selected column to 0

	logic victory_detected, draw_detected, enable_timer, random_move, drop_piece, switch_player, show_winner, show_draw, show_start_screen, update_board; // Signals to indicate victory or draw
	logic reset_timer;
	logic [3:0] estado;
	logic player_turn;
    logic [2:0] last_row, last_col;

	logic start_button_edge;   // flanco de subida del botón "play"

	// Si es movimiento aleatorio, se selecciona columna al azar
    logic [2:0] random_col;
	logic [2:0] selected_col;
	
/*
	initial begin
		integer i, j;
		for (i = 0; i < 6; i = i + 1)
			for (j = 0; j < 7; j = j + 1)
				board[i][j] = 2'b00;

		board[5][3] = 2'b01;
		board[4][3] = 2'b10;
		board[5][2] = 2'b01;
		board[5][4] = 2'b10;
	end
*/

edge_detector edge_detect_start (
    .clk(clk),
    .rst(rst),
    .signal_in(play),
    .rising_edge(start_button_edge)
);
	debouncer #(
		.N(20)
	) debounce_inst (
		.clk(clk),
		.rst(rst),
		.noisy_in(changeBtn),
		.clean_out(changeColumn)
	);

	columnSelector #(
		.N(3)
	) column_selector (
		.clk(clk),
		.rst(rst),
		.button(activate_selector),
		.selectColumn(selectedColumn)
	);

	debouncer #(
		.N(20)
	) debounce2_inst (
		.clk(clk),
		.rst(rst),
		.noisy_in(playBtn),
		.clean_out(play)
	);
	
	// Instancia del módulo FSM
	connect4_fsm fsm_inst (
		.clk(clk),
		.reset(rst),
		.start_button(start_button_edge),
		.player1_move(changeColumn),
		.player2_move(player2_move),
		.timeout(timeOut),
		.victory_detected(victory_detected),
		.draw_detected(draw_detected),
		.enable_timer(enable_timer),
		.reset_timer(reset_timer),
		.random_move(random_move),
		.drop_piece(drop_piece),
		.switch_player(switch_player),
		.show_winner(show_winner),
		.show_draw(show_draw),
		.show_start_screen(show_start_screen),
		.activate_selector(activate_selector),
		.estado(estado)
	);


    // DUT
    board_controller uut (
        .clk(clk),
        .reset(rst),
        .drop_piece(drop_piece),
        .input_col(selected_col),
        .player_turn(player_turn),
        .last_row(last_row),
        .last_col(last_col),
        .board(board)
    );


	vga vga_inst (
		.clk(clk),
		.rst(1'b0),
		.board(board),
		.selectColumn(selectedColumn),
		.vgaclk(vgaclk),
		.hsync(hsync),
		.vsync(vsync),
		.sync_b(sync_b),
		.blank_b(blank_b),
		.r(r),
		.g(g),
		.b(b)
	);

	uartController uart_controller (
		.clk(clk),
		.rst(rst),
		.rx_pin(rx_pin),
		.tx_pin(tx_pin),
		.display_data(display_data)
	);

	
	timer #(
    .CLOCK_FREQ_HZ(50_000_000),
    .seconds_target(10)
	) myTimer (
    .clk(clk),
    .rst(rst || reset_timer),
    .current_seconds(current_seconds)
	);
	
	
	dec7seg #(
        .N(4)
    ) display7seg (
        .value(current_seconds),
        .segU(hex0),
        .segT(hex1)
    );
	 
	comparator #(
		.N(4)
	) comp_inst (
		.A(4'b0000),
		.B(current_seconds),
		.equal(timeOut)
	);

	   random_move_gen rng (
        .clk(clk),
        .rst(rst),
		.gen(random_move),
        .move(random_col)
    );

	assign change_LED = random_move; // LED to indicate the change column button pressed
	assign play_LED = play; // LED to indicate the player turn (0 = player 1, 1 = player 2)
    assign selected_col = (random_move) ? random_col : selectedColumn;
	
/*
	// this is useful to debug communication between ARDUINO and FGPA
	
	hex7seg hex_low (
		.value(display_data[3:0]),
		.segments(hex0)
	);

	hex7seg hex_high (
		.value(display_data[7:4]),
		.segments(hex1)
	);
*/
endmodule
