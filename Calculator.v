module calculator(
    input clk,
    input [3:0] a, b,
    input [2:0] op,
    output reg [7:0] result
   // output rdy
);



    always @(op) begin
        case (op)
            3'b000: result = a + b;           // Addition
            3'b001: result = a - b;           // Subtraction
            3'b010: result = a * b;          // Multiplication
            3'b011:
                if (b != 0) begin
                    result = (a / b); 
                end                    // Division
                else begin
                    result = 8'b00000000; 
                end
            3'b100: result = {4'b0000, a & b}; // AND
            3'b101: result = {4'b0000, a | b}; // OR
            3'b110: result = {4'b0000, a ^ b}; // XOR
            3'b111: result = {4'b0000, ~a};    // NOT
            default: result = 8'b00000000;
        endcase
    end
   // assign rdy = 1'b1;
endmodule