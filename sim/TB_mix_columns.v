`timescale 1ns / 1ps


module TB_mix_columns( );

reg [127:0] MC_in;
wire[127:0] MC_out;

Mix_Columns test (MC_in,MC_out);

initial begin
$monitor("input= %H , output= %H",MC_in,MC_out);
MC_in= 128'hd4bf5d30_e0b452ae_b84111f1_1e2798e5 ;
#10;
MC_in=128'h84e1dd69_1a41d76f_792d3897_83fbac70 ;
#10;
MC_in=128'h6353e08c_0960e104_cd70b751_bacad0e7;
#10;
end

endmodule
