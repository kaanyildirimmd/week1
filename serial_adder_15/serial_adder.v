`timescale 1ns / 1ps
module serial_adder(
  input [7:0] A,
  input [7:0] B,
  input rst,
  input clk,
  input strt,
  output [8:0] sum
);
   wire aw;
   wire bw;
   wire fa;
   wire sum_out;
   wire carry_in;
   
   
   wire load;
   wire enable;
   wire rstn;
  shift_register ashift(
    .clk(clk),
    .load(load),
    .enable(enable),
    .din(A),
    .dout(aw)
  );
  shift_register bshift(
    .clk(clk),
    .load(load),
    .enable(enable),
    .din(B),
    .dout(bw)
  );
  control_fsm control_fsm(
    .clk(clk),
    .rstn(rstn),
    .rst(rst),
    .strt(strt),
    .load(load),
    .enable(enable)
  );
  full_adder full_adder(
    .dina(bw),
    .dinb(aw),
    .sum_out(sum_out),
    .carry_in(carry_in),
    .fa(fa)
  );
  flip_flop flip_flop(
     .fa(fa),
     .clk(clk),
     .carry_in(carry_in),
     .rst(rst)
  );
  sum_reg sum_reg(
  .sum_out(sum_out),
  .rst(rst),
  .enable(enable),
  .clk(clk),
  .sum(sum)
  );
  endmodule
  
  module shift_register(
    input clk,
    input [7:0] din,
    input enable,
    input load,
    output dout
  );
    reg [7:0] register;
    always @(posedge clk)begin
      if (din==0)begin
        register <= 8'b0;
      end else begin
        register <= {1'b0, register[7:1]};
        register[0] <=din[0];
      end
    end 
    assign dout  =register;
    endmodule 
        
  module control_fsm(
   input strt,
   input clk,
   output reg load,
   output reg  rst,
   input rstn,
   output reg enable
  ); 
  always @(posedge clk)begin
   if(strt==1)begin
     enable <=1;
     load <=1;
   end else begin
     enable <=0;
     load <=0;
   end
   if (rstn==1)begin
     rst<=1;
   end else begin
      rst<=0;    
   end
  end
  endmodule
  module full_adder(
    input dina,
    input dinb,
    input carry_in,
    output reg fa,
    output reg sum_out 
  );          
  always @(dina ,dinb,carry_in) begin
    sum_out = dina+dinb+carry_in;
    fa = (dina & dinb) | (carry_in & (dina ^ dinb)); 
    end  
  endmodule
  
  module sum_reg(
    input sum_out,
    input clk,
    input enable,
    input rst,
    output [8:0] sum  
  );
    reg [8:0] regs;
    always @( posedge clk, posedge rst) begin
       if (rst)begin
          regs<=9'b0;
       end else if (enable) begin
          regs <= {regs[7:0], sum_out};
       end
    end   
    assign sum =regs;         
  endmodule      
  
  module flip_flop(
    input clk,
    input rst,
    input fa,
    output carry_in
  ); 
    reg cry;
    always @(posedge clk, posedge rst)begin
        if (rst) begin
           cry<=1'b0;
        end else begin
           cry<=fa;
        end    
    end       
    assign carry_in=cry;
    endmodule  