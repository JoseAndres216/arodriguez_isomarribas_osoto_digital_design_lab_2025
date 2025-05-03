module random_move_gen (
    input  logic clk,
    input  logic rst,
    input  logic gen,             // Señal para generar un nuevo número recibida de la fsm
    output logic [2:0] move       // Movimiento entre 0 y 6
);

    logic [2:0] lfsr;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            lfsr <= 3'b011;       // Semilla inicial - Para modificar la secuencia "random" hay que cambiar este valor
            move <= 3'd0;
        end else if (gen) begin
           
            lfsr <= {lfsr[1] ^ lfsr[0], lfsr[2:1]};
            move <= (lfsr % 7);   // Asegura rango 0–6
        end
    end

endmodule
