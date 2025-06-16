module dmem(
    input  logic        clk,

    // Puerto A - por ejemplo para el procesador
    input  logic        we_a,
    input  logic [31:0] a_a, wd_a,
    output logic [31:0] rd_a,

    // Puerto B - por ejemplo para otro módulo (como la FPGA)
    input  logic        we_b,
    input  logic [31:0] a_b, wd_b,
    output logic [31:0] rd_b
);
    // Memoria de 64 palabras de 32 bits
    logic [31:0] RAM[63:0];

    // Direcciones alineadas a palabra (word-aligned)
    wire [5:0] addr_a = a_a[31:2];
    wire [5:0] addr_b = a_b[31:2];

    // Lectura asíncrona
    assign rd_a = (addr_a < 64) ? RAM[addr_a] : 32'hDEADBEEF;
    assign rd_b = (addr_b < 64) ? RAM[addr_b] : 32'hDEADBEEF;

    // Escritura sincronizada
    always_ff @(posedge clk) begin
        if (we_a && we_b && (addr_a == addr_b)) begin
            // Conflicto: ambos quieren escribir a la misma dirección
            // Se prioriza el puerto A y se muestra advertencia en simulación
            $display("⚠️  Conflicto de escritura en dirección %0d. Se prioriza el puerto A.", addr_a);
            RAM[addr_a] <= wd_a;
        end
        else begin
            if (we_a && addr_a < 64)
                RAM[addr_a] <= wd_a;
            if (we_b && addr_b < 64)
                RAM[addr_b] <= wd_b;
        end
    end

endmodule