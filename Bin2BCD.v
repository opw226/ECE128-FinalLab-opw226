module Bin2BCD(
    input clk,
    input en,
    input [7:0] bin_d_in, // Changed input to 8 bits
    output [15:0] bcd_d_out, // Output remains 16 bits for BCD
    output rdy
    );
    
    parameter IDLE = 3'b000;
    parameter SETUP = 3'b001;
    parameter ADD = 3'b010;
    parameter SHIFT = 3'b011;
    parameter DONE = 3'b100;
    
    reg [7:0] bin_data = 0; // Adjusted width
    reg [19:0] bcd_data = 0; // Adjusted to hold 16 bits BCD + extra bits for shifting
    reg [2:0] state = 0;
    reg busy = 0;
    reg [3:0] sh_counter = 0;
    reg [1:0] add_counter = 0;
    reg result_rdy = 0;
    
    always @(posedge clk) begin
        if (en) begin
            if (~busy) begin
                bcd_data <= {12'b0, bin_d_in}; // Adjusted to fit 8-bit input
                state <= SETUP;
            end
        end
        case (state)
            IDLE: begin
                result_rdy <= 0;
                busy <= 0;
            end
            
            SETUP: begin
                busy <= 1;
                state <= ADD;
            end
            
            ADD: begin
                case (add_counter)
                    0: begin
                        if (bcd_data[7:4] > 4) begin
                            bcd_data[19:4] <= bcd_data[19:4] + 3;
                        end
                        add_counter <= add_counter + 1;
                    end
                    1: begin
                        if (bcd_data[11:8] > 4) begin
                            bcd_data[19:8] <= bcd_data[19:8] + 3;
                        end
                        add_counter <= 0;
                        state <= SHIFT;
                    end
                endcase
            end
            
            SHIFT: begin
                sh_counter <= sh_counter + 1;
                bcd_data <= bcd_data << 1;
                
                if (sh_counter == 7) begin // Adjusted to 7 shifts for 8-bit input
                    sh_counter <= 0;
                    state <= DONE;
                end else begin
                    state <= ADD;
                end
            end
            
            DONE: begin
                result_rdy <= 1;
                state <= IDLE;
            end
            
            default: state <= IDLE;
        endcase
    end
    
    assign bcd_d_out = bcd_data[19:4]; // Output adjusted for BCD portion
    assign rdy = result_rdy;
    
endmodule
