`timescale 1ns/1ns
module UnidadControl(
    input [5:0] Instruction,
    output reg RegDst,
    output reg Branch,
    output reg MemRead,
    output reg MemReg,
    output reg [1:0] ALUOp,  
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
);

always @(Instruction)
begin
    if (Instruction == 6'b000000) 
    begin
        RegDst <= 1;
        Branch <= 0;
        MemRead <= 0;
        MemReg <= 0;
        ALUOp <= 2'b10;  
        MemWrite <= 0;
        ALUSrc <= 0;
        RegWrite <= 1;
    end
end
endmodule


