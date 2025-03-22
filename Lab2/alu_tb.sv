module alu_tb;

    // Declaramos las señales de entrada y salida
    reg [3:0] a, b;         
    reg [3:0] sel;          
    wire [3:0] result;       

    // Instanciación de la ALU
    alu #(.N(4)) uut (
        .a(a),
        .b(b),
        .sel(sel),
        .result(result)
    );

    initial begin
        // Inicialización
        $display("Iniciando las pruebas de la ALU...");

        a = 4'b0011; b = 4'b0001; sel = 4'b0000;  // Suma
        #10;
        $display("a = %b, b = %b, sel = %b, resultado = %b", a, b, sel, result);

        a = 4'b1111; b = 4'b0001; sel = 4'b0001;  // Resta
        #10;
        $display("a = %b, b = %b, sel = %b, resultado = %b", a, b, sel, result);

        a = 4'b1111; b = 4'b0010; sel = 4'b0010;  // Multiplicación
        #10;
        $display("a = %b, b = %b, sel = %b, resultado = %b", a, b, sel, result);

        a = 4'b1111; b = 4'b1100; sel = 4'b0011;  // MOD
        #10;
        $display("a = %b, b = %b, sel = %b, resultado = %b", a, b, sel, result);


        a = 4'b1010; b = 4'b1111; sel = 4'b0100;  // AND
        #10;
        $display("a = %b, b = %b, sel = %b, resultado = %b", a, b, sel, result);


        a = 4'b1010; b = 4'b1111; sel = 4'b0101;  // OR
        #10;
        $display("a = %b, b = %b, sel = %b, resultado = %b", a, b, sel, result);


        a = 4'b0011; b = 4'b1111; sel = 4'b0110;  // XOR
        #10;
        $display("a = %b, b = %b, sel = %b, resultado = %b", a, b, sel, result);

     
        a = 4'b1001; b = 4'b0000; sel = 4'b0111;  // Shift L
        #10;
        $display("a = %b, b = %b, sel = %b, resultado = %b", a, b, sel, result);

       
    end

endmodule
