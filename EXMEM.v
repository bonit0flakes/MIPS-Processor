`timescale 1ns / 1ps

module EXMEM(
    input clk,
    input Zero,
    input [31:0] ALU_Result,
    input [31:0] RD_2,
    input [4:0] wr2,
    output reg Z1,
    output reg [31:0] A1,
    output reg [31:0] Data1,
    output reg [4:0] W1,
    
    input Reg_Dest1,
    input Mem_Wr1,
    input Mem_Rd1,
    input Reg_Wr1,
    input Mem_To_Reg1,
    output reg Reg_Dest2,
    output reg Mem_Wr2,
    output reg Mem_Rd2,
    output reg Reg_Wr2,
    output reg Mem_To_Reg2
);

always @(posedge clk)
begin
    //PC_Final <= PC_New;
    Z1 <= Zero;
    A1 <= ALU_Result;
    Data1 <= RD_2;
    W1 <= wr2;
    
    Reg_Dest2 <= Reg_Dest1;
    Mem_Wr2 <= Mem_Wr1;
    Mem_Rd2 <= Mem_Rd1;
    Reg_Wr2 <= Reg_Wr1;
    Mem_To_Reg2 <= Mem_To_Reg1;
end

endmodule
