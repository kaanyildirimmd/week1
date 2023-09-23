`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 10:41:17 AM
// Design Name: 
// Module Name: distince
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


module distince(
   input [15:0] val1,
   input [15:0] val2,
   output reg [3:0] dist
    );
    reg [15:0] rg_d;
     integer i;
    always @(val1 or val2)
    begin
      rg_d=val1 | val2;
    end
    always @(rg_d)
begin
  dist = 0;
 
  for (i = 0; i < 16; i = i + 1)
  begin
    if (rg_d[i] == 1'b1)
    begin
      dist = dist + 1;
    end
  end
end
endmodule