`timescale 1ns / 1ps
module ALU(
	input [31:0] A,
	input [31:0] B,
	input [5:0] Control_Line,
	input [15:0] Shift_Amount,
	output reg [31:0] Result,
	output reg Zero
);

always @(A,B,Control_Line)
begin

case(Control_Line)
	6'b000000 : Result = A * B;
	6'b100011 : Result = A + B;
	6'b101011 : Result = A + B;
	6'b000001 : Result = A>>Shift_Amount;
	6'b000111 : Result = A*B+B;
	default: Result = A * B;
endcase

if(Result == 32'b0) Zero = 1;
else Zero = 0;

end
endmodule