/**
 * @module controller
 * @brief Unidad de control principal del procesador ARM simplificado.
 *
 * Este módulo recibe la instrucción actual y los flags de la ALU, y genera las señales de control
 * necesarias para coordinar la ejecución de instrucciones en el procesador. 
 * Decodifica la instrucción, determina el tipo de operación, controla el acceso a registros y memoria,
 * y gestiona los saltos condicionales y la actualización de los flags.
 *
 * Entradas:
 *   - clk: Señal de reloj.
 *   - reset: Señal de reinicio.
 *   - Instr: Campo relevante de la instrucción (bits [31:12]).
 *   - ALUFlags: Flags de la ALU (N, Z, C, V).
 *
 * Salidas:
 *   - RegSrc: Selección de fuente de registros.
 *   - RegWrite: Habilita escritura en registros.
 *   - ImmSrc: Selección de fuente de inmediato.
 *   - ALUSrc: Selección de fuente para la ALU.
 *   - ALUControl: Señal de control para la operación de la ALU.
 *   - MemWrite: Habilita escritura en memoria de datos.
 *   - MemtoReg: Selección de datos a escribir en registros.
 *   - PCSrc: Selección de fuente para el PC (salto condicional).
 *
 * Componentes internos:
 *   - decoder: Decodifica la instrucción y genera señales de control básicas.
 *   - condlogic: Evalúa condiciones y controla la habilitación de señales según los flags.
 */
module controller(input logic clk, reset,
						input logic [31:12] Instr,
						input logic [3:0] ALUFlags,
						output logic [1:0] RegSrc,
						output logic RegWrite,
						output logic [1:0] ImmSrc,
						output logic ALUSrc,
						output logic [3:0] ALUControl,
						output logic MemWrite, MemtoReg,
						output logic PCSrc);
						
	logic [1:0] FlagW;
	logic PCS, RegW, MemW, NoWrite;
	
	decoder dec(Instr[27:26], Instr[25:20], Instr[15:12],
					FlagW, PCS, RegW, MemW,
					MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl, NoWrite);
					
	condlogic cl(clk, reset, Instr[31:28], ALUFlags,
						FlagW, PCS, RegW, MemW,
						PCSrc, RegWrite, MemWrite, NoWrite);
					
endmodule