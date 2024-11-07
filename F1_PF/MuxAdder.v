`timescale 1ns/1ns

module MuxAdder(

	input [31:0]VL0,
	input [31:0]VL1,
	input Sel,
	
	output reg [31:0]MuxAdderOut

);

always @*
begin

	case(Sel)
		1'b1:
			MuxAdderOut = VL1;

		1'b0:
			MuxAdderOut = VL0; 
	endcase

end

endmodule
