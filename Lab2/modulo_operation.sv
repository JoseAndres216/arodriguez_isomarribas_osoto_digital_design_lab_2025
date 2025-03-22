module modulo_operation 
    #(
        parameter N = 8  
    )
    (
        input logic [N-1:0] a,   
        input logic [N-1:0] b,   
        
        output logic [N-1:0] result, 
        output logic [3:0] flags      
    );
    

    assign result = (b != 0) ? a % b : 0; 


    assign flags[0] = (result == 0);
    
    assign flags[1] = 0;

    assign flags[2] = 0;
    

    assign flags[3] = 0;
    
endmodule