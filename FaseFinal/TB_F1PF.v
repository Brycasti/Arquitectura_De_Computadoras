`timescale 1ns/1ns

module TB_F1PF();
reg clk_tb = 1'b0;

always #50 clk_tb = ~clk_tb;

F1_PF F1(
    .reloj(clk_tb)
);

endmodule
