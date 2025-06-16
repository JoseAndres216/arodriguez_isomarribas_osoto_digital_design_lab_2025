module write_mem(
    input logic [2:0] btn,        // Botones de entrada (3 bits)
    output logic enable,      // Señal de habilitación
    output logic [31:0] addr, // Dirección de memoria (32 bits)
    output logic [31:0] data  // Datos a escribir (32 bits)
);

always @ (btn) begin
    case(btn)
        32'b001: begin
            enable = 1'b1;
            addr = 32'd100;
            data = 32'd7;
        end
        32'b010: begin
            enable = 1'b1;
            addr = 32'd100;
            data = 32'd8;
        end
        32'b100: begin
            enable = 1'b0;
            addr = 32'd100;
            data = 32'd0;
        end
    endcase
end

endmodule