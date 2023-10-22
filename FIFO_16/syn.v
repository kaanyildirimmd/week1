`timescale 1ns / 1ps

module syn#(  
    parameter width = 8,
    parameter depth = 8  
)
   (
   input clk,
   input wren,
   input [7:0] din,
   input rden,
   output reg [7:0] dout,
   output reg empty,
   output reg full
    );
    reg  [7:0] w_ptr,r_ptr;
    reg [7:0] fif [0:7];
    wire a;
    wire b;
    
    always @(posedge clk)begin
      if(wren)begin
        if(!full)begin
           fif[w_ptr]<=din;
           w_ptr<= w_ptr+1;
           
        end
      end 
    end
    always @(posedge clk)begin 
      if(rden)begin
        if(!empty)begin
           dout <=fif[r_ptr];
           r_ptr<=r_ptr+1;
           
        end
      end
    end
     always @(w_ptr,r_ptr) begin
        empty <= (w_ptr == r_ptr);
        full  <= ((w_ptr + 1) == r_ptr);
    end
       
endmodule
