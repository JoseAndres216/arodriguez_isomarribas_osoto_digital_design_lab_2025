module multiplier #(
    parameter int N = 4  // Tamaño de las entradas (por defecto, 4 bits)
) (
    input  logic [N-1:0] A, B,      // Entradas de n bits
    output logic [2*N-1:0] Product  // Salida: Producto de 2*n bits
);

    // Señal interna para el cálculo
    logic [2*N-1:0] PartialProduct;

    always_comb begin
        PartialProduct = 0; // Inicialización
        for (int i = 0; i < N; i++) begin
            if (B[i]) begin
                PartialProduct = PartialProduct + (A << i); // Desplazar y sumar
            end
        end
    end

    assign Product = PartialProduct;

endmodule
