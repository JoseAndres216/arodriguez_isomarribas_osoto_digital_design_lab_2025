module control_mem_b(
    input  logic clk,
    input  logic timeOut,
    input  logic [31:0] ReadDataB,
    output logic MemWriteB,
    output logic [31:0] DataAdrB,
    output logic [31:0] WriteDataB,
    output logic led
);

    // Dirección fija de acceso (siempre dirección 100)
    assign DataAdrB = 32'd100;

    // Registro para detectar flanco de subida de timeOut
    logic timeOut_prev;
    logic timeOut_edge;

    // Detectar flanco de subida de timeOut
    always_ff @(posedge clk) begin
        timeOut_prev <= timeOut;
    end

    assign timeOut_edge = timeOut & ~timeOut_prev;

    // Registro para almacenar la flag de "ya escribí"
    logic write_done;

    // Generación de las señales de escritura (lógica secuencial)
    always_ff @(posedge clk) begin
        if (timeOut_edge && !write_done) begin
            MemWriteB <= 1'b1;
            WriteDataB <= 32'd9;
            write_done <= 1'b1;
        end else begin
            MemWriteB <= 1'b0;
            WriteDataB <= 32'd0;
        end
    end

    // Control del LED (lógica síncrona)
    always_ff @(posedge clk) begin
        if (ReadDataB == 7)
            led <= 1;
        else
            led <= 0;
    end

endmodule