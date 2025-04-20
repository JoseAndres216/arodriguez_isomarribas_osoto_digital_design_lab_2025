module FSM (
	input logic clk, rst, m, timeOut,
	output logic sel, inM, rstTimer
);


logic [1:0] state, next_state;


//logica de estado actual
always_ff @ (posedge clk or posedge rst)
	if (rst) 
		state = 2'b00;
	else
		state = next_state;

//logica del siguiente estado
always_comb
	case(state)
		2'b00: if(m) next_state = 2'b01; else next_state = 2'b10;
		2'b01: next_state = 2'b00; // actualizar contador de mantenimientos y volver a estado incial
		2'b10: if(timeOut) next_state = 2'b11; else next_state = 2'b00; // decide siguiente estado segun contador
		2'b11: next_state = 2'b11; // debe escribir error y enciclarse hasta que haya reset
		default: next_state = 2'b00;
	endcase

assign sel = (state == 2'b11); // si es positivo indica que hay un sel, sino indica mostrar el numero de mantenimientos
assign inM = (state == 2'b01);
assign rstTimer = (state == 2'b01);
	
endmodule