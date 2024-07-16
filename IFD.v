`timescale 1ns / 1ps
module IFD(
    input clk,
    input [31:0]Instruction_Code,
    input [31:0]PC,
    output reg [4:0]Rs,
    output reg [4:0]Rt,
    output reg [4:0]Rd,
    output reg [15:0]imm,
    output reg [31:0] PC1, 
    output reg [31:0]I1,
    input Is_Branch   
);

always @(posedge clk)
begin
    Rs = Instruction_Code[25:21];
    Rt = Instruction_Code[20:16];
    Rd = Instruction_Code[15:11];
    imm = Instruction_Code[15:0];
    PC1 = PC;
    //Passing a NOP Instruction
    if(Is_Branch == 1) I1 = 32'd0;
    else I1 = Instruction_Code;
end

endmodule
