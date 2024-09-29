`timescale 1ns / 1ps

module mix_colum(
                    input [31:0] colum,
                    output [31:0] mix_column
                );
wire [31:0] temp;
genvar i;
generate
    for(i=0;i<31;i=i+8)         // temp = colum * 2
    begin
        assign temp[i+7:i] = colum[i+7] ? (colum[i+7:i] << 1) : {(colum[i+7:i] << 1)^8'h1b};
    end
endgenerate
// colum[i]*3 = temp[i]^colum[i] => (3 = 2^1)
//matrix multiplication
assign mix_column[31:24] = temp[31:24]^(temp[23:16]^colum[23:16])^colum[15:8]^colum[7:0];
assign mix_column[23:16] = colum[31:24]^temp[23:16]^(temp[15:8]^colum[15:8])^colum[7:0];
assign mix_column[15:8]  = colum[31:24]^colum[23:16]^temp[15:8]^(temp[7:0]^colum[7:0]);
assign mix_column[7:0]   = (temp[31:24]^colum[31:24])^colum[24:16]^colum[15:8]^temp[7:0];

endmodule
