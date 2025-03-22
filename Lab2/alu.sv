module alu 	
#(parameter N = 4)
(
	input logic [N-1:0] a,        
	input logic [N-1:0] b,
	input logic [3:0] sel, flags_salida, //SELECTOR DE OPERACUIB
	output logic [N-1:0] result
	);
	
	//
	wire [N-1:0] resultado_restador, resultado_or, resultado_xor, resultado_and, resultado_modulo;
	wire [3:0] flags_restador, flags_or, flags_xor, flags_and, flags_modulo;

	//INSTANCIAS DE LAS OPERACIONES
	
   sustractor #(.N(N)) 
		restador(
		
		a,b,resultado_restador,flags_restador
		
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
	
	//INSTANCIAs MUX
    mux_alu #(
        .N(N)  
    ) mux_resultados (
	 
			//FALTA AGREGAR
        .sum(z),
		  
        .sub(resultado_restador),
		  
		  //FALTA AGREGAR
        .mul(z),
		
        .mod_res(resultado_modulo),
		  
        .and_res(resultado_and),
		  
        .or_res(resultado_or),
		  
        .xor_res(resultado_xor),
		  
		  //FALTA AGREGAR
        .shift_left(z),
		  //FALTA AGREGAR
        .shift_right(z),
		  
        .sel(sel),
		  
        .out(result) // Salida de la operación seleccionada
    );
	

	
	mux_alu #(
        .N(N) 
		  
    ) mux_flags (
		  //FALTA AGREGAR
        .sum(z),
		  
        .sub(flags_restador),
		  //FALTA AGREGAR
        .mul(z),
		  
        .mod_res(flags_modulo),
		  
        .and_res(flags_and),
		  
        .or_res(flags_or),
		  
        .xor_res(flags_xor),
		  
		  //FALTA AGREGAR
        .shift_left(out_restador),
		  
        .shift_right(out_restador),
		  
        .sel(sel),

        .out(flags_salida) // Salida flags de la operación seleccionada
		  
    );
	
endmodule 