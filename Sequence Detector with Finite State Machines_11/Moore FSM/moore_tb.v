`timescale 1ns / 1ps

module moore_tb;
  reg d_in;
  reg rst; 
  reg clk;
  wire d_out;
  
  moore uut(
    .d_in(d_in),
    .rst(rst),
    .clk(clk),
    .d_out(d_out)
  );
  
  always begin
    #5 clk = ~clk; 
  end

  initial begin
    clk = 0;
    rst = 1; 
    d_in = 0;

    #10 rst = 0; 
    #20 d_in = 1;
    #20 d_in = 0;
    #20 d_in = 1;
    #20 d_in = 1;
    #20 d_in = 0;
    #20 $finish;
  end
endmodule
    
  
  


