module incrementer #(
    parameter int WIDTH = 1,
    parameter logic [WIDTH-1:0] INCREMENT = 1
)(
    input  logic clk,
    input  logic reset,
    input  logic enable,
    output logic [WIDTH-1:0] data_out
);
	 logic [WIDTH-1:0] data_in;
    logic enable_prev;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            data_out     <= '0;
            enable_prev  <= 0;
        end else begin
            enable_prev <= enable;

            if (~enable_prev && enable) begin  // Flanco de subida
                data_out <= data_in + INCREMENT;
            end else begin
                data_out <= data_in;
            end
        end
    end

endmodule
