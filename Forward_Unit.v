`timescale 1ns / 1ps

module Forward_Unit(
    input [4:0] IDE_Rs,
    input [4:0] IDE_Rt,
    input EXMEM_Wr,
    input MEMWB_Wr,
    input [4:0] EXMEM_Rd,
    input [4:0] MEMWB_Rd,
    output reg [1:0] Forward_Rs,
    output reg [1:0] Forward_Rt
);

always @(IDE_Rs, EXMEM_Wr, MEMWB_Wr, EXMEM_Rd, MEMWB_Rd) begin
    if(EXMEM_Wr == 1 && EXMEM_Rd != 5'd0 && EXMEM_Rd == IDE_Rs) Forward_Rs = 2'd1;  
    else if( (MEMWB_Wr == 1 && MEMWB_Rd != 5'd0 && MEMWB_Rd == IDE_Rs) 
    && !(EXMEM_Wr == 1 && EXMEM_Rd != 5'd0 && EXMEM_Rd == IDE_Rs) ) Forward_Rs = 2'd2;
    else Forward_Rs = 2'd0;
    
end

always @(IDE_Rt, EXMEM_Wr, MEMWB_Wr, EXMEM_Rd, MEMWB_Rd) begin
    if(EXMEM_Wr == 1 && EXMEM_Rd != 5'd0 && EXMEM_Rd == IDE_Rt) Forward_Rt = 2'd1;
    else if( (MEMWB_Wr == 1 && MEMWB_Rd != 5'd0 && MEMWB_Rd == IDE_Rt) 
    && !(EXMEM_Wr == 1 && EXMEM_Rd != 5'd0 && EXMEM_Rd == IDE_Rt) ) Forward_Rt = 2'd2;
    else Forward_Rt = 2'd0; 
end

endmodule
