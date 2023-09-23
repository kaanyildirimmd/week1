`timescale 1ns / 1ps

module tb_dual_speed;

  reg clk;
  wire [7:0] count1_tb;
  wire [7:0] count2_tb;


  dual_speed uut (
    .clk(clk),
    .count1(count1_tb),
    .count2(count2_tb)
  );

  always begin
    #5 clk = ~clk; 
  end

  initial begin
    clk = 0;
    #10;
    
    $monitor("count1 = %h, count2 = %h", count1_tb, count2_tb);

    #1000;
    
    $finish;
  end

endmodule