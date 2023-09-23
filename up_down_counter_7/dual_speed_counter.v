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

module dual_speed(
input clk,
output reg[7:0] count1,
output reg[7:0] count2
);
  reg [2:0] divider=3'b000;
  always @(posedge clk) begin
    if(count1==8'b1111)begin
      count1<=8'b0;
      end
    else begin
         count1 <= count1 + 1;
         end
     if(count2==8'b1111)begin
      count2<=8'b0;
      end
    else begin
         count2 <= count2 + 1;
         end 
    if (divider == 3'b100) begin
         divider <= 3'b000;
      end else begin
         divider <= divider + 1;
      end 
      end
      endmodule
      
    
  
