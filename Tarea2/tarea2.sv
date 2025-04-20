// tarea 2 FSM
module tarea2 (
	input clk, rst, m,
	output [7:0] out
);

logic timeOut, sel, inM, rstTimer;
logic [7:0] mCounter, cicles_skipped, muxOutput;

	FSM fsm (
		.clk(clk),
		.rst(rst),
		.m(m),
		.timeOut(timeOut),
		.sel(sel),
		.inM(inM),
		.rstTimer(rstTimer)
	);

	counter errorCountdown(
		.clk(clk),
		.rst( rst | rstTimer ),
		.signal(!inM),
		.count(cicles_skipped)
	);
	
	counter maintenanceCounter(
		.clk(clk),
		.rst(rst),
		.signal(inM),
		.count(mCounter)
	);
	
	comparator errorChecker(
		.A(cicles_skipped),
		.B(8'hC8),
		.equal(timeOut)
	);
	
	mux2to1 muxInstance(
		.A(8'hFF),
		.B(mCounter),
		.sel(sel),
		.C(muxOutput)
	);
	
	register regstr (
		.clk(clk), 
		.rst(rst), 
		.A(muxOutput), 
		.regA(out)
	);
	
	


endmodule