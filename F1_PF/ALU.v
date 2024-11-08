`timescale 1ns/1ns

module ALU(

	input[31:0]DR1,
	input[31:0]DR2,
	input[3:0]ALUop,

	output reg[31:0]ALURes,
	output reg Zero



);

always@(*)
begin

	case(ALUop)
		4'b0000: ALURes = DR1 + DR2; //ADD(Suma)
		4'b0001: ALURes = DR1 - DR2; //SUB(Resta)
		4'b0010: ALURes = (DR1 < DR2) ? 32'b1 : 32'b0; //SLT
		4'b0011: ALURes = DR1 & DR2; //AND
		4'b0100: ALURes = DR1 | DR2; //OR
		4'b0101: ALURes = DR1 ^ DR2; //XOR
		4'b0110: ALURes = ~(DR1 | DR2); //NOR

		default: ALURes = 0;
	endcase
	
	Zero = (ALURes == 0) ? 1 : 0;
		
			

end


endmodule
