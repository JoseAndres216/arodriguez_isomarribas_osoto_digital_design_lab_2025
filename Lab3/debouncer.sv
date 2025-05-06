/**
 * @module debouncer
 * @brief Debounces a noisy input signal using a digital counter.
 *
 * This module synchronizes a noisy input to the system clock and filters
 * out short pulses or glitches by requiring the signal to remain stable
 * for a fixed number of clock cycles before considering it valid.
 *
 * Parameters:
 *  - N: Number of bits for the internal counter, determining debounce duration.
 *
 * Inputs:
 *  - clk: Clock signal.
 *  - rst: Active-high reset signal.
 *  - noisy_in: Noisy input signal (e.g., from a mechanical button).
 *
 * Output:
 *  - clean_out: Debounced and stable version of the input signal.
 */
module debouncer #(
    parameter N = 20
)(
    input  logic clk,
    input  logic rst,
    input  logic noisy_in,
    output logic clean_out
);

    logic [N-1:0] count;
    logic        sync_0, sync_1;
    logic        stable_state;

    always_ff @(posedge clk) begin
        sync_0 <= noisy_in;
        sync_1 <= sync_0;
    end

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            count        <= 0;
            stable_state <= 0;
        end else if (sync_1 != stable_state) begin
            count <= count + 1;
            if (count == {N{1'b1}}) begin
                stable_state <= sync_1;
                count        <= 0;
            end
        end else begin
            count <= 0;
        end
    end

    assign clean_out = stable_state;

endmodule
