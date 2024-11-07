`timescale 1ns/1ns

module MuxUc(

    input [4:0]VaL0,
    input [4:0]VaL1,
    input Str,
    output reg [4:0]WriteReg
);

always @*
    begin
        case(Str)
        1'b1:
            WriteReg = VaL1;
        1'b0:
            WriteReg = VaL0;
        endcase
    end
endmodule
