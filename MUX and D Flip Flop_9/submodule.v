`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2023 04:49:08 PM
// Design Name: 
// Module Name: submodule
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


module MUX (
  input clk,
  input wire L,
  input R,
  output wire q
);

  reg q_1=1'b0;
  
  always @(posedge clk) begin
    if (L) begin
      q_1 <= R;
    end
    else
    q_1<= q;
    end

  assign q = q_1;

endmodule