`timescale 1ns / 1ps

module MEMWB(
    input clk,
    input [31:0] Read_New,
    input [31:0] Data1,
    input [4:0] W1,
    output reg [31:0] Read_New_1,
    output reg [31:0] Data_New_1,
    output reg [4:0] Write_Reg_Final,
    
    input Reg_Wr2,
    input Mem_To_Reg2,
    output reg Reg_Wr3,
    output reg Mem_To_Reg3
);

always @(posedge clk) begin
    Read_New_1 <= Read_New;
    Data_New_1 <= Data1;
    Write_Reg_Final <= W1;
    
    Reg_Wr3 <= Reg_Wr2;
    Mem_To_Reg3 <= Mem_To_Reg2;
end

endmodule
