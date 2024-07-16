`timescale 1ns / 1ps

module Stall_Unit(
    input IDE_Read,
    input [4:0] IDE_Rt,
    input [4:0] IFD_Rs,
    input [4:0] IFD_Rt,
    output reg Stall
);

always @(IDE_Read, IDE_Rt, IFD_Rs, IFD_Rt) begin
    if(IDE_Read == 1 && (IDE_Rt == IFD_Rs || IDE_Rt == IFD_Rt) ) Stall = 1;
    else Stall = 0;
end

endmodule
