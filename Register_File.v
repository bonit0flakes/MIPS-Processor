`timescale 1ns / 1ps
module Register_File(
    input reset,
    input [4:0] Rs,
    input [4:0] Rt,
    output reg [31:0] Read_Data_1,
    output reg [31:0] Read_Data_2,
    input [4:0]Write_Reg,
    input [31:0]Write_Data, 
    input Reg_Write,
    input clk
);
reg [31:0] RegMemory[0:31];


always @(reset)//initially condition was (reset)
begin
if(reset == 0)
begin
    RegMemory[0] = 32'h0; RegMemory[1] = 32'h0; RegMemory[2] = 32'h0; RegMemory[3] = 32'h0;
    RegMemory[4] = 32'h0; RegMemory[5] = 32'h0; RegMemory[6] = 32'h0; RegMemory[7] = 32'h0;
    RegMemory[8] = 32'h0; RegMemory[9] = 32'h0; RegMemory[10] = 32'h0; RegMemory[11] = 32'h0;
    RegMemory[12] = 32'h0; RegMemory[13] = 32'h0; RegMemory[14] = 32'h0; RegMemory[15] = 32'h0;
    RegMemory[16] = 32'h0; RegMemory[17] = 32'h0; RegMemory[18] = 32'h0; RegMemory[19] = 32'h0;
    RegMemory[20] = 32'h0; RegMemory[21] = 32'h0; RegMemory[22] = 32'h0; RegMemory[23] = 32'h0;
    RegMemory[24] = 32'h0; RegMemory[25] = 32'h0; RegMemory[26] = 32'h0; RegMemory[27] = 32'h0;
    RegMemory[28] = 32'h0; RegMemory[29] = 32'h0; RegMemory[30] = 32'h4; RegMemory[31] = 32'h7;
end
RegMemory[30] = 32'h4; RegMemory[31] = 32'h7;
end
always @(posedge clk)
begin
RegMemory[30] = 32'h4; RegMemory[31] = 32'h7;
end 

always @(Rs,Rt,Write_Reg,Write_Data, Reg_Write)
begin
    if(Rs == Write_Reg && Reg_Write == 1) Read_Data_1 = Write_Data;
    else Read_Data_1 = RegMemory[Rs];
    
    if(Rt == Write_Reg && Reg_Write == 1) Read_Data_2 = Write_Data;
    else Read_Data_2 = RegMemory[Rt];
    
    if(Write_Reg != 5'd0 && Reg_Write == 1) RegMemory[Write_Reg] = Write_Data;
end

endmodule
