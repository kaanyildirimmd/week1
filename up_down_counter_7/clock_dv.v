`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2023 07:20:22 PM
// Design Name: 
// Module Name: up_down counter
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

module clock_divider(
input clk,
input [2:0] dvider,
output reg divided_clk
);
reg [2:0] count=3'b00;
always @(posedge clk)begin
 if (count== dvider) begin
   count <=3'b000;
   divided_clk <= ~divided_clk;
   end
 else begin
   count <= count + 1;
      end
      end

endmodule
