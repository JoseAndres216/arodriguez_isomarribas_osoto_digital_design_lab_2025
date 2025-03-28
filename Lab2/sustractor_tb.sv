module sustractor_tb;

    parameter N = 4; // Tamaño del sustractor

    logic [N-1:0] a, b;  // Entradas
    logic [N-1:0] diff;  // Resultado de la resta
    logic [3:0] flags;   // Flags (CF, ZF, SF, OF)

    // Instancia del módulo sustractor
    sustractor #(N) uut (
        .a(a),
        .b(b),
        .diff(diff),
        .flags(flags)
    );

    // Proceso de prueba
    initial begin
        $display("Tiempo |   a    |   b    |  diff  | CF ZF SF OF ");
        $monitor("%4t   | %b | %b | %b |  %b  %b  %b  %b",
                 $time, a, b, diff, flags[0], flags[1], flags[2], flags[3]);

        // Caso 1: 5 - 3 = 2
        a = 4'b0101; b = 4'b0011;
        #10;
        
        // Caso 2: 8 - 8 = 0 (Debe activar ZF)
        a = 4'b1000; b = 4'b1000;
        #10;

        // Caso 3: 3 - 5 (Debe dar un resultado negativo)
        a = 4'b0011; b = 4'b0101;
        #10;

        // Caso 4: 7 - 9 (Desbordamiento de signo)
        a = 4'b0111; b = 4'b1001;
        #10;

        // Caso 5: 0 - 1 (Préstamo activo)
        a = 4'b0000; b = 4'b0001;
        #10;

        // Fin de la simulación
     
    end
endmodule