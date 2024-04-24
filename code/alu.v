`timescale 1ns / 1ps

module alu (
    input Clk,             
    input [7:0] A,         
    input [7:0] B,         
    input [3:0] Sel,       
    output reg [7:0] Out,  
    output reg Zero
);

reg [7:0] result;
reg [7:0] prev_result;
reg prev_zero;

always @(posedge Clk) begin
    case (Sel)
        4'b0010: result <= A + B; 
        4'b0110: result <= A - B;
        4'b0000: result <= A & B; 
        4'b0001: result <= A | B;
        default: begin                        
            result <= prev_result;             
            Zero <= prev_zero;                 
        end
    endcase
end

always @(result) begin
    Out = result;
    Zero = (result == 8'b0) ? 1'b1 : 1'b0; 
    prev_zero = Zero;
end

endmodule
