/**
 * @module columnSelector
 * @brief Circular column selector controlled by a button press.
 *
 * This module increments a column selection value each time a rising edge
 * is detected on a debounced button input. The selection wraps around to 0 
 * when it reaches the maximum value (hardcoded to 6 for a 7-column game Connect 4).
 *
 * Parameters:
 *  - N: Number of bits for the column selector output (default: 3).
 *
 * Inputs:
 *  - clk: Clock signal.
 *  - rst: Synchronous reset signal.
 *  - button: Debounced button input.
 *
 * Output:
 *  - selectColumn: Current column index, increments on each button press.
 */
module columnSelector #(
    parameter N = 3  
)(
    input  logic clk,
    input  logic rst,
    input  logic button,            
    output logic [N-1:0] selectColumn  
);

    logic button_prev;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            selectColumn <= 0;
            button_prev  <= 0;
        end else begin
            button_prev <= button;
            if (~button_prev && button) begin
                if (selectColumn == 6)
                    selectColumn <= 0; 
                else
                    selectColumn <= selectColumn + 1;
            end
        end
    end

endmodule
