// Multiplier self-checking testbench main file

module multiplier_tb();
    parameter N = 2;  // Definimos N=2 para probar números de 2 bits

    logic [N-1:0] a, b;   // Entradas
    logic [2*N-1:0] r;    // Salida del multiplicador

    // Instanciamos el módulo multiplier
    multiplier #(N) uut (
        .a(a),
        .b(b),
        .r(r)
    );

    initial begin
        // Probamos varios casos
        a = 2'b00; b = 2'b00; #10;
        $display("Test: a=%b, b=%b -> r=%b", a, b, r); // Esperado: r=0000

        a = 2'b01; b = 2'b10; #10;
        $display("Test: a=%b, b=%b -> r=%b", a, b, r); // Esperado: r=0010 (1x2 = 2)

        a = 2'b10; b = 2'b10; #10;
        $display("Test: a=%b, b=%b -> r=%b", a, b, r); // Esperado: r=0100 (2x2 = 4)

        a = 2'b11; b = 2'b11; #10;
        $display("Test: a=%b, b=%b -> r=%b", a, b, r); // Esperado: r=1001 (3x3 = 9)

        $stop; // Detiene la simulación
    end
endmodule

