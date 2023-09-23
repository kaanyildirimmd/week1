`timescale 1ns / 1ps


module clock_dv;

  reg clk;
  reg [2:0] dvider;
  wire divided_clk;

  
  clock_divider uut (
    .clk(clk),
    .dvider(dvider),
    .divided_clk(divided_clk)
  );

  
  always begin
    #1;
    clk = ~clk; 
    #5;         
  end

  
  initial begin
    clk = 0;
    dvider = 3'b000;
    dvider = 3'b000;
    #200; 

    dvider = 3'b001;
    #200; 
   
    dvider = 3'b010;
    #200; 
   
    $finish;
  end

 endmodule