`timescale 1ns / 1ps


module seq (
  input clk,
  input rst,
  output [31:0] seq
);

  reg [31:0] num1, num2, num3, out;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      
      num1 <= 32'b0;
      num2 <= 32'b1;
      num3 <= 32'b1;
      out <= 32'b0;
    end else begin
      
      num1 <= num2;
      num2 <= num3;
      num3 <= num1 + num2;
      out <= num3;
    end
  end

  
  assign seq = out;

endmodule