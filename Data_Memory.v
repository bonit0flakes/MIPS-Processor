`timescale 1ns / 1ps

module Data_Memory(
    input reset,
    input [31:0] A1,
    input [31:0] Data1,
    output reg [31:0] Read_New,
    input Read,
    input Write
);

reg [7:0] Data_Mem[0:35];

always @(A1, Data1)
begin
    if(Read == 1'b1) Read_New = {{Data_Mem[A1]},{Data_Mem[A1+1]},{Data_Mem[A1+2]},{Data_Mem[A1+3]}};
    
    if(Write == 1'b1) begin
        Data_Mem[A1] = Data1[31:24];
        Data_Mem[A1+1] = Data1[23:16];
        Data_Mem[A1+2] = Data1[15:8];
        Data_Mem[A1+3] = Data1[7:0];
    end
end

always @(reset)
begin
    if(reset == 0) begin
        Data_Mem[0] = 8'h96;
        Data_Mem[1] = 8'h96;
        Data_Mem[2] = 8'h96;
        Data_Mem[3] = 8'h96;
        Data_Mem[4] = 8'd2;
        Data_Mem[5] = 8'd0;
        Data_Mem[6] = 8'd0;
        Data_Mem[7] = 8'd0;
    end
end

endmodule
