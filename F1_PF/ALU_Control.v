`timescale 1ns/1ns

module ALU_Control(
    input [5:0] fct, 
    input [1:0] AC,  
    output reg [3:0] AlU
);

always @*
begin
    case(AC)
        2'b10:  
            case(fct)
                6'b100000: AlU = 4'b0000; // ADD
                6'b100010: AlU = 4'b0001; // SUB
                6'b101010: AlU = 4'b0010; // SLT
                6'b100100: AlU = 4'b0011; // AND
                6'b100101: AlU = 4'b0100; // OR
                6'b100110: AlU = 4'b0101; // XOR
                6'b100111: AlU = 4'b0110; // NOR
		default: AlU = 4'b1111;
            endcase
	default AlU = 4'b1111;
    endcase
end
endmodule


