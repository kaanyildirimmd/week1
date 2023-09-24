`timescale 1ns / 1ps


module dff_1(
input D,
input clk,
input rst,
output reg  q
    );
    
always @(posedge (clk) , posedge (rst))begin
  if (rst)begin
    q<= 1'b0;
    end else begin
    q<=D;
    end
    end
   
 
endmodule
