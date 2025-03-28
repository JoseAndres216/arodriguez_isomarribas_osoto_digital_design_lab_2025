module mux_alu
 #(
    parameter N = 8 
)(
    input [N-1:0] sum, sub, mul, div_res, mod_res, and_res,or_res,xor_res,shift_left, shift_right,
    input [3:0] sel,
    output logic [N-1:0] out 
);
    always @(*) begin
        case (sel)
            4'd0: out = sum;
            4'd1: out = sub;
            4'd2: out = mul;
				4'd3: out = div_res;
            4'd4: out = mod_res;
            4'd5: out = and_res;
            4'd6: out = or_res;
            4'd7: out = xor_res;
            4'd8: out = shift_left;
            4'd9: out = shift_right;
            default: out = {N{1'b0}}; // Valor por defecto
        endcase
    end
endmodule
