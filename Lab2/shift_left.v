module shift_l #(parameter N = 4)(
    input logic [N-1:0] a, 
    input logic [N-1:0] b,
    output logic [N-1:0] result,
    output logic [3:0] flags
);

    always_comb begin
        // Operación de desplazamiento a la izquierda
        result = a << b;


		  end

endmodule