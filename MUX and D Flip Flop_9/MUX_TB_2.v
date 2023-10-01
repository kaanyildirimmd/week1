`timescale 1ns / 1ps

module MUX_TB_2;
  reg clk = 0;
  reg R;
  reg w;
  reg E;
  reg L;
  wire q;

  MUX2 uut(
    .clk(clk),
    .R(R),
    .w(w),
    .E(E),
    .L(L),
    .q(q)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    R = 0;
    w = 0;
    E = 0;
    L = 0;
    #10 E = 1; w = 1;
    #10 E = 0;
    #10 E = 1; w = 0;
    #10 E = 0; w = 1;
    #10 L = 1; R = 1;
    #10 L = 0;
    #10 L = 1; R = 0;
    #10 L = 0; R = 1;

     $monitor("Time=%t, L=%b, E=%b, R=%b, w=%b, q=%b", $time, L, E, R, w, q);

    
    $finish;
  end
endmodule

