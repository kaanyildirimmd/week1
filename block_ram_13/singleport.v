`timescale 1ns / 1ps

module singleport(
  input clk,
  input wren,
  input rden,
  input [9:0] addr,
  input [15:0] din,
  output [15:0] dout
    );
    //parameter RAM WIDTH = 16
    //parameter RAM DEPTH = 1024
    reg [15:0] ram [1023:0];
    reg [9:0] adr;
    always @(posedge clk)begin
      if(wren)begin
       ram[addr]<=din;
      end
    end
    assign dout=ram[addr];    
endmodule
