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


module up_down_counter(
input clk,
input resetn,
input up_down,
output  reg [2:0] count
);
always @(posedge clk or negedge resetn)begin
if (!resetn)begin
   count<=3'b00;
   end
else begin
 if (up_down)begin
   if (count <=3'b111)begin
      count <= 3'b000;
      end
   else begin
      count <=count+1;
   end
  end
else begin
  if(count <= 3'b000)begin
    count <= 3'b111;
    end
  else begin
    count  <= count-1;
    end
    end
    end
    end
endmodule
