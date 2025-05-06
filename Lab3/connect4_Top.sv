module connect4_Top (	
	input logic clk,				// 50 MHz FPGA clock
	input logic rst,				// Reset Switch
	input logic changeBtn,	// change column button
	input logic selectBtn,	// select button 2
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
	logic [7:0] display_data; // note to self: can be deleted after debug communication
	logic timeOut;  // t0
   	logic [3:0] current_seconds;  // Para 10 segundos, se necesitan 4 bits (log2(11) ≈ 3.5)
	logic [2:0] selectColumn; // Column to be highlighted (selected column)
	logic changeColumn; // Button to change the selected column
	

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

	// will need another debouncer for the select button
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
		.button(!changeColumn),
		.selectColumn(selectColumn)
	);

	vga vga_inst (
		.clk(clk),
		.rst(rst),
		.board(board),
		.selectColumn(selectColumn),
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
    .rst(rst),
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
