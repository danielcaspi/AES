`timescale 1ns / 1ps


module TB_Sub_Bytes( );

reg [127:0] sub_bytes_in;
wire  [127:0] sub_bytes_out;

Sub_Bytes S_B(sub_bytes_in,sub_bytes_out);

initial 
begin
$monitor("input= %h ,output= %h",sub_bytes_in,sub_bytes_out);
sub_bytes_in =128'h_193de3be_a0f4e22b_9ac68d2a_e9f84808;
#10;
sub_bytes_in =128'h_a49c7ff2_689f352b_6b5bea43_026a5049;
#10;
sub_bytes_in =128'h_aa8f5f03_61dde3ef_82d24ad2_6832469a;
#10;

end

endmodule
