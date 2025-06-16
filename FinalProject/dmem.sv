module dmem(
    input  logic        clk, we,
    input  logic [31:0] a, wd,
    output logic [31:0] rd
);
    logic [31:0] RAM[63:0];

    assign rd = RAM[a[31:2]]; // word aligned

    always_ff @(posedge clk)
        if (we)
            RAM[a[31:2]] <= wd;
endmodule

/**
module dmem(
    input  logic        clk, we,
    input  logic [31:0] a, wd,
    output logic [31:0] rd,

    // Nuevas señales de lectura externa
    input  logic  [5:0] read_addr,
    output logic [31:0] read_data
);
    logic [31:0] RAM[63:0];

    assign rd        = RAM[a[31:2]];      // Acceso normal (CPU)
    assign read_data = RAM[read_addr];    // Acceso externo (monitor/testbench)

    always_ff @(posedge clk)
        if (we)
            RAM[a[31:2]] <= wd;
endmodule

*/