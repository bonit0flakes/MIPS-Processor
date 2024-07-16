`timescale 1ns / 1ps

module Shift_Left_2(
    input [31:0] SE1,
    output reg [31:0] SE2
);
always @(SE1) SE2 = SE1 << 2;
endmodule
