module alu_tb;
    parameter N = 4;
    
    // Señales de entrada
    logic [N-1:0] a, b;
    logic selbutton;
    
    // Señales de salida
    logic [N-1:0] result;
    logic [3:0] flags_salida, select;
    
    // Instanciar la ALU
    alu #(.N(N)) uut (
        .a(a),
        .b(b),
        .selbutton(selbutton),
        .result(result),
        .flags_salida(flags_salida),
        .select(select),
        .seg_a_U(), .seg_a_T(), .seg_b_U(), .seg_b_T(), .seg_r_U(), .seg_r_T()
    );
    
    // Proceso de testbench
    initial begin
        // Inicializar señales
        a = 4'b0000;
        b = 4'b0000;
        selbutton = 0;
        
        // Aplicar estímulos
		  
		  // adder:
		  #10 a= 4'b0001; b = 4'b0010; #10
		  if(result === 4'b0011 && select === 4'd0 && flags_salida[0] == 0 && flags_salida[1] == 0 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 01 succeeded. %b + %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 01 failed. %b + %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  #10 a= 4'b1111; b = 4'b0001; #10
		  if(result === 4'b0000 && select === 4'd0 && flags_salida[0] == 0 && flags_salida[1] == 1 && flags_salida[2] == 1 && flags_salida[3] == 1) 
		  $display("Test 02 succeeded. %b + %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 02 failed. %b + %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  
		  // subtractor:
		  #10 a = 4'b0011; b = 4'b0101; 
        #10 selbutton = 1; // Operación siguiente
        #10 selbutton = 0;
		  
		  if(result === 4'b0010 && select === 4'd1 && flags_salida[0] == 1 && flags_salida[1] == 0 && flags_salida[2] == 1 && flags_salida[3] == 0) 
		  $display("Test 03 succeeded. %b - %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 03 failed. %b - %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  #10 a= 4'b1000; b = 4'b1000; #10
		  if(result === 4'b0000 && select === 4'd1 && flags_salida[0] == 0 && flags_salida[1] == 1 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 04 succeeded. %b - %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 04 failed. %b - %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  
		  // Multiplier:
		  #10 a = 4'b0000; b = 4'b0000; 
        #10 selbutton = 1; // Operación siguiente
        #10 selbutton = 0;
		  
		  if(result === 4'b0000 && select === 4'd2 && flags_salida[0] == 0 && flags_salida[1] == 1 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 05 succeeded. %b * %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 05 failed. %b * %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  #10 a= 4'b0101; b = 4'b0010; #10
		  if(result === 4'b1010 && select === 4'd2 && flags_salida[0] == 0 && flags_salida[1] == 0 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 06 succeeded. %b * %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 06 failed. %b * %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  // Division:
		  #10 a = 4'b0011; b = 4'b0011; 
        #10 selbutton = 1; // Operación siguiente
        #10 selbutton = 0;
		  
		  if(result === 4'b0001 && select === 4'd3 && flags_salida[0] == 0 && flags_salida[1] == 0 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 07 succeeded. %b / %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 07 failed. %b / %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  #10 a= 4'b0111; b = 4'b0011; #10
		  if(result === 4'b0010 && select === 4'd3 && flags_salida[0] == 0 && flags_salida[1] == 0 && flags_salida[2] == 1 && flags_salida[3] == 0) 
		  $display("Test 08 succeeded. %b / %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 08 failed. %b / %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  // module operation:
		  #10 a = 4'b0011; b = 4'b0011; 
        #10 selbutton = 1; // Operación siguiente
        #10 selbutton = 0;
		  
		  if(result === 4'b0000 && select === 4'd4 && flags_salida[0] == 0 && flags_salida[1] == 1 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 09 succeeded. %b %% %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 09 failed. %b %% %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  #10 a= 4'b0111; b = 4'b0011; #10
		  if(result === 4'b0001 && select === 4'd4 && flags_salida[0] == 0 && flags_salida[1] == 0 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 10 succeeded. %b %% %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 10 failed. %b %% %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  // AND operation:
		  #10 a = 4'b0011; b = 4'b0011; 
        #10 selbutton = 1; // Operación siguiente
        #10 selbutton = 0;
		  
		  if(result === 4'b0011 && select === 4'd5 && flags_salida[0] == 0 && flags_salida[1] == 0 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 11 succeeded. %b & %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 11 failed. %b & %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  #10 a= 4'b1001; b = 4'b0110; #10
		  if(result === 4'b0000 && select === 4'd5 && flags_salida[0] == 0 && flags_salida[1] == 1 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 12 succeeded. %b & %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 12 failed. %b & %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  // OR operation:
		  #10 a = 4'b1100; b = 4'b0011; 
        #10 selbutton = 1; // Operación siguiente
        #10 selbutton = 0;
		  
		  if(result === 4'b1111 && select === 4'd6 && flags_salida[0] == 0 && flags_salida[1] == 0 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 13 succeeded. %b | %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 13 failed. %b | %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  #10 a= 4'b0000; b = 4'b0000; #10
		  if(result === 4'b0000 && select === 4'd6 && flags_salida[0] == 0 && flags_salida[1] == 1 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 14 succeeded. %b | %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 14 failed. %b | %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  // XOR operation:
		  #10 a = 4'b1100; b = 4'b0011; 
        #10 selbutton = 1; // Operación siguiente
        #10 selbutton = 0;
		  
		  if(result === 4'b1111 && select === 4'd7 && flags_salida[0] == 0 && flags_salida[1] == 0 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 15 succeeded. %b ^ %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 15 failed. %b ^ %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  #10 a= 4'b0100; b = 4'b0101; #10
		  if(result === 4'b0001 && select === 4'd7 && flags_salida[0] == 0 && flags_salida[1] == 0 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 16 succeeded. %b ^ %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 16 failed. %b ^ %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  // << shift left operation:
		  #10 a = 4'b1000; b = 4'b0001; 
        #10 selbutton = 1; // Operación siguiente
        #10 selbutton = 0;
		  
		  if(result === 4'b0000 && select === 4'd8 && flags_salida[0] == 0 && flags_salida[1] == 1 && flags_salida[2] == 1 && flags_salida[3] == 0) 
		  $display("Test 17 succeeded. %b << %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 17 failed. %b << %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  #10 a= 4'b0010; b =  4'b0001; #10
		  if(result === 4'b0100 && select === 4'd8 && flags_salida[0] == 0 && flags_salida[1] == 0 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 18 succeeded. %b << %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 18 failed. %b << %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  // >> shift right operation:
		  #10 a = 4'b1010; b = 4'b0001; 
        #10 selbutton = 1; // Operación siguiente
        #10 selbutton = 0;
		  
		  if(result === 4'b0101 && select === 4'd9 && flags_salida[0] == 0 && flags_salida[1] == 0 && flags_salida[2] == 0 && flags_salida[3] == 0) 
		  $display("Test 19 succeeded. %b >> %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 19 failed. %b >> %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  
		  #10 a= 4'b0110; b =  4'b0101; #10
		  if(result === 4'b0000 && select === 4'd9 && flags_salida[0] == 0 && flags_salida[1] == 1 && flags_salida[2] == 0 && flags_salida[3] == 1) 
		  $display("Test 20 succeeded. %b >> %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
		  else  $display("Test 20 failed. %b >> %b = %b, N=%b,Z=%b,C=%b,V=%b",a,b,result,flags_salida[0],flags_salida[1],flags_salida[2],flags_salida[3]);
  
        
        #50 $stop; // Detener simulación
    end
	 
    /*
    // Monitor para ver resultados en la consola
    initial begin
        $monitor("Tiempo=%0t | a=%b | b=%b | select=%d | result=%b | flags=%b", $time, a, b, select, result, flags_salida);
    end
	*/
endmodule