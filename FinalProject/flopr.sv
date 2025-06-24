/**
 * @module flopr
 * @brief Registro tipo flip-flop con reset asíncrono y ancho parametrizable.
 *
 * Este módulo implementa un registro tipo flip-flop con reset asíncrono y ancho configurable mediante parámetro.
 * Es utilizado en el procesador ARM simplificado para almacenar valores de registros, como el contador de programa (PC),
 * permitiendo la actualización sincronizada con el reloj y el reinicio global del sistema.
 *
 * Parámetros:
 *   - WIDTH: Ancho del registro en bits (por defecto 8).
 *
 * Entradas:
 *   - clk: Señal de reloj.
 *   - reset: Señal de reinicio asíncrono.
 *   - d: Datos de entrada (WIDTH bits).
 *
 * Salidas:
 *   - q: Datos almacenados en el registro (WIDTH bits).
 */
module flopr #(parameter WIDTH = 8)(input logic clk, reset,
												input logic [WIDTH-1:0] d,
												output logic [WIDTH-1:0] q);
												
	always_ff @(posedge clk, posedge reset)
		if (reset) q <= 0;
		else q <= d;
		
endmodule