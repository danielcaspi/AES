`timescale 1ns / 1ps


module inverse_sub_bytes(
                           input [127:0] inv_sub_bytes_in,
                          output [127:0] inv_sub_bytes_out
                );
genvar i;
generate
for(i=0;i<128;i=i+8) 
begin
    inverse_sbox inv_sbox_generate (
                                      .inv_S_in(inv_sub_bytes_in[(i+7):i]),
                                      .inv_S_out(inv_sub_bytes_out[(i+7):i])
                                    );
    end                    
endgenerate                
           
endmodule
