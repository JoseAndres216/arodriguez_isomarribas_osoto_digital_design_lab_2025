module sustractor_tb;


    parameter N = 4;  // Tamaño 

    // Señales de entrada
    reg [N-1:0] a, b;

    // Señales de salida
    wire [N-1:0] res;
    wire borrow_out, zero_flag, negative_flag;

    // Instanciación
    sustractor #(
        .N(N)
    ) uut (
        .a(a),
        .b(b),
        .res(res),
        .borrow_out(borrow_out),
        .zero_flag(zero_flag),
        .negative_flag(negative_flag)
    );

    // Estímulos
    initial begin
        // Monitoreo de señales
        $monitor("a = %b, b = %b, diff = %b, borrow_out = %b, zero_flag = %b, negative_flag = %b", 
                 a, b, res, borrow_out, zero_flag, negative_flag);

        // Caso 1: 12 - 6
        #10 a = 4'b1100; b = 4'b0110;

        // Caso 2: 5 - 5
        #10 a = 4'b0101; b = 4'b0101;

        // Caso 3: 8 - 12 (resultado negativo)
        #10 a = 4'b1000; b = 4'b1100;

        // Caso 4: 7 - 8 (resultado negativo con borrow)
        #10 a = 4'b0111; b = 4'b1000;

   
    end

endmodule
