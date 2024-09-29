`timescale 1ns / 1ps


module Key_Expansion(
                        input [3:0] round_number,
                        input [127:0] key,
                        output [127:0] next_key
                     );
wire [31:0] sbox_temp;                                     // hold the value after sbox and shift left    
wire [31:0] RC_for_round;                
Sub_Word W0 ( {key[23:0],key[31:24]},sbox_temp);           // W3 --> key[31:0] --> shift left one word                    
RC W1 ( round_number,  RC_for_round);                      // RCon for xor operation with sbox_temp

//assembly the next key
assign next_key[127:96] = (RC_for_round ^ sbox_temp) ^ key[127:96];               
assign next_key[95:64]  =  next_key[127:96] ^ key[95:64];               
assign next_key[63:32]  =  next_key[95:64] ^ key[63:32];               
assign next_key[31:0]   =  next_key[63:32] ^ key[31:0];               
                     
                     
endmodule
