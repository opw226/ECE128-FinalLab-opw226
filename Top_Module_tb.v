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
    reg clk, rst;
    reg [3:0] a, b;
    reg [2:0] opp;
    wire [3:0] sseg_a_o;
    wire [6:0] sseg_c_o;
    
    Top_module uut1(.clk(clk), .rst(rst), .a(a), .b(b), .opp(opp), .sseg_a_o(sseg_a_o), .sseg_c_o(sseg_c_o));
    
endmodule
