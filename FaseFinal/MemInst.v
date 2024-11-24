`timescale 1ns/1ns

module MemInst(

	input [31:0] MemInstIn,
	
	output reg[31:0] MemInsOut

);

initial begin 

    $readmemb("instruccioness.txt",Mem); 
end


reg[31:0] Mem [0:31];

always @*
begin

MemInsOut <= Mem[MemInstIn];

end

endmodule



