`timescale 1ns / 1ps


module dualport #(
    parameter RAM_WIDTH = 16,
    parameter RAM_DEPTH = 1024,
    parameter LOG_DEPTH = 10
)
(
    input clk,
    input wren_a,
    input rden_a,
    input rden_b,
    input [9:0] addr_a,
    input [9:0] addr_b, 
    input [15:0] din_a,
    output reg [15:0] dout_b
);

    reg [15:0] mem [1023:0];

    always @(*) begin
        for (integer i = 0; i < 10; i = i + 1) begin
            mem[i] = 16'b0;
        end
    end

    always @(posedge clk) begin
        if (rden_a) begin
            dout_b <= mem[addr_a];
        end

        if (wren_a) begin
            mem[addr_a] <= din_a;
            end
        if (wren_a && (rden_b==rden_a==1)) begin
           dout_b<=dout_b;
           end else begin
              mem[addr_b] <= din_a;
              dout_b <= mem[addr_b];
           end
    end
endmodule
