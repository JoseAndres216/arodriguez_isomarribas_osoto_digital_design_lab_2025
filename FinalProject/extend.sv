/**
 * @module extend
 * @brief Extensión de inmediatos para el procesador ARM simplificado.
 *
 * Este módulo se encarga de extender los campos inmediatos de las instrucciones ARM a 32 bits,
 * según el tipo de instrucción y el formato requerido por la operación. Permite que la ruta de datos
 * utilice correctamente valores inmediatos de diferentes tamaños y signos, facilitando la ejecución
 * de instrucciones de procesamiento de datos, carga/almacenamiento y saltos.
 *
 * Entradas:
 *   - Instr: Campo inmediato de la instrucción (24 bits).
 *   - ImmSrc: Selección del tipo de extensión a aplicar (2 bits).
 *
 * Salidas:
 *   - ExtImm: Valor inmediato extendido a 32 bits.
 */
module extend(input logic [23:0] Instr, 
					input logic [1:0] ImmSrc, 
					output logic [31:0] ExtImm);
					
	always_comb
		case(ImmSrc)
			// 8-bit unsigned immediate
			2'b00: ExtImm = {24'b0, Instr[7:0]};
			
			// 12-bit unsigned immediate
			2'b01: ExtImm = {20'b0, Instr[11:0]};
			
			// 24-bit two's complement shifted branch
			2'b10: ExtImm = {{6{Instr[23]}}, Instr[23:0], 2'b00};
			
			default: ExtImm = 32'bx; // undefined
		endcase
	
endmodule