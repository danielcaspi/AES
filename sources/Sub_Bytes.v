`timescale 1ns / 1ps


module Sub_Bytes(
                    input [127:0] sub_bytes_in,
                    output [127:0] sub_bytes_out
                );
genvar i;
generate
for(i=0;i<128;i=i+8) 
begin
    sbox sbox_generate (
                        .S_in(sub_bytes_in[(i+7):i]),
                        .S_out(sub_bytes_out[(i+7):i])
                        );
    end                    
endgenerate                
                
endmodule
