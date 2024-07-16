`timescale 1ns / 1ps

module IDE(
    input clk,
    input [31:0] Read_Data_1,
    input [31:0] Read_Data_2,
    input [31:0] Extended_Offset,
    input [4:0] Rd,
    output reg [31:0] RD1,
    output reg [31:0] RD2,
    output reg [31:0] SE2,
    output reg [4:0] wr1,
    
    input [5:0] ALU_Op,
    input ALU_Src,
    input Reg_Dest,
    input Mem_Wr,
    input Mem_Rd,
    input Reg_Wr,
    input Mem_To_Reg,
    output reg [5:0] ALU_Op1,
    output reg ALU_Src1,
    output reg Reg_Dest1,
    output reg Mem_Wr1,
    output reg Mem_Rd1,
    output reg Reg_Wr1,
    output reg Mem_To_Reg1,
    
    input [4:0]Rs,
    input [4:0]Rt,
    output reg [4:0] Rs1,
    output reg [4:0] Rt1
);

always @(posedge clk)
begin
    //PC_Final <= PC_New;
    RD1 <= Read_Data_1;
    RD2 <= Read_Data_2;
    SE2 <= Extended_Offset;
    wr1 <= Rd;
    
    ALU_Op1 <= ALU_Op;
    ALU_Src1 <= ALU_Src;
    Reg_Dest1 <= Reg_Dest;
    Mem_Wr1 <= Mem_Wr;
    Mem_Rd1 <= Mem_Rd;
    Reg_Wr1 <= Reg_Wr;
    Mem_To_Reg1 <= Mem_To_Reg;
    
    Rs1 <= Rs;
    Rt1 <= Rt;    
end

endmodule
