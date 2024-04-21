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
    input [7:0] A,        // Input A (8 bits)
    input [7:0] B,        // Input B (8 bits)
    input [3:0] Sel,  // Control signal (4 bits)
    output reg [7:0] Out, // Output result (8 bits)
    output reg Zero       // Zero flag (1 bit)
);

// Internal signals
reg [7:0] result;

// ALU operation based on control signal
always @* begin
    case (Sel)
        4'b0010: result = A + B;     // ADD operation
        4'b0110: result = A - B;     // SUB operation
        4'b0000: result = A & B;     // AND operation
        4'b0001: result = A | B;     // OR operation
        default: result = 8'b0;      // 
    endcase
end

// Output assignment
always @* begin
    Out = result;
    Zero = (result == 8'b0) ? 1'b1 : 1'b0; // Set Zero flag if result is 0
end

endmodule

