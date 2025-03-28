module modulo_operation 
    #(
        parameter N = 4  
    )
    (
        input logic [N-1:0] a,   
        input logic [N-1:0] b,   
        
        output logic [N-1:0] result, 
        output logic [3:0] flags      
    );
    

    assign result = (b != 0) ? a % b : 0; 


    assign flags[0] = 0; // % doesnt have negative
    
    assign flags[1] = ~|result; // zero

    assign flags[2] = 0; // there is no carry in %
    

    assign flags[3] = 0; // there is no overflow
    
endmodule