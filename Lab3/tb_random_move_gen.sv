`timescale 1ns / 1ps

module tb_random_move_gen;

    // Señales del DUT
    logic clk;
    logic rst;
    logic gen;
    logic [2:0] move;

    // Instancia del DUT
    random_move_gen dut (
        .clk(clk),
        .rst(rst),
        .gen(gen),
        .move(move)
    );

    // Reloj de 10ns
    always #5 clk = ~clk;

    initial begin
        // Inicialización
        clk = 0;
        rst = 1;
        gen = 0;

        // Reset corto
        #20;
        rst = 0;

        // Espera para inicialización de semilla
        #50;

        $display("Generando movimientos aleatorios:");
        repeat (10) begin
            gen = 1;
            #10;
            gen = 0;
            #20;
            $display("Random Move = %0d", move);
        end

        $display("Testbench finalizado.");
        $stop;
    end

endmodule
