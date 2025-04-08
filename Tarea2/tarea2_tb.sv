module tarea2_tb;

    // Señales de prueba
    logic clk, rst, m;
    logic [7:0] mCounter, cicles_skipped;

    // Instancia del DUT (Device Under Test)
    tarea2 dut (
        .clk(clk),
        .rst(rst),
        .m(m),
        .mCounter(mCounter),
        .cicles_skipped(cicles_skipped)
    );

    // Generación de reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Período de 10 unidades de tiempo
    end

    // Bloque de estímulos
    initial begin
        // Inicialización
        rst = 1; m = 0;
        #15 rst = 0; // Desactivar reset después de 15 unidades de tiempo
        
        // Caso 1: Señal `m` activa
        #10 m = 1;
        #20 m = 0;

        // Caso 2: Reset nuevamente
        #10 rst = 1;
        #10 rst = 0;

        // Caso 3: Sin señal activa
        #30 m = 0;

        // Finalizar simulación
        #50 $stop;
    end

    // Monitoreo de resultados
    initial begin
        $monitor("Tiempo=%0t | rst=%b | m=%b | mCounter=%d | cicles_skipped=%d", 
                 $time, rst, m, mCounter, cicles_skipped);
    end

endmodule