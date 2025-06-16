module top_FPGA(input logic clk, reset,
				input logic [2:0] btn,
				output logic led);
				
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
				
	logic [31:0] PC, Instr, ReadData;

	logic [31:0] WriteDataB, DataAdrB, ReadDataB;
	logic MemWriteB;
	
	// instantiate processor and memories
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
								WriteData, ReadData);
								
	imem imem(PC, Instr);
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData, MemWriteB, DataAdrB, WriteDataB, ReadDataB);
	// clk = seconds, MemWrite = wren, DataAdr = address, WriteData = data, ReadData = q;
	write_mem writeMem(~btn, MemWriteB, DataAdrB, WriteDataB);
	// buscar Chipselect

	
	always @(negedge clk)
	begin
		if(1'b1) // Cambiar a MemWriteB
		begin
			if(DataAdr === 100 & ReadData === 7) 
				begin
					led = 1;
				end 
				
				else if (DataAdr !== 96) 
				begin
					led = 0;
				end
		end
	end

endmodule