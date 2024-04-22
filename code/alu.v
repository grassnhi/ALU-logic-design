`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 12:27:06 AM
// Design Name: 
// Module Name: alu
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

module alu (
    input Clk,             // Clock input
    input [7:0] A,         // Input A (8 bits)
    input [7:0] B,         // Input B (8 bits)
    input [3:0] Sel,       // Control signal (4 bits)
    output reg [7:0] Out,  // Output result (8 bits)
    output reg Zero        // Zero flag (1 bit)
);

// Internal signals
reg [7:0] result;
reg [7:0] prev_result;
reg prev_zero;

// ALU operation based on control signal
always @(posedge Clk) begin
    // Store previous result and zero flag
//    prev_result <= result;
//    prev_zero <= Zero;
    
    // Perform ALU operation based on select signal
    case (Sel)
        4'b0010: result <= A + B;               // ADD operation
        4'b0110: result <= A - B;
        4'b0000: result <= A & B;               // AND operation
        4'b0001: result <= A | B;               // OR operation
        default: begin                          // Default operation for invalid select signals
            result <= prev_result;             // Retain the previous result
            Zero <= prev_zero;                 // Retain the previous zero flag
        end
    endcase
end

// Output assignment
always @(result) begin
    Out = result;
    Zero = (result == 8'b0) ? 1'b1 : 1'b0; // Set Zero flag if result is 0
    prev_result = result;
    prev_zero = Zero;
end

endmodule
