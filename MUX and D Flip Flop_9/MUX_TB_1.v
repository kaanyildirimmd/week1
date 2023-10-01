`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2023 01:45:02 PM
// Design Name: 
// Module Name: MUX_TB_1
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


module MUX_TB_1;
   reg clk = 0;
   reg L;
   reg R;
   wire q;
   MUX uut(
     .clk(clk),
     .L(L),
     .R(R),
     .q(q)
   );
   
   always begin
     #5 clk = ~clk;
   end
   
   initial begin
     clk = 0; // Initialize clk
     L = 0;
     R = 0;
     
     #10; // Add a delay here
    
     L = 1;
     R = 1;
     #10 L = 0;
     #10 L = 1;
     R = 0;
     #10 L = 0;
     R = 1;
     
     $monitor("Time=%t, L=%b, R=%b, q=%b", $time, L, R, q);
     $finish;
   end
endmodule
