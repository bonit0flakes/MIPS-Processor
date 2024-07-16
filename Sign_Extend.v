`timescale 1ns / 1ps

module Sign_Extend(
    input [15:0] imm,
    output reg [31:0] res
);
always @(imm)
begin
    if(imm[15] == 1'b0) res[31:16] = 16'h0000;
    else res[31:16] = 16'hFFFF;
    
    res[15:0] <= imm;
end
endmodule
