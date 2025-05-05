module uart_tx #(
    parameter CLOCK_FREQ = 50_000_000,
    parameter BAUD_RATE = 9600
)(
    input  logic clk,
    input  logic reset,
    input  logic [7:0] data,
    input  logic send,
    output logic tx,
    output logic ready
);
    // Cálculo del divisor de baudios
    localparam integer CLKS_PER_BIT = CLOCK_FREQ / BAUD_RATE;

    typedef enum logic [2:0] {
        IDLE,
        START_BIT,
        DATA_BITS,
        STOP_BIT,
        CLEANUP
    } state_t;

    state_t state = IDLE;
    logic [12:0] clk_count = 0;
    logic [2:0] bit_index = 0;
    logic [7:0] tx_data;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            tx <= 1;
            clk_count <= 0;
            bit_index <= 0;
            ready <= 1;
        end else begin
            case (state)
                IDLE: begin
                    tx <= 1;
                    ready <= 1;
                    if (send) begin
                        tx_data <= data;
                        state <= START_BIT;
                        clk_count <= 0;
                        ready <= 0;
                    end
                end

                START_BIT: begin
                    tx <= 0; // Start bit
                    if (clk_count < CLKS_PER_BIT - 1)
                        clk_count <= clk_count + 1;
                    else begin
                        clk_count <= 0;
                        state <= DATA_BITS;
                        bit_index <= 0;
                    end
                end

                DATA_BITS: begin
                    tx <= tx_data[bit_index];
                    if (clk_count < CLKS_PER_BIT - 1)
                        clk_count <= clk_count + 1;
                    else begin
                        clk_count <= 0;
                        if (bit_index < 7)
                            bit_index <= bit_index + 1;
                        else
                            state <= STOP_BIT;
                    end
                end

                STOP_BIT: begin
                    tx <= 1; // Stop bit
                    if (clk_count < CLKS_PER_BIT - 1)
                        clk_count <= clk_count + 1;
                    else begin
                        clk_count <= 0;
                        state <= CLEANUP;
                    end
                end

                CLEANUP: begin
                    state <= IDLE;
                    ready <= 1;
                end
            endcase
        end
    end
endmodule
