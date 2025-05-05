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
	logic [7:0] display_data; // note to self: cambiar luego

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

	uartController uart_controller (
		.clk(clk),
		.rst(rst),
		.rx_pin(rx_pin),
		.tx_pin(tx_pin),
		.display_data(display_data)
	);

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
