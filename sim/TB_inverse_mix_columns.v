`timescale 1ns / 1ps

module TB_inverse_mix_columns();


reg [127:0] inv_MC_in;
wire[127:0] inv_MC_out;

inverse_mix_columns test1 (inv_MC_in,inv_MC_out);

initial begin
$monitor("input= %H , output= %H",inv_MC_in,inv_MC_out);
inv_MC_in= 128'hb68434e8e78860d7519866708ccafb51 ;
#10;
inv_MC_in=128'h9f487f794f955f662afc86abd7f1ab29 ;
#10;
inv_MC_in=128'h5f72641557f5bc92f7be3b291db9f91a;
#10;
end
endmodule
