`timescale 1ns / 1ps

module invarse_mix_colum(

                          input [31:0] inv_colum,
                          output [31:0] inv_mix_column
                          );
wire [31:0] temp2,temp4,temp8;
genvar i,k,j;
generate
    for(i=0;i<31;i=i+8)         // temp2 = colum * 2
    begin
        assign temp2[i+7:i] = inv_colum[i+7] ? (inv_colum[i+7:i] << 1) : {(inv_colum[i+7:i] << 1)^8'h1b};
    end
endgenerate
generate
    for(j=0;j<31;j=j+8)         // temp4 = temp2 * 2
    begin
        assign temp4[j+7:j] = temp2[j+7] ? (temp2[j+7:j] << 1) : {(temp2[j+7:j] << 1)^8'h1b};
    end
endgenerate
generate
    for(k=0;k<31;k=k+8)         // temp8 = temp4 * 2
    begin
        assign temp8[k+7:k] = temp4[k+7] ? (temp4[k+7:k] << 1) : {(temp4[k+7:k] << 1)^8'h1b};
    end
endgenerate
// multiply by 0E = temp8 ^ temp4 ^ temp2 => 8+4+2 = 12
// multiply by 0B = temp8 ^ temp2 ^ col 
// multiply by 0D = temp8 ^ temp4 ^ col
// multiply by 09 = temp8 ^ col


assign inv_mix_column [31:24] = {temp8[31:24]^temp4[31:24]^temp2[31:24]}^{temp8[23:16]^temp2[23:16]^inv_colum[23:16]}^
                                {temp8[15:8]^temp4[15:8]^inv_colum[15:8]}^{temp8[7:0]^inv_colum[7:0]};
assign inv_mix_column [23:16] = {temp8[31:24]^inv_colum[31:24]}^{temp8[23:16]^temp4[23:16]^temp2[23:16]}^
                                {temp8[15:8]^temp2[15:8]^inv_colum[15:8]}^{temp8[7:0]^temp4[7:0]^inv_colum[7:0]};
assign inv_mix_column  [15:8] = {temp8[31:24]^temp4[31:24]^inv_colum[31:24]}^{temp8[23:16]^inv_colum[23:16]}^
                                {temp8[15:8]^temp4[15:8]^temp2[15:8]}^{temp8[7:0]^temp2[7:0]^inv_colum[7:0]};
assign inv_mix_column  [7:0]  = {temp8[31:24]^temp2[31:24]^inv_colum[31:24]}^{temp8[23:16]^temp4[23:16]^inv_colum[23:16]}^
                                {temp8[15:8]^inv_colum[15:8]}^{temp8[7:0]^temp4[7:0]^temp2[7:0]};


endmodule
