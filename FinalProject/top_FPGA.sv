module top_FPGA(input logic clk, reset,
				input logic [2:0] btn,
				input  logic rx_pin,           // Pin conectado al TX del Arduino
				output logic tx_pin,           // Pin conectado al RX del Arduino
				output logic [1:0] led,
				output logic vgaclk, 			// 25.175 MHz VGA clock
				output logic hsync, vsync,
				output logic sync_b, blank_b, // to monitor & DAC
				output logic [7:0] r, g, b    // to video DAC
				);
				
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
				
	logic [31:0] PC, Instr, ReadData;

	logic [31:0] WriteDataB, DataAdrB, ReadDataB;
	logic MemWriteB;

   	logic [3:0] current_seconds;  // Para 10 segundos, se necesitan 4 bits (log2(11) ≈ 3.5)
	logic timeOut;  // t0

	logic [7:0] display_data; // currently not used, but can be used to display the transmited data on a 7-segment (debbuging)
	logic arduino_btn;
	
	// instantiate processor and memories
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
								WriteData, ReadData);
								
	imem imem(PC, Instr);
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData, MemWriteB, DataAdrB, WriteDataB, ReadDataB);

	write_mem writeMem(clk, {~btn[1], arduino_btn, ~btn[0]}, timeOut, MemWriteB, DataAdrB, WriteDataB);
	// buscar Chipselect

	timer #(
    .CLOCK_FREQ_HZ(50_000_000),
    .seconds_target(10)
	) myTimer (
    .clk(clk),
    .rst(reset),
    .current_seconds(current_seconds)
	);

	comparator #(
		.N(4)
	) comp_inst (
		.A(4'b0000),
		.B(current_seconds),
		.equal(timeOut)
	);

	uartController uart_controller (
		.clk(clk),
		.rst(reset),
		.rx_pin(rx_pin),
		.tx_pin(tx_pin),
		.display_data(display_data),
		.button_A(arduino_btn),
	);
	
	vga vga_inst (
		.clk(clk),
		.rst(1'b0),
		.circles({timeOut, led[1], led[0]}), // Circles not used in this example
		.vgaclk(vgaclk),
		.hsync(hsync),
		.vsync(vsync),
		.sync_b(sync_b),
		.blank_b(blank_b),
		.r(r),
		.g(g),
		.b(b)
	);

	
	always @(negedge clk)
	begin
		if(1'b1) // delete
		begin
			if(DataAdr === 100 && ReadData === 1) 
				begin
					led[1] = 1;
					led[0] = 0;
				end 
				
			else if (DataAdr === 100 && ReadData === 2) 
				begin
					led[0] = 1;
					led[1] = 0;
				end
			else if (DataAdr === 100) 
				begin
					led[0] = 0;
					led[1] = 0;
				end
		end
	end

endmodule