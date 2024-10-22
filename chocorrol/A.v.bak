`timescale 1ns/1ns
module A(
    input [4:0] DL1,
    input [4:0] DL2,
    input [4:0] DE,
    input [31:0] Dato,  
    input WE,
    output reg [31:0] Q1,
    output reg [31:0] Q2
);
    reg [31:0] Mem[31:0];

    initial begin
        $readmemh("Codigo_ASM.txt", Mem);
    end

    always @(*) begin
        Q1 = Mem[DL1];
        Q2 = Mem[DL2]; 
        if (WE) begin
            Mem[DE] = Dato;
        end
    end
endmodule
