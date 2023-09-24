`timescale 1ns / 1ps


module clock_divider(
input clk,
input rst,
output led
);
wire [26:0] din;
wire [26:0] clkdiv;
dff_1 dff0 (
  .clk(clk),
  .rst(rst),
  .D(din[0]),
  .q(clkdiv[0])
);
genvar i;
generate 
for(i=1;i<27;i=i+1)
begin
 dff_1 dff1(
 .clk(clkdiv[i-1]),
 .rst(rst),
 .D(din[i]),
 .q(clkdiv[i])
 );
 end
 endgenerate
 assign din = ~clkdiv;
 
assign led = clkdiv[26];
 

endmodule
