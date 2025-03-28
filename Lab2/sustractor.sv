module full_subtractor ( // FUNCIONANDO
    input logic a,        // Minuendo de un solo bit
    input logic b,        // Sustraendo de un solo bit
    input logic bin,      // Bit de préstamo (borrow)
    output logic diff,    // Diferencia de un solo bit
    output logic bout     // Bit de préstamo (borrow) de salida
);
    assign diff = a ^ b ^ bin;     // Diferencia
    assign bout = (~a & (b | bin)) | (b & bin);  // Bit de préstamo
endmodule

module sustractor #( // FUNCIONANDO
    parameter N = 4  
)(
    input logic [N-1:0] a,       
    input logic [N-1:0] b,       
    output logic [N-1:0] diff,   
    output logic [3:0] flags
);

    logic [N:0] borrow;  
    logic [N-1:0] temp_diff;
 
    assign borrow[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < N; i++) begin : subtractor_loop
            full_subtractor fs (
                .a(a[i]),           
                .b(b[i]),         
                .bin(borrow[i]),    
                .diff(temp_diff[i]),    
                .bout(borrow[i+1])  
            );
        end
    endgenerate

    assign flags[0] = borrow[N];  // Si hubo un préstamo, el resultado es negativo
           
    assign flags[1] = (temp_diff == 0);          // Cero
    assign flags[2] = borrow[N];                 // Carry o borrow
    assign flags[3] = (a[N-1] ^ b[N-1]) && (a[N-1] ^ temp_diff[N-1]);  // Desbordamiento

   
    assign diff = flags[0] ? (~temp_diff + 1) : temp_diff;

endmodule