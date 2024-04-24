`timescale 1ns / 1ps

module alu_tb;
    reg Clk;          
    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] Sel;

    wire [7:0] Out;
    wire Zero;

    alu uut (
        .Clk(Clk),
        .A(A),
        .B(B),
        .Sel(Sel),
        .Out(Out),
        .Zero(Zero)
    );

    always #5 Clk = ~Clk; 

    initial begin
        Clk = 0;

        A = 8'b01010101;
        B = 8'b10101010;
        Sel = 4'b0010;
        #10;
        $display("Test case 1 - ADD: Result = %b, Zero = %b", Out, Zero);

        A = 8'b10101010;
        B = 8'b01010101;
        Sel = 4'b0110;
        #10;
        $display("Test case 2 - SUB: Result = %b, Zero = %b", Out, Zero);

        A = 8'b11001100;
        B = 8'b10101010;
        Sel = 4'b0000;
        #10;
        $display("Test case 3 - AND: Result = %b, Zero = %b", Out, Zero);

        A = 8'b11001100;
        B = 8'b10101010;
        Sel = 4'b0001;
        #10;
        $display("Test case 4 - OR: Result = %b, Zero = %b", Out, Zero);

        A = 8'b00000000;
        B = 8'b00000000;
        Sel = 4'b0010; 
        #10;
        $display("Test case 5 - ADD: Result = %b, Zero = %b", Out, Zero);

        A = 8'b11111111;
        B = 8'b11111111;
        Sel = 4'b0110;
        #10;
        $display("Test case 6 - SUB: Result = %b, Zero = %b", Out, Zero);

        A = 8'b10101010;
        B = 8'b01010101;
        Sel = 4'b0000;
        #10;
        $display("Test case 7 - AND: Result = %b, Zero = %b", Out, Zero);

        A = 8'b00000000;
        B = 8'b00000000;
        Sel = 4'b0001;
        #10;
        $display("Test case 8 - OR: Result = %b, Zero = %b", Out, Zero);

        A = 8'b10101010;
        B = 8'b01010101;
        Sel = 4'b1111; 
        #10;
        $display("Test case 9: Control signal not valid - Result = %b, Zero = %b", Out, Zero);

        $finish;
    end

endmodule