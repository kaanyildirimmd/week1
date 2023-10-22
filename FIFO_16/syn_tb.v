`timescale 1ns / 1ps


module testbench;
    reg clk;
    reg wren;
    reg [7:0] din;
    reg rden;
    wire [7:0] dout;
    wire empty;
    wire full;

    
    syn#() dut (
        .clk(clk),
        .wren(wren),
        .din(din),
        .rden(rden),
        .dout(dout),
        .empty(empty),
        .full(full)
    );

    initial begin
        
        
        clk = 0;
        wren = 0;
        din = 8'h00;
        rden = 0;

        wren = 1;
        din = 8'hAA;
        #10; 
        wren = 0;

        
        rden = 1;
        #10; 
        rden = 0;

        
        $finish;
    end

    always #5 clk = ~clk; 
endmodule