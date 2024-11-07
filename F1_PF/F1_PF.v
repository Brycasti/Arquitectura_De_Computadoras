`timescale 1ns/1ns

module F1_PF(
    input reloj
);


wire [31:0] PC_out;
wire [31:0] PC_in;

wire [31:0] AdderOut;

wire [31:0] MuxAdderOut;
 
wire [31:0] MemInsOut;


wire RegDst, Branch, MemRead, MemReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] ALUOp;


wire [31:0] ALU_result;
wire Zero;


wire [4:0] WriteReg;


wire [31:0] DR1, DR2;
wire [4:0] AR1, AR2, AW;
wire [31:0] DW;


wire [3:0] ALUop;
wire [5:0] fct;


wire [31:0] sign_extended;


wire [31:0] ALU_input2;


wire [31:0] Mem_Datoout;


PC instPC(
    .PCin(MuxAdderOut),
    .clk(reloj),
    .PCout(PC_out)
);


Adder instAdder(
    .sum(PC_out),
    .num(32'd4), 
    .AdderOut(AdderOut)
);


MuxAdder instMuxAdder(
    .VL0(AdderOut),
    .VL1(ALU_result), 
    .Sel(Branch & Zero), 
    .MuxAdderOut(MuxAdderOut)
);


MemInst instMemIns(
    .MemInstIn(PC_out),
    .MemInsOut(MemInsOut)
);



assign AR1 = MemInsOut[25:21]; 
assign AR2 = MemInsOut[20:16]; 
assign AW = WriteReg; 


MuxUc instMuxUc(
    .VaL0(MemInsOut[20:16]),
    .VaL1(MemInsOut[15:11]), 
    .Str(RegDst),
    .WriteReg(WriteReg)
);


BancoRegistros instBancoRegistros(
    .AR1(AR1),
    .AR2(AR2),
    .AW(AW),
    .DW(MemReg ? Mem_Datoout : ALU_result),
    .EnW(RegWrite),
    .DR1(DR1),
    .DR2(DR2)
);


ALU_Control instALU_Control(
    .fct(MemInsOut[5:0]),
    .AC(ALUOp),
    .AlU(ALUop)
);


MuxMem instMuxMem(
    .vL0(DR2),
    .vL1(sign_extended),
    .slt(ALUSrc),
    .VLout(ALU_input2)
);


ALU insALU(
    .DR1(DR1),
    .DR2(ALU_input2),
    .ALUop(ALUop),
    .ALURes(ALU_result),
    .Zero(Zero)
);


Mem instMem(
    .Datoin(DR2),
    .Dir(ALU_result),
    .EnW(MemWrite),
    .EnR(MemRead),
    .Datoout(Mem_Datoout)
);


UnidadControl instUnidadControl(
    .Instruction(MemInsOut[31:26]),
    .RegDst(RegDst),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemReg(MemReg),
    .ALUOp(ALUOp), 
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
);


assign sign_extended = {{16{MemInsOut[15]}}, MemInsOut[15:0]};

endmodule
