/**
 * @module datapath
 * @brief Ruta de datos principal del procesador ARM simplificado.
 *
 * Este módulo implementa la ruta de datos del procesador, integrando el banco de registros, la ALU,
 * la lógica de selección de operandos, la extensión de inmediatos y el cálculo del PC.
 * Recibe señales de control del controlador y ejecuta las operaciones necesarias para cada instrucción,
 * gestionando el flujo de datos entre registros, memoria y la ALU, así como la actualización de los flags de condición.
 *
 * Entradas:
 *   - clk: Señal de reloj.
 *   - reset: Señal de reinicio.
 *   - RegSrc: Selección de fuente de registros.
 *   - RegWrite: Habilita escritura en registros.
 *   - ImmSrc: Selección de fuente de inmediato.
 *   - ALUSrc: Selección de fuente para la ALU.
 *   - ALUControl: Señal de control para la operación de la ALU.
 *   - MemtoReg: Selección de datos a escribir en registros.
 *   - PCSrc: Selección de fuente para el PC (salto condicional).
 *   - Instr: Instrucción actual.
 *   - ReadData: Datos leídos desde la memoria de datos.
 *
 * Salidas:
 *   - flag_N, flag_Z, flag_C, flag_V: Flags de condición de la ALU.
 *   - PC: Contador de programa.
 *   - ALUResult: Resultado de la operación de la ALU.
 *   - WriteData: Datos a escribir en la memoria de datos.
 *
 * Componentes internos:
 *   - Banco de registros, multiplexores, ALU, extensión de inmediatos y lógica de PC.
 */
module datapath(input logic clk, reset,
						input logic [1:0] RegSrc,
						input logic RegWrite,
						input logic [1:0] ImmSrc,
						input logic ALUSrc,
						input logic [3:0] ALUControl,
						input logic MemtoReg,
						input logic PCSrc,
						output logic flag_N, flag_Z, flag_C, flag_V,
						output logic [31:0] PC,
						input logic [31:0] Instr,
						output logic [31:0] ALUResult, WriteData,
						input logic [31:0] ReadData);
						
	logic [31:0] PCNext, PCPlus4, PCPlus8;
	logic [31:0] ExtImm, SrcA, SrcB, Result;
	logic [3:0] RA1, RA2;
	
	// next PC logic
	mux2 #(32) pcmux(PCPlus4, Result, PCSrc, PCNext);
	flopr #(32) pcreg(clk, reset, PCNext, PC);
	adder #(32) pcadd1(PC, 32'b100, PCPlus4);
	adder #(32) pcadd2(PCPlus4, 32'b100, PCPlus8);
	
	// register file logic
	mux2 #(4) ra1mux(Instr[19:16], 4'b1111, RegSrc[0], RA1);
	mux2 #(4) ra2mux(Instr[3:0], Instr[15:12], RegSrc[1], RA2);
	regfile rf(clk, RegWrite, RA1, RA2, Instr[15:12], Result, PCPlus8, SrcA, WriteData);
	mux2 #(32) resmux(ALUResult, ReadData, MemtoReg, Result);
	extend ext(Instr[23:0], ImmSrc, ExtImm);
	
	// ALU logic
	mux2 #(32) srcbmux(WriteData, ExtImm, ALUSrc, SrcB);
	alu #(32) alu(SrcA, SrcB, 1'b0, ALUControl, ALUResult, flag_N, flag_Z, flag_C, flag_V);
	
endmodule