`timescale 1ns / 1ps


module TB_AES(  );



reg clk,rst;
reg [127:0] text;
reg [127:0] key;
wire [127:0] otext;
AES  T1(clk,rst,text,key,otext);


initial
begin
    clk = 0;
    forever #10
    clk = !clk;
end
initial

begin
    rst = 1;

end   
   
initial
begin
$monitor("text_in = %h ,key = %h, otext = %h", text,key, otext ); 
text = 128'h004e7d60cde97ae9d3ebf5271779482e;  
key =  128'he01fc9945862fdd9cba66f451f0621e3;
#50
text = 128'h3b9b8471706b8bd276eb16d03798ed0e;
#50
text = 128'hec9b152395cbac6fdffaf89228275eb4;

end

endmodule
