`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2023 08:52:35 PM
// Design Name: 
// Module Name: up_down_counter_tb
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

module tb_up_down_counter;

 
  reg clk = 0;
  reg resetn = 1;
  reg up_down = 1; 
  wire [2:0] count;


  up_down_counter uut (
    .clk(clk),
    .resetn(resetn),
    .up_down(up_down),
    .count(count)
  );

 
  always begin
    #5 clk = ~clk;
  end

  
  initial begin
    resetn = 0; 
    up_down = 1; 
    #10 resetn = 1; 
    #100; 

    up_down = 0;
    #100;
    resetn = 0;
    #10 resetn = 1;
    #100; 

    $finish;
  end

endmodule