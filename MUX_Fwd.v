`timescale 1ns / 1ps

module MUX_Fwd #(parameter N = 31)(
    input [N:0] A,
    input [N:0] B,
    input sel,
    output reg [N:0] Res
);

always @(A,B,sel) begin
    if(sel == 1) Res = B;
    else Res = A;
end

endmodule

