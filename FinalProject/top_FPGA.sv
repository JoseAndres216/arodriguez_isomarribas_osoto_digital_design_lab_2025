module top_FPGA(input logic clk, reset, btn,
				output logic led);
				
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
				
	logic [31:0] PC, Instr, ReadData;
	
	// instantiate processor and memories
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
								WriteData, ReadData);
								
	imem imem(PC, Instr);
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
	// clk = seconds, MemWrite = wren, DataAdr = address, WriteData = data, ReadData = q;
	//writeMem writeMem(btn, MemWrite, DataAdr, WriteData, WriteData);

	
	always @(negedge clk)
	begin
		if(MemWrite) 
		begin
			if(DataAdr === 100 & WriteData === 7) 
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