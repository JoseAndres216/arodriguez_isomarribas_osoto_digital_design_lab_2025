module tarea2_tb;

    // Señales de prueba
    logic clk, rst, m;
    logic [7:0] muxOutput;

    // Instancia del DUT (Device Under Test)
    tarea2 dut (
        .clk(clk),
        .rst(rst),
        .m(m),
        .muxOutput(muxOutput)
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

        // Esperar 200 ciclos de reloj con m=0
        #2000;

        // Verificación
        if (muxOutput == 8'hFF) begin
            $display("TEST PASADO: muxOutput = %h después de 200 ciclos sin mantenimiento", muxOutput);
        end else begin
            $display("TEST FALLADO: muxOutput = %h (esperado 8'hFF)", muxOutput);
        end

        $stop;
    end

    // Monitoreo de resultados
    initial begin
        $monitor("Tiempo=%0t | rst=%b | m=%b | muxOutput=%h", 
                 $time, rst, m, muxOutput);
    end

endmodule