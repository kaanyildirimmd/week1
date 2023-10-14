`timescale 1ns / 1ps


module singleport_tb;
  reg clk;
  reg wren;
  reg rden;
  reg [9:0] addr;
  reg [15:0] din;
  wire [15:0] dout;

  
  singleport uut (
    .clk(clk),
    .wren(wren),
    .rden(rden),
    .addr(addr),
    .din(din),
    .dout(dout)
  );

  always begin
    #5 clk = ~clk; 
  end

 
  initial begin
    clk = 0;
    wren = 0;
    rden = 0;
    din = 0;
    addr = 0;
    #15;

    wren = 1;
    din = 16'h1234;
    #20;
    wren = 0;
    rden = 1;
    addr = 0;
    #20;

    $finish; 
  end
endmodule
