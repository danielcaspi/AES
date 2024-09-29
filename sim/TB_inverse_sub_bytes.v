`timescale 1ns / 1ps


module TB_inverse_sub_bytes();

reg [127:0] inv_sub_bytes_in;
wire  [127:0] inv_sub_bytes_out;

inverse_sub_bytes I_S_B1(inv_sub_bytes_in,inv_sub_bytes_out);

initial 
begin
$monitor("input= %h ,output= %h",inv_sub_bytes_in,inv_sub_bytes_out);
inv_sub_bytes_in =128'hd42711aee0bf98f1b8b45de51e415230;
#10;
inv_sub_bytes_in =128'h49ded28945db96f17f39871a7702533b;
#10;
inv_sub_bytes_in =128'hac73cf7befc111df13b5d6b545235ab8;
#10;

end
    
endmodule
