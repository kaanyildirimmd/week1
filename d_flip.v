`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2023 02:47:22 PM
// Design Name: 
// Module Name: d_flip
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


module d_flip(
  input clk,
  input resetn,
  input [1:0] byteena,
  input [15:0] d,
  output reg [15:0] q
);
 
  
  
  always @(clk,d)
  begin
  if (!resetn) begin
    q <=16'b0;
    end 
    else begin
    if (byteena[0]) begin
    q[7:0] <= d[7:0];
    end
    if (byteena[1]) begin
    q[15:8] <=q[15:8];
    end
    end
    end
    
     
endmodule
