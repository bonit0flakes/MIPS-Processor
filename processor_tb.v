`timescale 1ns / 1ps
module processor_tb();

reg clk, reset;

Pipelined_Processor P1(clk, reset);

initial
begin
  clk = 0;
  reset = 0;
  #10;
  reset = 1;
  #10;
  clk = ~clk;
  repeat(36)
    #10 clk = ~clk;
   $finish;
   
end

endmodule
