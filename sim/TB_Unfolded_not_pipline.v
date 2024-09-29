`timescale 1ns / 1ps

module TB_Unfolded_not_pipline();
                       
reg  clk_i,rstn_i;   
reg [127:0] key_i;  
reg[127:0] text_i;
wire [127:0] Cipher_o;
Unfolded_not_pipelined UNP(clk_i,rstn_i,key_i,text_i,Cipher_o);

initial
begin
    clk_i = 0;
    forever #10
    clk_i = !clk_i;
end
initial

begin
    rstn_i = 1;

end   
   
initial
begin
$monitor("text_in = %h ,key = %h chiper_out = %h",text_i,key_i, Cipher_o ); 
text_i = 128'h004e7d60cde97ae9d3ebf5271779482e;  
key_i =  128'he01fc9945862fdd9cba66f451f0621e3;
#50
text_i = 128'h3b9b8471706b8bd276eb16d03798ed0e;
#50
text_i = 128'hec9b152395cbac6fdffaf89228275eb4;

end
                                                                   
endmodule
