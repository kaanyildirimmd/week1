`timescale 1ns / 1ps
module tb_seq;

  reg clk;
  reg rst;
  wire [31:0] seq;

 
  seq seq_inst (
    .clk(clk),
    .rst(rst),
    .seq(seq)
  );


  always begin
    #5 clk = ~clk; 
  end

 
  initial begin
    clk = 0;
    rst = 0;
    
    #150 rst = 1; 
    #25 rst = 0; 
    
    $display("Time\tSequence");
    $monitor("%d\t%d", $time, seq);
    $finish;
  end

endmodule
