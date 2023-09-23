`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2023 04:07:22 PM
// Design Name: 
// Module Name: tb_DFF
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


module tb_dff;

 
  reg clk;               
  reg resetn;           
  reg [1:0] byteena;    
  reg [15:0] d;          
  wire [15:0] q;         

 
  d_flip_flops uut (
    .clk(clk),
    .resetn(resetn),
    .byteena(byteena),
    .d(d),
    .q(q)
  );

  
  always begin
    #5 clk = ~clk;
  end

  
  initial begin
    clk = 0;        
    resetn = 0;    
    byteena = 2'b00; 
    d = 16'b0000000000000000; 
    #10;
    resetn = 1;     
    #10; 
    byteena = 2'b01; 
    d = 16'b1100110011001100; 
    #10; 
    byteena = 2'b10; 
    d = 16'b0011001100110011; 
    #10; 
    $finish;
  end

 

endmodule