`timescale 1ns / 1ps


module TB_Unfolded_not_pipline_decrypt( );
                       
reg  clk_i,rstn_i;   
reg [127:0] key_i; 
reg [127:0] Cipher_i; 
wire[127:0] text_o;

Unfolded_not_pipeline_decrypt UNPD1(clk_i,rstn_i,key_i,Cipher_i,text_o);

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
$monitor("Cipher_in = %h ,key = %h text_out = %h",Cipher_i,key_i, text_o ); 
Cipher_i = 128'hddf15219899bc752ba5a82e3e606fc72;  
key_i =  128'he01fc9945862fdd9cba66f451f0621e3;
#50
Cipher_i = 128'hb89fe5f8c0311b2a66ef7ed62e245ef5;
#50
Cipher_i = 128'hd6bd48c2623fa09bab86d1c879cdecca;

end
                                                                   
endmodule