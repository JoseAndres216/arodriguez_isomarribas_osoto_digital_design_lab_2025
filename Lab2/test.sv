// Problema 2: Frencuencia Máxima
module test #(parameter N=16)(
    input logic [N-1:0] a, b,
    input logic selbutton,
    input logic clk,              // Clock signal
    input logic reset, 
    // Señales de salida
    output logic [N-1:0] result,
    output logic [3:0] flags_salida, select
);

    // Internal signals
    logic [N-1:0] reg_A, reg_B, reg_out, alu_result;

    // Registers for inputs A and B
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            reg_A <= {N{1'b0}};
            reg_B <= {N{1'b0}};
            reg_out <= {N{1'b0}};
        end else begin
            reg_A <= a;        // Load input A to reg_A
            reg_B <= b;        // Load input B to reg_B
            reg_out <= alu_result; // Load ALU result to reg_out
        end
    end

    // Instantiate ALU
    alu #(.N(N)) uut (
        .a(a),
        .b(b),
        .selbutton(selbutton),
        .result(result),
        .flags_salida(flags_salida),
        .select(select),
        .seg_a_U(), .seg_a_T(), .seg_b_U(), .seg_b_T(), .seg_r_U(), .seg_r_T()
    );

    // Output result from the final register
    assign out = reg_out;

endmodule