`timescale 1ns / 1ps

module Sub_Word(
                 input [31:0] sub_word_in,
                 output [31:0] sub_word_out
                );
    
 sbox b0 (sub_word_in[31:24],sub_word_out[31:24]);
 sbox b1 (sub_word_in[23:16],sub_word_out[23:16]);
 sbox b2 (sub_word_in[15:8],sub_word_out[15:8]);
 sbox b3 (sub_word_in[7:0],sub_word_out[7:0]);


    
endmodule
