`timescale 1ns / 1ps

module dualport_tb;

    reg clk;
    reg wren_a;
    reg rden_a;
    reg rden_b;
    reg [9:0] addr_a;
    reg [9:0] addr_b;
    reg [15:0] din_a;
    wire [15:0] dout_b;
    
    
    dualport #(
        .RAM_WIDTH(16),
        .RAM_DEPTH(1024),
        .LOG_DEPTH(10)
    ) uut (
        .clk(clk),
        .wren_a(wren_a),
        .rden_a(rden_a),
        .rden_b(rden_b),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .din_a(din_a),
        .dout_b(dout_b)
    );

    
    always begin
        #5 clk = ~clk;
    end
    initial begin
        clk = 0;
        wren_a = 0;
        rden_a = 0;
        rden_b = 0;
        addr_a = 0;
        addr_b = 0;
        din_a = 0;
        #5;
        wren_a = 1;
        rden_a = 1;
        addr_a = 5; 
        #10;

        
        wren_a = 1;
        rden_a=0;
        addr_a = 15; 
        din_a = 16'h1111; 
        #10;

        
        rden_a = 1;
        wren_a = 1;
        addr_a = 5; 
        din_a = 16'h1234; 
        #10;

        $finish;
    end
     
endmodule
     