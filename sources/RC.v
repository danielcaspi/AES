`timescale 1ns / 1ps

module RC(
            input [3:0] round_num,     
            output [31:0] RCj
             );
             
assign RCj = 
     (round_num ==  4'h1)? 32'h01000000:
     (round_num ==  4'h2)? 32'h02000000:
     (round_num ==  4'h3)? 32'h04000000:
     (round_num ==  4'h4)? 32'h08000000:
     (round_num ==  4'h5)? 32'h10000000:
     (round_num ==  4'h6)? 32'h20000000:
     (round_num ==  4'h7)? 32'h40000000:
     (round_num ==  4'h8)? 32'h80000000:
     (round_num ==  4'h9)? 32'h1b000000:
     (round_num ==  4'ha)? 32'h36000000: 32'h00000000;


             
endmodule
