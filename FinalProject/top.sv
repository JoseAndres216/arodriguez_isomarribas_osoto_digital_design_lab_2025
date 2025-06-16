// Para testbench
module top(input logic clk, reset,
				output logic [31:0] WriteData, DataAdr,
				output logic MemWrite);
				
	logic [31:0] PC, Instr, ReadData;
	
	// instantiate processor and memories
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
								WriteData, ReadData);
								
	imem imem(PC, Instr);
	//rom rom(PC[7:0], clk, Instr);
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
	// clk = seconds, MemWrite = wren, DataAdr = address, WriteData = data, ReadData = q;
	

endmodule