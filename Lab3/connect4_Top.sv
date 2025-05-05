module connect4_Top (	
	input logic clk,				// 50 MHz FPGA clock
	input logic rst,				// Reset Switch
   input  logic rx_pin,           // Pin conectado al TX del Arduino
   output logic tx_pin,           // Pin conectado al RX del Arduino
	output logic vgaclk, 			// 25.175 MHz VGA clock
	output logic hsync, vsync,
	output logic sync_b, blank_b, // to monitor & DAC
	output logic [7:0] r, g, b,    // to video DAC
	output logic [6:0] hex0,       // Dígito menos significativo
   output logic [6:0] hex1        // Dígito más significativo
);

	logic [1:0] board [0:5][0:6];

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

	vga vga_inst (
		.clk(clk),
		.rst(rst),
		.board(board),
		.vgaclk(vgaclk),
		.hsync(hsync),
		.vsync(vsync),
		.sync_b(sync_b),
		.blank_b(blank_b),
		.r(r),
		.g(g),
		.b(b)
	);

	logic [7:0] rx_data;
	logic rx_ready;
	logic [7:0] tx_data;
	logic tx_ready, tx_send;
	logic [7:0] display_data;

	// UART RX (desde Arduino)
	uart_rx #(
		.CLOCK_FREQ(50_000_000),
		.BAUD_RATE(9600)
	) uart_rx_inst (
		.clk(clk),
		.reset(rst),
		.rx(rx_pin),
		.data(rx_data),
		.ready(rx_ready)
	);

	// UART TX (hacia Arduino)
	uart_tx #(
		.CLOCK_FREQ(50_000_000),
		.BAUD_RATE(9600)
	) uart_tx_inst (
		.clk(clk),
		.reset(rst),
		.data(tx_data),
		.send(tx_send),
		.tx(tx_pin),
		.ready(tx_ready)
	);

	typedef enum logic [1:0] {
		IDLE,
		PREPARE_SEND,
		SEND,
		WAIT_DONE
	} state_t;

	state_t state = IDLE;

	always_ff @(posedge clk or posedge rst) begin
		if (rst) begin
			state <= IDLE;
			tx_send <= 0;
			tx_data <= 8'h4B; // 'K'
			display_data <= 8'h00;
		end else begin
			tx_send <= 0; // Pulso de 1 ciclo

			case (state)
				IDLE: begin
					if (rx_ready) begin
						display_data <= rx_data;
						state <= PREPARE_SEND;
					end
				end

				PREPARE_SEND: begin
					if (tx_ready) begin
						tx_send <= 1;
						state <= SEND;
					end
				end

				SEND: begin
					state <= WAIT_DONE;
				end

				WAIT_DONE: begin
					if (!tx_ready)
						state <= IDLE;  // Vuelve a intentar cuando TX esté ocupado (envío iniciado)
				end
			endcase
		end
	end

	// Mostrar el valor en HEX (2 dígitos)
	hex7seg hex_low (
		.value(display_data[3:0]),
		.segments(hex0)
	);

	hex7seg hex_high (
		.value(display_data[7:4]),
		.segments(hex1)
	);

endmodule
