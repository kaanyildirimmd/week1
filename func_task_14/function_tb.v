`timescale 1ns / 1ps

module function_tb;
   reg [7:0] data;
  wire [2:0] result;

  
  func dut (
    .data(data),
    .result(result)
  );
  
  reg clk;
  always #5 clk = ~clk; 
  initial clk = 0;
 
  initial begin
    $monitor("Time=%0t data=%b result=%b", $time, data, result);
        
    data = 8'b00000000;
    #10;
    
    
    data = 8'b11111111;
    #10;
   
    data = 8'b10100100;
    #10;
   
    $finish; 
  end

   
endmodule
