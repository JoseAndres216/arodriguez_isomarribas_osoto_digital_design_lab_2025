module digital_design_lab1_problem3_tb();

    parameter n = 6;
    
    logic reset;
    logic decrease_btn;
    logic [6:0] segUnits, segTens, segSign;

    // Instancia del módulo bajo prueba (UUT)
    digital_design_lab1_problem3 #(.n(n)) uut (
        .reset(reset),
        .decrease_btn(decrease_btn),
        .segUnits(segUnits),
        .segTens(segTens),
        .segSign(segSign)
    );

    // Proceso de prueba
    initial begin
        $display("Inicio del testbench");

        // Caso 1: Reset activado
        reset = 1;
        decrease_btn = 0;
        #10;
        $display("Reset activo -> segUnits = %b, segTens = %b, segSign = %b", segUnits, segTens, segSign);
        reset = 0;
        #10;

        // Caso 2: Disminuir valor varias veces
        repeat (3) begin
            decrease_btn = 1;
            #10;
            decrease_btn = 0;
            #10;
            $display("Decremento -> segUnits = %b, segTens = %b, segSign = %b", segUnits, segTens, segSign);
        end

        // Caso 3: Decrementar hasta valores negativos
        repeat (5) begin
            decrease_btn = 1;
            #10;
            decrease_btn = 0;
            #10;
            $display("Decremento (Negativo?) -> segUnits = %b, segTens = %b, segSign = %b", segUnits, segTens, segSign);
        end

        // Fin del testbench
        $display("Testbench terminado");
        $finish;
    end

endmodule
