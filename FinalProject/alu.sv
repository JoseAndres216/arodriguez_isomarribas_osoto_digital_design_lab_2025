module alu #(parameter N = 4)(input logic [N-1:0] a, b,
										input logic ci,
										input logic [3:0] selec_alu,
										output logic [N-1:0] result,
										output logic f_N, f_Z, f_C, f_V);

	logic [N-1:0] sum, diff, and_res, or_res;
    logic         carry_sum, carry_diff;
    logic         overflow_sum, overflow_diff;

    // Suma
    assign {carry_sum, sum} = {1'b0, a} + {1'b0, b} + ci;
    assign overflow_sum = (a[N-1] == b[N-1]) && (sum[N-1] != a[N-1]);

    // Resta
    assign {carry_diff, diff} = {1'b0, a} - {1'b0, b} - ci;
    assign overflow_diff = (a[N-1] != b[N-1]) && (diff[N-1] != a[N-1]);

    // AND y OR
    assign and_res = a & b;
    assign or_res  = a | b;

    always_comb begin
        case (selec_alu)
            4'b0000: result = sum;      // Suma
            4'b0001: result = diff;     // Resta
            4'b0010: result = and_res;  // AND
            4'b0011: result = or_res;   // OR
            default: result = {N{1'b0}};
        endcase
    end

    // Flags
    always_comb begin
        // Negativo
        f_N = result[N-1];
        // Zero
        f_Z = (result == {N{1'b0}});
        // Carry y Overflow según operación
        case (selec_alu)
            4'b0000: begin // Suma
                f_C = carry_sum;
                f_V = overflow_sum;
            end
            4'b0001: begin // Resta
                f_C = carry_diff;
                f_V = overflow_diff;
            end
            default: begin
                f_C = 1'b0;
                f_V = 1'b0;
            end
        endcase
    end
	/*
	logic [N-1:0] result_suma, result_resta;			
	logic [N-1:0] result_and, result_or;
	logic co_suma, co_resta;


	sumador_N_bits #(N) sum(a, b, ci, result_suma, co_suma);
	restador_N_bits #(N) rest(a, b,ci,result_resta, co_resta);

	operador_and #(N) op_and (a, b, result_and); 
	operador_or #(N) op_or (a, b, result_or); 

	mux_alu #(N) Mux_Alu (result_suma, result_resta, result_and, result_or, selec_alu, result);

	flag_negativo  flag_N(co_resta, selec_alu, f_N);
	flag_carry  flag_C (co_suma, co_resta, selec_alu, f_C);
	flag_zero #(N) flag_Z (result, f_C, f_Z);
	flag_overflow #(N) flag_V (a, b, result, selec_alu, f_V);
	*/
					
endmodule 