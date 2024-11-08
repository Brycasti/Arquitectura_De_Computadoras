`timescale 1ns/1ns
module B (
    input [4:0] Direccion,
    input [31:0] Dato,
    input WE,
    output reg [31:0] Q
);    
    reg [31:0] Mem[31:0];  

    always @(*) begin
        Q = Mem[Direccion];
        if (WE) begin
            Mem[Direccion] = Dato; 
        end
    end
endmodule

