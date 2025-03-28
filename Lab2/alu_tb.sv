module alu_tb;
    parameter N = 4;
    
    // Señales de entrada
    logic [N-1:0] a, b;
    logic selbutton;
    
    // Señales de salida
    logic [N-1:0] result;
    logic [3:0] flags_salida, select;
    
    // Instanciar la ALU
    alu #(.N(N)) uut (
        .a(a),
        .b(b),
        .selbutton(selbutton),
        .result(result),
        .flags_salida(flags_salida),
        .select(select),
        .seg_a_U(), .seg_a_T(), .seg_b_U(), .seg_b_T(), .seg_r_U(), .seg_r_T()
    );
    
    // Proceso de testbench
    initial begin
        // Inicializar señales
        a = 4'b0000;
        b = 4'b0000;
        selbutton = 0;
        
        // Aplicar estímulos
        #10 a = 4'b0011; b = 4'b0001; // Suma esperada: 4
        #10 selbutton = 1; // Cambia operación
        #10 selbutton = 0;
        
        #10 a = 4'b0101; b = 4'b0011; // Operación siguiente
        #10 selbutton = 1;
        #10 selbutton = 0;
        
        #10 a = 4'b0110; b = 4'b0010; // Otra operación
        #10 selbutton = 1;
        #10 selbutton = 0;
        
        #10 a = 4'b1111; b = 4'b0001; // Caso límite
        #10 selbutton = 1;
        #10 selbutton = 0;
        
        #50 $stop; // Detener simulación
    end
    
    // Monitor para ver resultados en la consola
    initial begin
        $monitor("Tiempo=%0t | a=%b | b=%b | select=%d | result=%b | flags=%b", $time, a, b, select, result, flags_salida);
    end

endmodule