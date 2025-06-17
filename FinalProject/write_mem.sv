module write_mem(
    input logic clk,         // Reloj del sistema
    input logic [2:0] btn,        // Botones de entrada (3 bits)
    input logic timeOut,    // Señal de tiempo agotado
    output logic enable,      // Señal de habilitación
    output logic [31:0] addr, // Dirección de memoria (32 bits)
    output logic [31:0] data  // Datos a escribir (32 bits)
);

logic flag = 1; // Bandera para controlar la escritura

always_ff @ (posedge clk) begin
    if (timeOut) begin
        enable <= 1'b1;
        addr   <= 32'd100;
        data   <= 32'd9;
    end
    else begin
        enable <= 1'b0;
        addr   <= 32'd100;
        data   <= 32'd0;
        end
end

endmodule