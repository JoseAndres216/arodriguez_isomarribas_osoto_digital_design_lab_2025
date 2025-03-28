module alu 	
#(parameter N = 4)
(
	input logic [N-1:0] a,        
	input logic [N-1:0] b,
	input logic selbutton,
	output logic [N-1:0] result,
	output logic [3:0] flags_salida, select, //SELECTOR DE OPERACION
	output logic [6:0] seg_a_U, seg_a_T, seg_b_U, seg_b_T, seg_r_U, seg_r_T
	);
	
	initial begin 
		seg_a_T = 7'b1111000;
		seg_a_U = 7'b1111000;
		seg_b_T = 7'b1111000;
		seg_b_U = 7'b1111000;
		seg_r_T = 7'b1111000;
		seg_r_U = 7'b1111000;
		select = 4'd0;
	end
	//
	wire [N-1:0] resultado_sumador ,resultado_restador,resultado_multiplicador, resultado_divisor, resultado_or, resultado_xor, resultado_and, resultado_modulo, resultado_shift_left, resultado_shift_right;
	wire [3:0] flags_sumador , flags_restador, flags_multiplicador, flags_divisor, flags_or, flags_xor, flags_and, flags_modulo, flags_shift_left, flags_shift_right;	
	wire cout;
	//INSTANCIAS DE LAS OPERACIONES
	
   adder #(.N(N)) 
		sumador (
		
		a, b, 0, resultado_sumador, cout, flags_sumador
		
		);
	
	sustractor #(.N(N)) 
		restador(
		
		a,b,resultado_restador,flags_restador
		
		);
		
	multiplier #(.N(N)) 
		multiplicador (
		
		a, b, resultado_multiplicador, flags_multiplicador
		
		);
		
	div_operation #(.N(N)) 
		operacion_div(
		
		a,b,resultado_divisor,flags_divisor
		
		);
		
   or_operation #(.N(N)) 
		operacion_or(
		
		a,b,resultado_or,flags_or
		
		);
		
   xor_operation #(.N(N)) 
		operacion_xor(
		
		a,b,resultado_xor,flags_xor
		
		);
		
   and_operation #(.N(N)) 
		operacion_and(
		
		a,b,resultado_and,flags_and
		
		);
		
   modulo_operation #(.N(N)) 
		operacion_modulo(
		
		a,b,resultado_modulo,flags_modulo
		
		);
		
	shift_l #(.N(N)) 
		shift_left(
		
		a, b, resultado_shift_left, flags_shift_left
		
		);
		
	shift_r #(.N(N)) 
		shift_right(

		a, b, resultado_shift_right, flags_shift_right

	);

	always_ff @(posedge selbutton) begin
		 if (selbutton) begin
			  if (select == 4'd9) begin
					select <= 4'd0; // Reinicia el contador al llegar a 9
			  end else begin
					select <= select + 4'd1; // Incrementa el contador
			  end
		 end
	end
	
	//INSTANCIAs MUX
    mux_alu #(
        .N(N)  
    ) mux_resultados (
	 
        .sum(resultado_sumador),
		  
        .sub(resultado_restador),
		  
        .mul(resultado_multiplicador),
		  
		  .div_res(resultado_divisor),
		
        .mod_res(resultado_modulo),
		  
        .and_res(resultado_and),
		  
        .or_res(resultado_or),
		  
        .xor_res(resultado_xor),
		  
        .shift_left(resultado_shift_left),
		  
        .shift_right(resultado_shift_right),
		  
        .sel(select),
		  
        .out(result) // Salida de la operación seleccionada
    );
	

	
	mux_alu #(
        .N(N) 
		  
    ) mux_flags (

		  .sum(flags_sumador),
		  
        .sub(flags_restador),
		  
        .mul(flags_multiplicador),
		  
		  .div_res(flags_divisor),
		  
        .mod_res(flags_modulo),
		  
        .and_res(flags_and),
		  
        .or_res(flags_or),
		  
        .xor_res(flags_xor),
		  
        .shift_left(flags_shift_left),
		  
        .shift_right(flags_shift_right),
		  
        .sel(select),

        .out(flags_salida) // Salida flags de la operación seleccionada
		  
    );
	 
	 display_7seg #(
        .N(N) 
    ) display_a (
        .value(a),
        .segU(seg_a_U),
        .segT(seg_a_T)  
    );
	 
	 display_7seg #(
        .N(N) 
    ) display_b(
        .value(b),
        .segU(seg_b_U),
        .segT(seg_b_T)  
    );
	 
	display_7seg #(
			  .N(N) 
		 ) display_r(
			  .value(result),
			  .segU(seg_r_U),
			  .segT(seg_r_T)  
		 );
	 
	
endmodule 