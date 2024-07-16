`timescale 1ns / 1ps

module MUX #(parameter N = 31)(
    input [N:0] A,
    input [N:0] B,
    input sel,
    output reg [N:0] Res
);

always @(A,B,sel) begin
    if(sel == 0) Res = A;
    else Res = B;
end

endmodule
