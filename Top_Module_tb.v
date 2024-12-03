`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 02:06:39 PM
// Design Name: 
// Module Name: Top_Module_tb
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


module Top_Module_tb();
    reg clk, en;
    reg [3:0] a, b;
    reg [2:0] opp;
    wire [3:0] sseg_a_o;
    wire [6:0] sseg_c_o;
    
    Top_Module uut1(.clk(clk), .a(a), .b(b), .en(en), .opp(opp), .sseg_a_o(sseg_a_o), .sseg_c_o(sseg_c_o));
    
    initial begin
        clk = 0;
        a = 4'b001; b = 4'b0001; opp = 3'b000;
        #50;
        en = 1'b1;
        forever #10 clk = ~clk;
    end
    
    
    
endmodule
