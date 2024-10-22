`timescale 1ns/1ns
module tb_chocorrol;
    reg [19:0] instruccion;  
    wire [31:0] mem_data1_A, mem_data2_A, alu_result, mem_result_B;
    
    // Instanciamos el módulo chocorrol
    chocorrol uut (
        .instruccion(instruccion),
        .mem_data1_A(mem_data1_A),
        .mem_data2_A(mem_data2_A),
        .alu_result(alu_result),
        .mem_result_B(mem_result_B)
    );
    
    initial begin
        // Inicializamos la memoria A con los valores dados
        uut.inst_MemA.Mem[0] = 111;
        uut.inst_MemA.Mem[1] = 2023;
        uut.inst_MemA.Mem[2] = 54;
        uut.inst_MemA.Mem[3] = 900;
        uut.inst_MemA.Mem[4] = 110;
        uut.inst_MemA.Mem[5] = 50;
        uut.inst_MemA.Mem[6] = 10001;
        uut.inst_MemA.Mem[7] = 200;

        // Operaciones de prueba

        // Suma $3 $4 $0 -> Almacena el resultado en B[3] = Mem[4] + Mem[0]
        instruccion = 20'b1_00100_00000_00011_010; 
        #10;

        // Suma $5 $5 $0 -> Almacena el resultado en B[5] = Mem[5] + Mem[0]
        instruccion = 20'b1_00101_00000_00101_010; 
        #10;

        // Suma $8 $2 $7 -> Almacena el resultado en B[8] = Mem[2] + Mem[7]
        instruccion = 20'b1_00010_00111_01000_010;
        #10;

        // Resta $0 $0 $4 -> Almacena el resultado en B[0] = Mem[0] - Mem[4]
        instruccion = 20'b1_00000_00100_00000_101; 
        #10;

        // Menor Q $10 $3 $4 -> Si Mem[3] < Mem[4], guarda 1 en B[10]
        instruccion = 20'b1_00011_00100_01010_111; 
        #10;

        // AND $12 $4 $5 -> Almacena el resultado en B[12] = Mem[4] & Mem[5]
        instruccion = 20'b1_00100_00101_01100_000; 
        #10;

        // Leer $3 -> Lee Mem[3]
        instruccion = 20'b0_00011_00000_00000_010;
        #10;

        $stop;
    end
endmodule

