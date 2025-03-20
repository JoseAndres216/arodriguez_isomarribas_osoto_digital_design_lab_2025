//Full substractor
module full_subtractor ( 
    input logic a,        // Entrada A
    input logic b,        // Entrada B
	 
    input logic bin,      // Borrow de entrada
	 
    output logic res,     // Resultado
    output logic bout     // Borrow de salida
);
    assign res = a ^ b ^ bin;     // Diferencia
    assign bout = (~a & (b | bin)) | (b & bin);  //Borrow
endmodule

//Substractor de N bits
module sustractor #( // 
    parameter N = 4  // Tamaño
)(
    input logic [N-1:0] a,        // Entrada A
    input logic [N-1:0] b,        // Entrada B
	 
    output logic [N-1:0] res,     // Resultado
	 
	 //FLAGS -- Falta desbordamiento
	 
    output logic borrow_out,      // Borrow de salida o Flag de ACARREO
	 
    output logic zero_flag,       // Flag de cero
    output logic negative_flag    // Flag negativo
);

    logic [N:0] borrow;  
    assign borrow[0] = 1'b0;

    // Instanciación de substractor según el N
    genvar i;
    generate
        for (i = 0; i < N; i++) begin : subtractor_loop
            full_subtractor fs (
                .a(a[i]),           
                .b(b[i]),           
                .bin(borrow[i]),    
                .res(res[i]),     
                .bout(borrow[i+1])
            );
        end
    endgenerate

    // Borrow/Acarreo
    assign borrow_out = borrow[N];

    // Flag de cero: 
    assign zero_flag = (res == 0);

    // Flag negativo: Si el bit más significativo de la diferencia es 1
    assign negative_flag = res[N-1];

endmodule
