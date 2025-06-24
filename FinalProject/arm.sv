/**
 * @module arm
 * @brief Módulo principal del procesador ARM simplificado.
 *
 * Este módulo integra el controlador y la ruta de datos (datapath) para implementar el ciclo de ejecución
 * de instrucciones de un procesador ARM básico. Se encarga de coordinar el flujo de datos y señales de control
 * entre los diferentes componentes del procesador, permitiendo la ejecución de instrucciones, el manejo de memoria,
 * y la actualización de los flags de condición.
 *
 * Entradas:
 *   - clk: Señal de reloj.
 *   - reset: Señal de reinicio.
 *   - Instr: Instrucción de 32 bits leída desde la memoria de instrucciones.
 *   - ReadData: Datos leídos desde la memoria de datos.
 *
 * Salidas:
 *   - PC: Contador de programa (dirección de la instrucción actual).
 *   - MemWrite: Señal para habilitar escritura en memoria de datos.
 *   - ALUResult: Resultado de la operación de la ALU.
 *   - WriteData: Datos a escribir en la memoria de datos.
 *
 * Componentes internos:
 *   - controller: Decodifica la instrucción y genera señales de control.
 *   - datapath: Ejecuta las operaciones de la ALU, gestiona registros y memoria, y actualiza los flags.
 */
module arm(input logic clk, reset,
				output logic [31:0] PC,
				input logic [31:0] Instr,
				output logic MemWrite,
				output logic [31:0] ALUResult, WriteData,
				input logic [31:0] ReadData);
				
	logic flag_N, flag_Z, flag_C, flag_V;
	logic RegWrite, ALUSrc, MemtoReg, PCSrc;
	logic [1:0] RegSrc, ImmSrc;
	logic [3:0] ALUControl;
	
	controller c(clk, reset, Instr[31:12], {flag_N, flag_Z, flag_C, flag_V},
						RegSrc, RegWrite, ImmSrc,
						ALUSrc, ALUControl,
						MemWrite, MemtoReg, PCSrc);
						
	datapath dp(clk, reset,
					RegSrc, RegWrite, ImmSrc,
					ALUSrc, ALUControl,
					MemtoReg, PCSrc,
					flag_N, flag_Z, flag_C, flag_V, PC, Instr,
					ALUResult, WriteData, ReadData);
endmodule