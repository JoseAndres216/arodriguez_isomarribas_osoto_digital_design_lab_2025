/*
 The MIT License (MIT)

 Copyright (c) 2019 Yuya Kudo.

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
*/


module uart_rx #(
    parameter CLOCK_FREQ = 50_000_000,
    parameter BAUD_RATE = 9600
)(
    input  logic clk,
    input  logic reset,
    input  logic rx,
    output logic [7:0] data,
    output logic ready
);

    localparam integer CLKS_PER_BIT = CLOCK_FREQ / BAUD_RATE;
    localparam integer MID_SAMPLE = CLKS_PER_BIT / 2;

    typedef enum logic [2:0] {
        IDLE,
        START_BIT,
        DATA_BITS,
        STOP_BIT,
        DONE
    } state_t;

    state_t state = IDLE;
    logic [$clog2(CLKS_PER_BIT)-1:0] clk_count = 0;
    logic [2:0] bit_index = 0;
    logic [7:0] rx_data = 0;
    logic rx_sync = 1;

    // sincronización simple para rx
    always_ff @(posedge clk) begin
        rx_sync <= rx;
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            clk_count <= 0;
            bit_index <= 0;
            data <= 0;
            ready <= 0;
        end else begin
            ready <= 0;

            case (state)
                IDLE: begin
                    if (rx_sync == 0) begin // start bit detectado
                        state <= START_BIT;
                        clk_count <= 0;
                    end
                end

                START_BIT: begin
                    if (clk_count == MID_SAMPLE) begin
                        clk_count <= 0;
                        state <= DATA_BITS;
                        bit_index <= 0;
                    end else begin
                        clk_count <= clk_count + 1;
                    end
                end

                DATA_BITS: begin
                    if (clk_count == CLKS_PER_BIT - 1) begin
                        clk_count <= 0;
                        rx_data[bit_index] <= rx_sync;

                        if (bit_index == 7) begin
                            state <= STOP_BIT;
                        end else begin
                            bit_index <= bit_index + 1;
                        end
                    end else begin
                        clk_count <= clk_count + 1;
                    end
                end

                STOP_BIT: begin
                    if (clk_count == CLKS_PER_BIT - 1) begin
                        clk_count <= 0;
                        state <= DONE;
                    end else begin
                        clk_count <= clk_count + 1;
                    end
                end

                DONE: begin
                    data <= rx_data;
                    ready <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
