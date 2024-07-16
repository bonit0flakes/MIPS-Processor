`timescale 1ns / 1ps

module EXE(
    input [31:0] RD1,
    input [31:0] RD2,
    input [31:0] SE2,
    input [15:0] Shift,
    input [4:0] wr1,
    output wire Zero,
    output wire [31:0] ALU_Result,
    output reg [31:0] RD_2,
    output reg [4:0] wr2,
    input [5:0] ALU_Op,
    input ALU_Src
);

wire [31:0]Temp1;
MUX M2(RD2, SE2, ALU_Src, Temp1);
//Complete ALU
ALU A1(RD1, Temp1, ALU_Op, Shift, ALU_Result, Zero);

always @(RD2) RD_2 = RD2;

always @(wr1) wr2 = wr1;

endmodule
