`timescale 1ns / 1ps


module n_bit_adder(
    input [N-1:0] A,
    input [N-1:0] B,
    input Cin,
    output [N-1:0] Sum,
    output Cout
);
parameter N=4;
wire [N:0] carry; // Array to store carry bits between full adders

// Instantiate full adders for each bit
genvar i;
generate
for (i = 0; i < N; i = i + 1) begin : full_adder_instance
    full_adder FA (
        .A(A[i]),
        .B(B[i]),
        .Cin(carry[i]),
        .S(Sum[i]),
        .Cout(carry[i + 1])
    );
end
endgenerate

assign carry[0] = Cin; // Set the initial carry-in

assign Cout = carry[N]; // Carry-out of the N-bit addition

endmodule