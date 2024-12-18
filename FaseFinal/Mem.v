`timescale 1ns/1ns

module Mem(

	input wire[31:0] Datoin,
	input wire[31:0] Dir,
	input wire EnW,
	input wire EnR,

	output reg[31:0]Datoout

);

reg[31:0] Mem[0:31];

always @(*)
begin
	if (EnW)
		Mem[Dir] = Datoin;

	if (EnR)
		Datoout = Mem[Dir];

	else
		Datoout = 0;

end

endmodule
