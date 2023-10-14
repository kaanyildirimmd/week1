`timescale 1ns / 1ps

module serial_adder_tb;
   reg [7:0] A;
   reg [7:0] B;
   reg rst;
   reg clk;
   reg strt;
   wire [8:0] sum;
   
   serial_adder uut(
     .clk(clk),
     .rst(rst),
     .strt(strt),
     .sum(sum),
     .A(A),
     .B(B)
   );
   always begin
   #5 clk =~clk;
   end
   initial begin
    clk = 0;
    rst = 0;
    strt = 0;
    A = 8'b00110011;
    B = 8'b01010101;

    
    rst = 0;
    #100 rst = 1;
    #10 rst = 0;

    
    strt = 1;
    #10 A = 8'b10110011;
    B = 8'b11010101;

    
    #150;

    
    $display("Result: %b", sum);

    
    $finish;
  end

 
  always @(posedge clk) begin
    $monitor("Time = %0t, A = %b, B = %b, Sum = %b", $time, A, B, sum);
  end
endmodule

