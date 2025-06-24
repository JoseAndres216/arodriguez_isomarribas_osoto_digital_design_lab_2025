/**
 * @module timer
 * @brief Countdown timer module that decrements every second based on the system clock.
 *
 * This timer starts from a specified initial time (seconds_target) and decrements 
 * once per second using a clock of frequency CLOCK_FREQ_HZ. The current value of 
 * the countdown (current_seconds) is exposed as an output.
 *
 * @param CLOCK_FREQ_HZ Clock frequency in Hz (default is 50 MHz).
 * @param seconds_target Initial countdown value in seconds.
 *
 * @input clk Clock input.
 * @input rst Synchronous reset. Resets the countdown to seconds_target.
 * @output current_seconds Current countdown value in seconds.
 */
module timer #(
    parameter CLOCK_FREQ_HZ = 50_000_000,   ///< Clock frequency in Hz
    parameter seconds_target = 10           ///< Initial countdown value in seconds
)(
    input  logic clk,  ///< Clock input
    input  logic rst,  ///< Synchronous reset input
    output logic [$clog2(seconds_target+1)-1:0] current_seconds  ///< Output: seconds remaining
);

    /// Cycle counter used to count clock ticks up to 1 second
    logic [$clog2(CLOCK_FREQ_HZ)-1:0] cycle_counter;

    /**
     * @brief Initial block for simulation purposes.
     * 
     * Sets the countdown to the initial value. Note that this block is ignored
     * during synthesis on hardware like FPGAs.
     */
    initial begin
        current_seconds = seconds_target;
    end

    /**
     * @brief Sequential logic to implement the countdown.
     * 
     * - On reset (rst is high), the countdown and cycle counter are reset.
     * - On each clock tick, if not reset and countdown is not zero:
     *   - Increments the cycle counter.
     *   - When it reaches one second worth of cycles, reset the cycle counter and decrement the countdown.
     */
    always_ff @(posedge clk) begin
        if (rst) begin
            cycle_counter     <= 0;
            current_seconds   <= seconds_target;
        end else if (current_seconds > 0) begin
            if (cycle_counter == CLOCK_FREQ_HZ - 1) begin
                cycle_counter   <= 0;
                current_seconds <= current_seconds - 1;
            end else begin
                cycle_counter <= cycle_counter + 1;
            end
        end
    end

endmodule
