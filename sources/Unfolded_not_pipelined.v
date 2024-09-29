`timescale 1ns / 1ps


module Unfolded_not_pipelined(
                                input  clk_i,rstn_i,
                                input  [127:0] key_i,
                                input  [127:0] text_i,
                                output [127:0] Cipher_o                             
                               );
                               
 reg [127:0] text_reg;                              
 always@(posedge clk_i)
    if(!rstn_i)
        text_reg <=0;
    else
        text_reg <= text_i;
        
// keys        
wire [127:0] key_level [10:0];
assign key_level[0] = key_i;                                 
generate 
genvar i;
    for( i=1;i<11;i=i+1)      
    begin
          wire [3:0] round = i;
          Key_Expansion KE (
                             .round_number(round),
                             .key(key_level[i-1]),
                             .next_key(key_level[i])
                           );                                                                                 
     end                      
endgenerate                               


//Round Transformation
wire [127:0] sub_level [10:1];
wire [127:0] shift_level [10:1];
wire [127:0] mix_level [10:1];
wire [127:0] addkey_level [10:1];

assign addkey_level[1] = text_reg^key_level[0];
generate
genvar j;
    for(j=1;j<11;j=j+1)
    begin
        Sub_Bytes SB(                                
                     .sub_bytes_in(addkey_level[j]),  
                     .sub_bytes_out(sub_level [j]) 
                     );                               
        Shift_Rows SR(                              
                     .shift_rows_in(sub_level [j]),
                     .shift_row_out(shift_level [j])
                   );     
        if(j == 10)
            assign Cipher_o = shift_level [j] ^ key_level[j];
        else
            Mix_Columns MC(                       
                          .MC_in(shift_level [j]),  
                          .MC_out(mix_level [j]) 
                         );                                    
            assign addkey_level[j+1] =  mix_level [j] ^ key_level[j];
     end
 endgenerate
                               
endmodule
