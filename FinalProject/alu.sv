module alu(
    input  logic [31:0] a, b,
    input  logic [1:0]  alucontrol,
    output logic [31:0] result,
    output logic [3:0]  flags // [N, Z, C, V]
);
    logic [31:0] sum, diff;
    logic carry_out_add, carry_out_sub;
    logic overflow_add, overflow_sub;

    // Suma
    assign {carry_out_add, sum} = a + b;
    assign overflow_add = (~a[31] & ~b[31] & sum[31]) | (a[31] & b[31] & ~sum[31]);

    // Resta
    assign {carry_out_sub, diff} = a - b;
    assign overflow_sub = (~a[31] & b[31] & diff[31]) | (a[31] & ~b[31] & ~diff[31]);

    always_comb begin
        case (alucontrol)
            2'b00: begin // AND
                result = a & b;
                flags = {result[31], (result == 0), 1'b0, 1'b0};
            end
            2'b01: begin // OR
                result = a | b;
                flags = {result[31], (result == 0), 1'b0, 1'b0};
            end
            2'b10: begin // ADD
                result = sum;
                flags = {result[31], (result == 0), carry_out_add, overflow_add};
            end
            2'b11: begin // SUB
                result = diff;
                flags = {result[31], (result == 0), carry_out_sub, overflow_sub};
            end
            default: begin
                result = 32'b0;
                flags = 4'b0000;
            end
        endcase
    end
endmodule