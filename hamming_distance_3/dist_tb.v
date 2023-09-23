`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 10:41:56 AM
// Design Name: 
// Module Name: dist_tb
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


module dist_tb;
reg [15:0] val1;
reg [15:0] val2;
wire [3:0] dist;

distince uut(
.val1(val1),
.val2(val2),
.dist(dist)
);
inital begin
val1=16'h0011;
val2=16'h1100;
#10;
$display("hamming distance = %d",dist);
$finish;
end

 