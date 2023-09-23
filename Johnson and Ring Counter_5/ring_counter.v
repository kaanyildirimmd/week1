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


module ring_counter(
   input wire clk,
   output reg [3:0] q
    );
    always @(posedge clk) begin
      case(q)
       4'd1: q=4'd2;
       4'd2: q=4'd4;
       4'd4: q=4'd8;
       4'd8: q=4'd1;
       endcase
      end
      initial begin
         q<=4'd1;
      end
    
   endmodule
       
       
    
    
    


