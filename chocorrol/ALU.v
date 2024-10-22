`timescale 1ns/1ns
module Alu (
    input  [31:0] C1,  
    input  [31:0] C2,    
    input  [2:0] selector,      
    output reg [31:0] Res
);
    always @(*) begin
        case (selector)
            3'b000: Res = C1 & C2; 
            3'b010: Res = C1 + C2; 
            3'b101: Res = C1 - C2; 
            3'b111: Res = (C1 < C2) ? 32'b1 : 32'b0; 
            default: Res = 32'b0;
        endcase
    end
endmodule

