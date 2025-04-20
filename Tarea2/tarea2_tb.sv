module tarea2_tb;

    // Señales de prueba
    logic clk, rst, m;
    logic [7:0] out;

    // Instancia del DUT (Device Under Test)
    tarea2 dut (
        .clk(clk),
        .rst(rst),
        .m(m),
        .out(out)
    );

    // Generación de reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Período de 10 unidades de tiempo
    end

    // Bloque de estímulos
    initial begin
        // Inicialización
        rst = 1; m = 1;
        #10 rst = 0; // Desactivar reset después de 1 ciclo

        // Esperar 50 ciclos de reloj con m=1
        #500;
		  #10; // tiempo de seguridad para procesar cambios
		  
		  // Verificación
        if (out != 8'hFF) begin
            $display("Test succeeded: mainteinance | out=", out);
        end else begin
            $display("Test failed: expected maintainance | out=", out);
        end
		  
		  rst = 1; m = 0;
        #10 rst = 0; // Desactivar reset después de 1 ciclo

        // Esperar 200 ciclos de reloj con m=0
        #2010;

        // Verificación
        if (out == 8'hFF) begin
            $display("Test succeeded: error triggered | out=8'hFF");
        end else begin
            $display("Test failed: 200 cicles exceeded | out=", out);
        end
		  m=1;
		  #20;
		  m=0;
		  #100;
		  m=1;
		  
        $stop;
    end

    // Monitoreo de resultados
    initial begin
        $monitor("Tiempo=%0t | rst=%b | m=%b | out=%h", 
                 $time, rst, m, out);
    end

endmodule