/**
 * @module comparator
 * @brief Parametrizable equality comparator.
 *
 * Compares two N-bit binary values and sets the output high if they are equal.
 *
 * @param N Bit width of the inputs A and B. Defaults to 8.
 *
 * @input A First input operand.
 * @input B Second input operand.
 * @output equal Output signal that is high when A equals B.
 */
module comparator #(
    parameter N = 8  
)(
    input  logic [N-1:0] A,
    input  logic [N-1:0] B,
    output logic equal
);

    assign equal = (A == B);

endmodule