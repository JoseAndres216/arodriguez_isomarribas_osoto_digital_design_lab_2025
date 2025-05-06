/**
 * @module dec7seg
 * @brief Decimal to 7-segment display decoder.
 *
 * This module takes a binary value and converts it to two 7-segment display outputs:
 * one for the units digit and one for the tens digit.
 *
 * @param N Bit-width of the input value. Defaults to 4.
 *
 * @input value Binary input to be displayed (up to 2 decimal digits).
 * @output segU 7-segment output for the units digit (right digit).
 * @output segT 7-segment output for the tens digit (left digit).
 */
module dec7seg #(
    parameter N = 4  // Bit width of input value
)(
    input logic [N-1:0] value,  // Input value to be decoded
    output logic [6:0] segU,    // Output for units digit (right display)
    output logic [6:0] segT     // Output for tens digit (left display)
);

    // Internal signals for units and tens digits
    logic [3:0] valueUnits;
    logic [3:0] valueTens;

    /**
     * @brief Combinational logic for decoding binary value to 7-segment.
     *
     * The input value is separated into tens and units using division and modulo operations.
     * Each digit is then mapped to a 7-bit pattern for the 7-segment display.
     */
    always @(*) begin
        valueUnits = value % 10;
        valueTens  = value / 10;

        // Decode units digit
        case (valueUnits)
            4'b0000: segU = 7'b1000000; // 0
            4'b0001: segU = 7'b1111001; // 1
            4'b0010: segU = 7'b0100100; // 2
            4'b0011: segU = 7'b0110000; // 3
            4'b0100: segU = 7'b0011001; // 4
            4'b0101: segU = 7'b0010010; // 5
            4'b0110: segU = 7'b0000010; // 6
            4'b0111: segU = 7'b1111000; // 7
            4'b1000: segU = 7'b0000000; // 8
            4'b1001: segU = 7'b0010000; // 9
            default: segU = 7'b1111111; // Off
        endcase

        // Decode tens digit
        case (valueTens)
            4'b0000: segT = 7'b1000000; // 0
            4'b0001: segT = 7'b1111001; // 1
            4'b0010: segT = 7'b0100100; // 2
            4'b0011: segT = 7'b0110000; // 3
            4'b0100: segT = 7'b0011001; // 4
            4'b0101: segT = 7'b0010010; // 5
            4'b0110: segT = 7'b0000010; // 6
            4'b0111: segT = 7'b1111000; // 7
            4'b1000: segT = 7'b0000000; // 8
            4'b1001: segT = 7'b0010000; // 9
            default: segT = 7'b1111111; // Off
        endcase
    end

endmodule
