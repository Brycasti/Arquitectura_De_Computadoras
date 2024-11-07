`timescale 1ns/1ns

module PC(

	input [31:0]PCin,
	input clk,

	output reg[31:0]PCout

);

initial
begin

	PCout = 0;

end

always@(posedge clk)
begin

	PCout <= PCin;

end

endmodule
