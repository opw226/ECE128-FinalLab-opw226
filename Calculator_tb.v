`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 02:09:29 PM
// Design Name: 
// Module Name: Calculator_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Calculator_tb();
    reg clk;
    reg[3:0] a, b;
    reg[2:0] opp;
    wire[7:0] result;
    
    calculator uut2(.clk(clk), .a(a), .b(b), .op(opp), .result(result));
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        a = 4'b0010; b = 4'b0010; opp = 3'b001;
        #10;
        a = 4'b0011; b = 4'b1001; opp = 3'b010;
        #10;
        a = 4'b0110; b = 4'b0011; opp = 3'b011;
        #10;
        a = 4'b1010; b = 4'b0101; opp = 3'b100;
        #10;
        a = 4'b0010; b = 4'b1101; opp = 3'b101;
        #10;
        a = 4'b0010; b = 4'b1111; opp = 3'b110;
        #10;
        a = 4'b0110; b = 4'b1111; opp = 3'b111;
        
        
    end
endmodule
