`timescale 1ns / 1ps

module moore(
  input d_in,
  input rst,
  input clk,
  output reg d_out
);
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  
  reg [2:0] ns, s;
  
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
          ns <= S1;
          d_out <= 0;
        end else begin
          ns <= S0;
        end
      end
      S1: begin
        if (d_in) begin
          ns <= S2;
          d_out <= 0;
        end else begin
          ns <= S1;
        end
      end
      S2: begin
        if (d_in) begin
          ns <= S3;
          d_out <= 0;
        end else begin
          ns <= S0;
        end
      end
      S3: begin
        if (d_in) begin
          ns <= S4;
          d_out <= 0;
        end else begin
          ns <= S2;
        end
      end
      S4: begin
        if (d_in) begin
          ns <= S1;
          d_out <= 1;
        end else begin
          ns <= S2;
          d_out<=1;
        end
      end
    endcase
  end
endmodule
        