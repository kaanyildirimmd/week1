`timescale 1ns / 1ps

module mealy (
  input d_in,
  input rst,
  input clk,
  output reg d_out
);

  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;

  reg [1:0] s, ns;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      s <= S0;
    end else begin
      s <= ns;
    end
  end

  always @(s, d_in) begin
    case (s)
      S0: begin
        if (d_in) begin
          ns = S1;
        end
      end

      S1: begin
        if (d_in) begin
          ns = S2;
          d_out = 0;
        end else begin
          d_out = 0;
        end
      end

      S2: begin
        if (d_in) begin
          ns = S3;
          d_out = 0;
        end else begin
          d_out = 0;
        end
      end

      S3: begin
        if (d_in) begin
          ns = S2;
          d_out = 1;
        end
      end
    endcase
  end

endmodule


