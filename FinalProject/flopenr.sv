/**
 * @module flopenr
 * @brief Flip-flop con enable y reset parametrizable.
 *
 * Este módulo implementa un registro tipo flip-flop con enable y reset asíncrono, de ancho parametrizable.
 * Es utilizado en el procesador ARM simplificado para almacenar valores de registros o flags de condición,
 * permitiendo la actualización controlada por la señal de habilitación y el reinicio global del sistema.
 *
 * Parámetros:
 *   - WIDTH: Ancho del registro en bits (por defecto 8).
 *
 * Entradas:
 *   - clk: Señal de reloj.
 *   - reset: Señal de reinicio asíncrono.
 *   - en: Señal de habilitación de escritura.
 *   - d: Datos de entrada (WIDTH bits).
 *
 * Salidas:
 *   - q: Datos almacenados en el registro (WIDTH bits).
 */
module flopenr #(parameter WIDTH = 8)(input logic clk, reset, en,
													input logic [WIDTH-1:0] d,
													output logic [WIDTH-1:0] q);
													
	always_ff @(posedge clk, posedge reset)
		if (reset) q <= 0;
		else if (en) q <= d;
		
endmodule