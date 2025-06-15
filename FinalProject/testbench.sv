
module testbench();
    logic clk;
    logic reset;
    logic [31:0] WriteData, DataAdr;
    logic MemWrite;

    // instantiate device to be tested
    top dut(clk, reset, WriteData, DataAdr, MemWrite);

    // initialize test
    initial begin
        $display("Inicio de Testbench");
        reset <= 1;
        #22;
        reset <= 0;
    end

    // generate clock to sequence tests
    always begin
        clk <= 1;
        #5;
        clk <= 0;
        #5;
    end

    // check that 7 gets written to address 0x64 at end of program
    always @(negedge clk) begin
        //$display("MemWrite=%b, DataAdr=%h, WriteData=%d, reset=%b, clk=%b", MemWrite, DataAdr, WriteData, reset, clk);
        if (MemWrite) begin
            $display("checking write data");
            if (DataAdr === 100 && WriteData === 7) begin
                $display("Simulation succeeded");
                $stop;
            end else if (DataAdr !== 96) begin
                $display("Simulation failed");
                $stop;
            end
        end
    end

 
endmodule