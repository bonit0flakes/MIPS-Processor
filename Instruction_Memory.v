`timescale 1ns / 1ps
module Instruction_Memory(
	input [31:0] PC,
	input reset,
	output reg [31:0] Instruction_Code
);

reg [7:0] Mem [35:0];
always @(PC)
begin
    Instruction_Code = {{Mem[PC]},{Mem[PC+1]},{Mem[PC+2]},{Mem[PC+3]}};
end
always @(reset)
begin

	if(reset == 0)
	begin
	    //lw r1,0(r0) 1000 11 00 000 0 0001  0000 0000 0000 0000
	    //8C 01 00 00
        Mem[0] = 8'h8C; Mem[1] = 8'h01; Mem[2] = 8'h00; Mem[3] = 8'h00;
        //lw r2,1(r0) 1000 11 00 000 0 0010  0000 0000 0000 0001
        //8C 02 00 01
        Mem[4] = 8'h8C; Mem[5] = 8'h02; Mem[6] = 8'h00; Mem[7] = 8'h01;
        //mul r1,r1,r2 000000 00001 00010 00001 00000 011000
        //00 22 08 18
        Mem[8] = 8'h00; Mem[9] = 8'h22; Mem[10] = 8'h08; Mem[11] = 8'h18;
        //j L 0000 10 00 00000000000000000000 0010
        // 0000 0000 0000 0000 0000 0000 0000 10  00
        // PC   Offset 2                          left shift by 2
        Mem[12] = 8'h08; Mem[13] = 8'h00; Mem[14] = 8'h00; Mem[15] = 8'h02;
        //mul r2, r1,r2 000000 00001 00010 00010 00000 011000
        //00 22 10 18
        Mem[16] = 8'h00; Mem[17] = 8'h22; Mem[18] = 8'h10; Mem[19] = 8'h18;
        //srl r4, r1, 3 000001 00001 00100   0000 0000 0000 0011
        //00 24 00 03
        Mem[20] = 8'h04; Mem[21] = 8'h24; Mem[22] = 8'h00; Mem[23] = 8'h03;
        //sw r4, 4(r0) 101011 00000 00100   0000 0000 0000 0100
        //AC 04 00 04
        Mem[24] = 8'hAC; Mem[25] = 8'h04; Mem[26] = 8'h00; Mem[27] = 8'h04;
        //amul r1,r2,r3 000111 00011 00001 00010 00000 111111
        //00 61 10 3F
        Mem[28] = 8'h1C; Mem[29] = 8'h61; Mem[30] = 8'h10; Mem[31] = 8'h3F;
        
        Mem[32] = 8'h00; Mem[33] = 8'h00; Mem[34] = 8'h00; Mem[35] = 8'h00;
	end
end
endmodule