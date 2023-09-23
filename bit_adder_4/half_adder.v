`timescale 1ns / 1ps


module half_adder(
    input A,
    input B,
    output S,
    output C
);

assign S = A ^ B; // XOR gate for sum
assign C = A & B; // AND gate for carry

endmodule