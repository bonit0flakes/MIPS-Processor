`timescale 1ns / 1ps
module Instruction_Fetch(
	input clk,
	input reset,
	output [31:0] Instruction_Code,
	input Is_Branch,
	input [31:0] PC_Final,
	output reg [31:0] Current_PC,
	input Stall
);
reg [31:0] PC;

Instruction_Memory New_Memory(PC,reset,Instruction_Code);

always @(posedge clk)
begin
    
    if(reset == 1) begin
        if(Stall == 1) begin
        //For Stalling
        Current_PC = PC;
        PC = PC;
        end
        else begin
            //To Jump to New PC Location
            if(Is_Branch == 1) PC = PC_Final;
            else PC = PC + 4;
            
            if(PC > 32'd35) PC = 0;
            
            Current_PC = PC;
        end
    end	
	
end

always @(reset)
    if(reset == 0) begin
    PC = 0;
    Current_PC = 0;
    end
endmodule