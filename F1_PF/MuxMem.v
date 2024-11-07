`timescale 1ns/1ns

module MuxMem(

    input [31:0]vL0,
    input [31:0]vL1,
    input slt,
    output reg [31:0]VLout
);

always @*
begin
    case(slt)
        1'b1: VLout = vL1; 
        1'b0: VLout = vL0; 
    endcase
end
endmodule
