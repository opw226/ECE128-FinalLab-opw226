module Top_Module(clk, a, b, en, opp, sseg_a_o, sseg_c_o);
    input clk;
    input [3:0] a, b;
    input en;
    input [2:0] opp;
    output [3:0] sseg_a_o;
    output [6:0] sseg_c_o;
    
    wire [15:0] bcd_out;
    wire rdy;
    wire[11:0] temp = {4'b0000, result};
    reg[15:0] bcd_i;
    
    
    calculator uut1(clk, a, b, opp, result);
    Bin2BCD uut2(clk, en, temp, bcd_out, rdy);
    always @(posedge clk)
    begin
        if (rdy)
        bcd_i<= bcd_out;
        
    end
    multi_seg_drive uut3(clk, bcd_i, sseg_a_o, sseg_c_o);
    
    
endmodule