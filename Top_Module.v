module Top_Module(clk, a, b, opp, sseg_a_o, sseg_c_o);
    input clk;
    input [3:0] a, b;
    input [2:0] opp;
    output [3:0] sseg_a_o;
    output [6:0] sseg_c_o;
    
    wire [15:0] bcd_out;
    wire rdy;

    reg[15:0] bcd_i;
    reg[2:0] opp_reg;
    wire[7:0] result;

    calculator uut2(clk, a, b, opp_reg, result);
    bin2BCD uut3(clk, 1, {4'b0,result}, bcd_out, rdy);
    multi_seg_drive uut4(clk, bcd_i, sseg_a_o, sseg_c_o);
    always @(posedge clk)
        begin
            opp_reg <= opp;
            if (rdy)
            begin
                bcd_i<= bcd_out; 
            end
        end
    
    
endmodule