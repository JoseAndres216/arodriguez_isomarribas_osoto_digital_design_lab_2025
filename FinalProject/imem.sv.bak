module imem(
    input  logic [31:0] a,
    output logic [31:0] rd
);
    logic [31:0] RAM[63:0];

    initial
        $readmemh("C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/FinalProject/memfile.dat", RAM);
        //$readmemh("memfile.dat", RAM);
        

    assign rd = RAM[a[31:2]]; // word aligned
endmodule