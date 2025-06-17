module top_FPGA(input logic clk, reset,
				input logic [2:0] btn,
				output logic [1:0] led);
				
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
				
	logic [31:0] PC, Instr, ReadData;

	logic [31:0] WriteDataB, DataAdrB, ReadDataB;
	logic MemWriteB;

   	logic [3:0] current_seconds;  // Para 10 segundos, se necesitan 4 bits (log2(11) ≈ 3.5)
	logic timeOut;  // t0

	logic semidebounced0, semidebounced1, semidebounced2;
	logic debounced0, debounced1, debounced2;

	
	// instantiate processor and memories
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
								WriteData, ReadData);
								
	imem imem(PC, Instr);
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData, MemWriteB, DataAdrB, WriteDataB, ReadDataB);
	// clk = seconds, MemWrite = wren, DataAdr = address, WriteData = data, ReadData = q;
	write_mem writeMem(clk, ~btn, timeOut, MemWriteB, DataAdrB, WriteDataB);
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

	edge_detector edge_detector0 (
    .clk(clk),
    .rst(reset),
    .signal_in(semidebounced0),
    .rising_edge(debounced0)
);
	debouncer #(
		.N(20)
	) debounce0 (
		.clk(clk),
		.rst(reset),
		.noisy_in(btn[0]),
		.clean_out(semidebounced0)
	);

	edge_detector edge_detector1 (
	.clk(clk),
	.rst(reset),
	.signal_in(semidebounced1),
	.rising_edge(debounced1)
);
	debouncer #(
		.N(20)
	) debounce1 (
		.clk(clk),
		.rst(reset),
		.noisy_in(btn[1]),
		.clean_out(semidebounced1)
	);
	
	edge_detector edge_detector2 (
	.clk(clk),
	.rst(reset),
	.signal_in(semidebounced2),
	.rising_edge(debounced2)
);
	debouncer #(
		.N(20)
	) debounce2 (
		.clk(clk),
		.rst(reset),
		.noisy_in(btn[2]),
		.clean_out(semidebounced2)
	);
	

	
	always @(negedge clk)
	begin
		if(1'b1) // Cambiar a MemWriteB
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