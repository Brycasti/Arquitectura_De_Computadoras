`timescale 1ns/1ns
module chocorrol (
    input [19:0] instruccion,  
    output [31:0] mem_data1_A,
    output [31:0] mem_data2_A,  
    output [31:0] alu_result,  
    output [31:0] mem_result_B  
);
    wire [4:0] DDL1_A, DDL2_A, DDE_A;     
    wire WWE_A;                            
    wire [31:0] DDatoES_A;                
    wire [4:0] Direccion_B;               
    wire WWE_B;                            
    wire [2:0] SSEL; // Selector para la ALU

    assign DDL1_A = instruccion[18:14];  // Primer operando
    assign DDL2_A = instruccion[13:9];   // Segundo operando
    assign DDE_A = instruccion[8:4];     // Registro destino en memoria A
    assign WWE_A = instruccion[3];       // Se�al de escritura para A
    assign WWE_B = instruccion[19];      // Se�al de escritura para B
    assign SSEL = instruccion[2:0];      // Selecciona la operaci�n de la ALU
    assign Direccion_B = DDE_A;          // Almacenar el resultado en B en la misma direcci�n que DDE_A

    A inst_MemA (
        .DL1(DDL1_A), 
        .DL2(DDL2_A), 
        .DE(DDE_A), 
        .WE(WWE_A), 
        .Dato(DDatoES_A), 
        .Q1(mem_data1_A),
        .Q2(mem_data2_A)
    );

    Alu inst_alu (
        .C1(mem_data1_A), 
        .C2(mem_data2_A), 
        .selector(SSEL), 
        .Res(alu_result) 
    );

    B inst_MemB (
        .Direccion(Direccion_B), 
        .Dato(alu_result), 
        .WE(WWE_B), 
        .Q(mem_result_B)  
    );
endmodule

