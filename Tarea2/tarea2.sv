// tarea 2 FSM
module tarea2 (
	input clk, rst, m,
	output [7:0] mCounter, cicles_skipped
);

logic timeOut, error;

	counter errorCountdown(
		.clk(clk),
		.rst(rst),
		.signal(m),
		.timeOut(timeOut)
	);
	
	counter maintenanceCounter(
		.clk(clk),
		.rst(rst),
		.signal(m),
		.count(mCounter)
	);
	
	FSM fsm (
		.clk(clk),
		.rst(rst),
		.m(m),
		.timeOut(timeOut),
		.error(error)
	);


endmodule