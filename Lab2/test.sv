// Problema 2: Frencuencia Máxima
module test #(parameter Nbit=32)(
    input logic clk,              // Clock signal
    input logic reset,            // Reset signal
    input logic [Nbit-1:0] A, B,  // Operand A and B
    input logic [3:0] OperationIn,// Operation code // Agregar este Select a un registro
    output logic [Nbit-1:0] out,  // Output data
    output logic N, Z, C, V       // Flags
);

    // Internal signals
    logic [Nbit-1:0] reg_A, reg_B, reg_out, alu_result, reg_operation;
  // Instantiate ALU
    alu #(.N(Nbit)) ALU_inst (
        .a(reg_A),               // Use reg_A as operand A
        .b(reg_B),               // Use reg_B as operand B
        .selbutton(reg_operation),
        .result(alu_result)                
    );
    // Registers for inputs A and B
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            reg_A <= {Nbit{1'b1}};
            reg_B <= {Nbit{1'b1}};
            reg_out <= {Nbit{1'b0}};
				reg_operation <= {Nbit{4'b0000}};
        end else begin
            reg_A <= A;        // Load input A to reg_A
            reg_B <= B;        // Load input B to reg_B
            reg_out <= alu_result; // Load ALU result to reg_out
				reg_operation <= OperationIn;
        end
    end

  

    // Output result from the final register
    assign out = reg_out;

endmodule