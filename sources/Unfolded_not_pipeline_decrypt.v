`timescale 1ns / 1ps



module Unfolded_not_pipeline_decrypt(
                                        input clk_i,rstn_i,
                                        input [127:0] key_i,
                                        input [127:0]chipher_i,
                                        output [127:0] text_o
                                        );
reg [127:0] chipher_reg;
always@(posedge clk_i)
begin
        if(!rstn_i)
            chipher_reg <= 0;
        else
            chipher_reg<=chipher_i;
end    
 
wire [127:0] key_level [10:0];
assign key_level[0] = key_i;                                 
generate 
genvar i;
    for( i=1;i<11;i=i+1)      
    begin
          wire [3:0] round = i;
          Key_Expansion inv_KE (
                                .round_number(round),
                                .key(key_level[i-1]),
                                .next_key(key_level[i])
                           );                                                                                 
     end                      
endgenerate  
wire [127:0] sub_level [10:1];
wire [127:0] shift_level [10:1];
wire [127:0] mix_level [10:2];
wire [127:0] addkey_level [10:0];

assign addkey_level[0] = chipher_reg ^ key_level[10]; 

generate
genvar j;
    for(j=1;j<11;j=j+1)
    begin 
        if(j == 1)
        begin
            inverse_shift_rows ISR1(                              
                                      .inv_shift_rows_in(addkey_level[j-1]),
                                      .inv_shift_row_out(shift_level [j])
                                     );  

            inverse_sub_bytes ISB1(                                
                                       .inv_sub_bytes_in(shift_level[j]),  
                                       .inv_sub_bytes_out(sub_level[j]) 
                                     ); 
            assign addkey_level[j] =  sub_level[j] ^ key_level[10-j];
        end
        else  
        begin
            inverse_mix_columns IMC1(                       
                                    .inv_MC_in(addkey_level[j-1]),  
                                    .inv_MC_out(mix_level [j]) 
                                     );          
            inverse_shift_rows ISR1(                              
                                      .inv_shift_rows_in(mix_level [j]),
                                      .inv_shift_row_out(shift_level [j])
                                     );  

            inverse_sub_bytes ISB1(                                
                                       .inv_sub_bytes_in(shift_level[j]),  
                                       .inv_sub_bytes_out(sub_level[j]) 
                                     ); 
            assign addkey_level[j] =  sub_level[j] ^ key_level[10-j];        
                              
       end
   end
endgenerate 
assign  text_o = addkey_level[10];
                     
endmodule
