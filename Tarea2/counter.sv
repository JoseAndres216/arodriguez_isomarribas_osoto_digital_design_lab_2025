module counter (
	input logic clk, rst, signal,
	output logic timeOut,
	output logic [7:0] count
);

always_ff @(negedge clk or posedge rst) begin
	if (rst)
		count <= 8'h00;
	else if (signal)
		count <= count + 8'h01;
end

assign timeOut = (count >= 8'hC8);

endmodule