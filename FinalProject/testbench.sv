`timescale 1 ps / 1 ps
module testbench();

	logic clk;
	logic reset;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	
	// instantiate device to be tested
	top dut(clk, reset, WriteData, DataAdr, MemWrite);
	
	// initialize test
	initial
	
	begin
		reset <= 1; # 22; reset <= 0;
	end
	
	// generate clock to sequence tests
	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
	
	// check that 7 gets written to address 0x64 at end of program
	always @(negedge clk)
	begin
		if(MemWrite) 
		begin
			if(DataAdr === 100 & WriteData === 7) 
				begin
					$display("Simulation succeeded");
					//$stop;
				end 
				
				else if (DataAdr !== 96) 
				begin
					$display("Simulation failed");
					//$stop;
				end
		end
	end
	
endmodule

/**
module testbench();
    logic clk, we;
    logic [31:0] a, wd, rd;
    logic [5:0] read_addr;
    logic [31:0] read_data;

    dmem mem(
        .clk(clk), .we(we), .a(a), .wd(wd), .rd(rd),
        .read_addr(read_addr), .read_data(read_data)
    );

    initial begin
        // Inicializar RAM escribiendo en posición 0
        clk = 0; we = 1;
        a = 32'h00000000; // Dirección 0
        wd = 32'h12345678;

        #5 clk = 1; #5 clk = 0;
        we = 0;

        // Leer posición 0
        read_addr = 6'd0;
        #1 $display("Valor en RAM[0] = %h", read_data); // Debe ser 12345678
    end
endmodule

*/