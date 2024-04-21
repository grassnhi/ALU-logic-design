`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 12:33:25 AM
// Design Name: 
// Module Name: alu_tb
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

module alu_tb;
    // Inputs
    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] Sel;

    // Outputs
    wire [7:0] Out;
    wire Zero;

    // Instantiate the ALU module
    alu uut (
        .A(A),
        .B(B),
        .Sel(Sel),
        .Out(Out),
        .Zero(Zero)
    );

    // Test stimulus
    initial begin
        // Test case 1: ADD operation
        A = 8'b01010101;
        B = 8'b10101010;
        Sel = 4'b0010;
        #10; // Allow some time for the output to stabilize
        $display("Test case 1 - ADD: Result = %b, Zero = %b", Out, Zero);

        // Test case 2: SUB operation
        A = 8'b10101010;
        B = 8'b01010101;
        Sel = 4'b0110;
        #10; // Allow some time for the output to stabilize
        $display("Test case 2 - SUB: Result = %b, Zero = %b", Out, Zero);

        // Test case 3: AND operation
        A = 8'b11001100;
        B = 8'b10101010;
        Sel = 4'b0000;
        #10; // Allow some time for the output to stabilize
        $display("Test case 3 - AND: Result = %b, Zero = %b", Out, Zero);

        // Test case 4: OR operation
        A = 8'b11001100;
        B = 8'b10101010;
        Sel = 4'b0001;
        #10; // Allow some time for the output to stabilize
        $display("Test case 4 - OR: Result = %b, Zero = %b", Out, Zero);

         // Test case 1: ADD operation
        A = 8'b00000000; // All zeros
        B = 8'b00000000; // All zeros
        Sel = 4'b0010; // ADD operation
        #10; // Allow some time for the output to stabilize
        $display("Test case 1 - ADD: Result = %b, Zero = %b", Out, Zero);

        // Test case 2: SUB operation
        A = 8'b11111111; // All ones
        B = 8'b11111111; // All ones
        Sel = 4'b0110; // SUB operation
        #10; // Allow some time for the output to stabilize
        $display("Test case 2 - SUB: Result = %b, Zero = %b", Out, Zero);

        // Test case 3: AND operation
        A = 8'b10101010;
        B = 8'b01010101;
        Sel = 4'b0000; // AND operation
        #10; // Allow some time for the output to stabilize
        $display("Test case 3 - AND: Result = %b, Zero = %b", Out, Zero);

        // Test case 4: OR operation
        A = 8'b00000000;
        B = 8'b00000000;
        Sel = 4'b0001; // OR operation
        #10; // Allow some time for the output to stabilize
        $display("Test case 4 - OR: Result = %b, Zero = %b", Out, Zero);
        
// Test case 1: Control signal is not a valid operation (all bits set to 0)
        A = 8'b10101010;
        B = 8'b01010101;
        Sel = 4'b0000; // Not a valid operation
        #10; // Allow some time for the output to stabilize
        $display("Test case 1: Control signal not valid - Result = %b, Zero = %b", Out, Zero);

        // Test case 2: Control signal is not a valid operation (all bits set to 1)
        A = 8'b10101010;
        B = 8'b01010101;
        Sel = 4'b1111; // Not a valid operation
        #10; // Allow some time for the output to stabilize
        $display("Test case 2: Control signal not valid - Result = %b, Zero = %b", Out, Zero);

        $finish;
    end

endmodule