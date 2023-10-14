`timescale 1ns / 1ps


module func(
  input [7:0] data,
  output [2:0] result
);

  reg [2:0] a;

  function [2:0] counter_zeros;
    input [7:0] data_a; 
    integer i;
    integer b;
    b = 0;
    begin
      for (i = 0; i < 8; i = i + 1) begin
        if (data_a[i] == 0) begin
           b = b + 1;
        end
      end

      counter_zeros = b;
    end
  endfunction

  always @(*) begin
    a = counter_zeros(data);
  end

  assign result = a; 

endmodule