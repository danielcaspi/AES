`timescale 1ns / 1ps


module AES_folded_pipelined(
                                input  clk_i,rstn_i,start_i,   
                                input  [127:0] key_i,  
                                input  [127:0] text_i, 
                                output [127:0] Cipher_o,
                                output reg done_o = 1'b0
                               );                      
wire [127:0] sub_level ;     
wire [127:0] shift_level;   
wire [127:0] mix_level;     
wire [127:0] addkey_level;  
wire [127:0] key_level;
wire [127:0] next_key;
wire [127:0] mux_round_level;
reg  [127:0] key_reg;
reg  [3:0]   round = 4'ha;
reg  [127:0] out_reg;

Key_Expansion KE_fp (
                     .round_number(round+1),
                     .key(key_reg),
                     .next_key(next_key)
                    );   

always@(posedge clk_i)
    if(round == 4'ha & !start_i)
        key_reg <= key_i;  
    else
        key_reg <= key_level;

assign key_level = (round == 4'ha ) ? key_i : next_key;


Sub_Bytes SB(                                                 
             .sub_bytes_in(out_reg),                  
             .sub_bytes_out(sub_level)                    
             );                                               
Shift_Rows SR(                                                
             .shift_rows_in(sub_level),                   
             .shift_row_out(shift_level)                  
           );                                                 
                                                          
Mix_Columns MC(                                           
                  .MC_in(shift_level),                    
                  .MC_out(mix_level)                      
                 );   
                 
assign mux_round_level = (round == 4'ha)? text_i:
                         (round == 4'h9)?  shift_level : mix_level;                 
                                                         
assign addkey_level = mux_round_level^key_level; 

always@(posedge clk_i)   
begin
    if (round == 4'ha & start_i)
        round <= 4'h0;
    else if (round == 4'ha & !start_i)
        round <= 4'ha;
    else
        round <= round+1;
end

always@(posedge clk_i)
begin
    if(round == 4'h9 & !done_o) 
       done_o <= 1'b1; 
    else if (done_o & !start_i) 
       done_o <= 1'b1;
    else                                      
       done_o <= 1'b0;
end

always@(posedge clk_i or negedge rstn_i)
begin
    if(!rstn_i)
        out_reg <=0;
    else if ( done_o & (!start_i ))
        out_reg <= out_reg;
    else
        out_reg <= addkey_level;
end

assign Cipher_o = out_reg;




endmodule
