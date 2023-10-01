`timescale 1ns / 1ps


module mealy_tb;
  reg clk;
  reg rst;
  reg d_in;
  wire d_out;

  mealy uut(
    .clk(clk),
    .rst(rst),
    .d_in(d_in),
    .d_out(d_out)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    #10 rst = 0;
    #10 rst = 1;
    #15 d_in = 0;
    #20 d_in = 1;
    #25 d_in = 0;
    #15 d_in = 1;
    #20 d_in = 1;
    $monitor("Time = %0dns | d_in = %b | d_out = %b", $time, d_in, d_out);
    $finish;
  end

endmodule