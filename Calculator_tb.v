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
    reg[3:0] a, b;
    reg[2:0] opp;
    wire[7:0] result;
    
    calculator uut2(.a(a), .b(b), .op(opp), .result(result));
    
    initial begin
        a = 4'b0001; b = 4'b0001; opp = 3'b000;
        #10;
        //a = 4'b0010; b = 4'b0001; opp = 3'b001;
        #10;
    end
endmodule
