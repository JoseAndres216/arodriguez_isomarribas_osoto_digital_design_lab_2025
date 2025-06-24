// edge_detector.sv
module edge_detector (
    input logic clk,
    input logic rst,
    input logic signal_in,
    output logic rising_edge
);

    logic signal_prev;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            signal_prev <= 0;
        else
            signal_prev <= signal_in;
    end

    assign rising_edge = signal_in & ~signal_prev;

endmodule