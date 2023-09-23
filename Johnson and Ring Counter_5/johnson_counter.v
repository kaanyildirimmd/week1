`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2023 11:53:45 AM
// Design Name: 
// Module Name: ring_counter
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
module johnson_counter( 
  input clk,
  output reg[3:0] q
);
always @(posedge clk)
begin
case(q)
4'd0: q=4'd8;
4'd8: q=4'd12;
4'd12: q=4'd14;
4'd14: q=4'd15;
4'd15: q=4'd7;
4'd7:  q=4'd3;
4'd3:  q=4'd1;
4'd1:  q=4'd0;
endcase
end

endmodule