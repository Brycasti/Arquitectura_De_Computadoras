`timescale 1ns/1ns

module Adder(

	input [31:0]sum, 
	input [31:0]num,
	
	output reg[31:0]AdderOut

);

assign AdderOut = num + sum;

endmodule
