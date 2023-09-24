`timescale 1ns / 1ps



module dff_tb;
reg clk=0;
reg rst=1;
wire led;
clock_divider uut(
.clk(clk),
.rst(rst),
.led(led)
);
always begin
#5 clk=~clk;
end

initial begin 
  #100;
  $finish;
end


endmodule
