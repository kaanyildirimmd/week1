`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2023 12:19:40 PM
// Design Name: 
// Module Name: MUX2
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


module MUX2(
input wire clk,
input wire R,
input wire w,
input wire E,
input wire L,
output wire q
   );
   reg q_2=1'b0;
always @(posedge clk)begin
if (L) begin
  q_2<=R;
  end
else if(E)begin
  q_2<=w;
   end 
 end
assign q=q_2;   
endmodule