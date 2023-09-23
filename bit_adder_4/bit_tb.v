`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 05:20:12 PM
// Design Name: 
// Module Name: bit_tb
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


module n_bit_adder_tb;

  // Define the parameters for the N-bit adder
  parameter N = 4; // Change N to the desired number of bits

  // Declare signals for inputs and outputs
  reg [N-1:0] A, B;
  reg Cin;
  wire [N-1:0] Sum;
  wire Cout;

  // Instantiate the N-bit adder
  n_bit_adder #(N) dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );

  // Apply test cases
  initial begin
    // Test case 1: A = 5 (0101), B = 3 (0011), Cin = 0
    A = 4'b0101;
    B = 4'b0011;
    Cin = 1'b0;
   


   
    $finish;
  end

endmodule