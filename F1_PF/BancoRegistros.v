`timescale 1ns/1ns

module BancoRegistros(
    	input [4:0] AR1,    
   	input [4:0] AR2,
   	input [4:0] AW,
	input [31:0] DW,
	input EnW,
  	output reg [31:0] DR1,
   	output reg [31:0] DR2
);

reg [31:0] Mem[0:31];

initial
begin
    Mem[0] = 32'd71;
    Mem[1] = 32'd87;
    Mem[2] = 32'd551;
    Mem[3] = 32'd200;
    Mem[4] = 32'd107;
    Mem[5] = 32'd99;
    Mem[6] = 32'd81;
    Mem[7] = 32'd77;
    Mem[8] = 32'd33;
    Mem[9] = 32'd69;
    Mem[10] = 32'd715;
    Mem[11] = 32'd333;
    Mem[12] = 32'd54;

end

always @*
begin
    
    if (EnW)
        Mem[AW] = DW;

    DR1 = Mem[AR1];
    DR2 = Mem[AR2];
end

endmodule


