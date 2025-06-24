/**
 * @module condlogic
 * @brief Lógica de evaluación de condiciones para el procesador ARM simplificado.
 *
 * Este módulo implementa la lógica de control condicional, permitiendo que las operaciones de escritura en registros,
 * memoria y el salto de programa (PC) solo ocurran si se cumplen las condiciones especificadas por la instrucción.
 * Evalúa los flags de la ALU y las señales de control, y habilita o inhibe las acciones según el resultado de la condición.
 *
 * Entradas:
 *   - clk: Señal de reloj.
 *   - reset: Señal de reinicio.
 *   - Cond: Código de condición de la instrucción.
 *   - ALUFlags: Flags actuales de la ALU (N, Z, C, V).
 *   - FlagW: Señales para habilitar la actualización de flags.
 *   - PCS: Señal para salto condicional del PC.
 *   - RegW: Señal para habilitar escritura en registros.
 *   - MemW: Señal para habilitar escritura en memoria.
 *   - NoWrite: Señal para inhibir escritura en instrucciones especiales.
 *
 * Salidas:
 *   - PCSrc: Habilita el salto condicional del PC.
 *   - RegWrite: Habilita la escritura en registros bajo condición.
 *   - MemWrite: Habilita la escritura en memoria bajo condición.
 *
 * Componentes internos:
 *   - flagreg1, flagreg0: Registros para almacenar los flags de condición.
 *   - condcheck: Evalúa si la condición de la instrucción se cumple.
 */
module condlogic(input logic clk, reset,
						input logic [3:0] Cond,
						input logic [3:0] ALUFlags,
						input logic [1:0] FlagW,
						input logic PCS, RegW, MemW,
						output logic PCSrc, RegWrite, MemWrite,
						input logic NoWrite);
						
	logic [1:0] FlagWrite;
	logic [3:0] Flags;
	logic CondEx;
	
	flopenr #(2)flagreg1(clk, reset, FlagWrite[1], ALUFlags[3:2], Flags[3:2]);
	
	flopenr #(2)flagreg0(clk, reset, FlagWrite[0], ALUFlags[1:0], Flags[1:0]);
	
	// write controls are conditional
	condcheck cc(Cond, Flags, CondEx);
	assign FlagWrite = FlagW & {2{CondEx}};
	assign RegWrite = RegW & CondEx & ~NoWrite;
	assign MemWrite = MemW & CondEx;
	assign PCSrc = PCS & CondEx;
	
endmodule