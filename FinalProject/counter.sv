/**
 * @module counter
 * @brief Contador genérico parametrizable para el procesador y módulos auxiliares.
 *
 * Este módulo implementa un contador ascendente de N bits, utilizado para generar secuencias, temporizaciones
 * o controlar ciclos dentro del procesador ARM simplificado y otros módulos del proyecto.
 * El contador se incrementa en cada flanco negativo de reloj si la señal de habilitación está activa,
 * y se reinicia a cero cuando la señal de reset es activada.
 *
 * Parámetros:
 *   - N: Ancho del contador en bits (por defecto 32).
 *
 * Entradas:
 *   - clk: Señal de reloj.
 *   - rst: Señal de reinicio asíncrono.
 *   - en: Señal de habilitación del conteo.
 *
 * Salidas:
 *   - Q: Valor actual del contador (N bits).
 */
module counter #(parameter N = 32) (input clk, rst, en, 
                                            output [N-1:0] Q);
always_ff @ (negedge clk or posedge rst)
    if (rst) Q = 8'h00;
    else
        if (en) Q = Q + 1'b1;

endmodule