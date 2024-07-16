`timescale 1ns / 1ps

module Control_Unit(
    
    input [31:0] Instruction_Code,
    output reg [5:0] ALU_Op,
    output reg ALU_Src,
    output reg Reg_Dest,
    output reg Is_Branch,
    output reg Mem_Wr,
    output reg Mem_Rd,
    output reg Reg_Wr,
    output reg Mem_To_Reg
);

always @(Instruction_Code) begin
    if(Instruction_Code == 32'd0) begin
        ALU_Op = 0;
        Reg_Dest = 0;
        Is_Branch = 0;
        Mem_Wr = 0;
        Mem_Rd = 0;
        Reg_Wr = 0;
        Mem_To_Reg = 0;
    end
    
    else begin
    
    ALU_Op = Instruction_Code[31:26];
    
    if(Instruction_Code[31:26] == 6'd0) begin
        ALU_Src = 0;//Immediate data is not used
        Reg_Dest = 1;//Rd 
    end
    else begin
        ALU_Src = 1;//Immediate data
        Reg_Dest = 0;//Rt
    end
    
    if(Instruction_Code[31:26] == 6'b000010) Is_Branch = 1;
    else Is_Branch = 0;
    
    if(Instruction_Code[31:26] == 6'b101011) Mem_Wr = 1;
    else Mem_Wr = 0;
    
    if(Instruction_Code[31:26] == 6'b100011) Mem_Rd = 1;
    else Mem_Rd = 0;
    
    if(Instruction_Code[31:26] == 6'b100011 || Instruction_Code[31:26] == 6'b0 || Instruction_Code[31:26] == 6'b1)
        Reg_Wr = 1;
    else Reg_Wr = 0;
    
    if(Instruction_Code[31:26] == 6'b100011) Mem_To_Reg = 1;
    else Mem_To_Reg = 0;
    
    end
end

endmodule
