`timescale 1ns / 1ps

module MUX_2(
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    input [31:0] D,
    input [1:0] sel,
    output reg [31:0]Result    
);

always @(A,B,C,D,sel) begin
    if(sel == 2'd0) Result = A;
    else if(sel == 2'd1) Result = B;
    else if (sel == 2'd2) Result = C;
    else Result = D;
end

endmodule
