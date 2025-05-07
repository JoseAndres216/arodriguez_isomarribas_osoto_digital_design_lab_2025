module random_move_gen(
    input  logic clk,
    input  logic rst,
    input  logic gen,              // Pulso para generar un nuevo valor
    output logic [2:0] move        // Salida: columna aleatoria (0 a 6)
);

    logic [6:0] lfsr;              // LFSR de 7 bits
    logic feedback;

    // Inicialización y avance del LFSR
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            lfsr <= 7'b0000001;    // Semilla inicial no nula
        end else begin
            feedback = lfsr[6] ^ lfsr[5];  // taps: bits 6 y 5
            lfsr <= {lfsr[5:0], feedback};
        end
    end

    // Mapear a columna válida (0 a 6)
    assign move = lfsr % 7;

endmodule