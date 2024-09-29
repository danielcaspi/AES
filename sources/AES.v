`timescale 1ns / 1ps


module AES(
            input clk,rst,
            input [127:0] text,
            input [127:0] key,
            output [127:0] otext
            );

wire [127:0] connect;
            
    
Unfolded_not_pipeline_decrypt AES_test1(
                                        .clk_i(clk),
                                        .rstn_i(rst),
                                        . key_i(key),
                                        .chipher_i(connect),
                                        .text_o(otext)
                                        );    
 Unfolded_not_pipelined AES_test(
                                .clk_i(clk),
                                .rstn_i(rst),
                                .key_i(key),
                                .text_i(text),
                                .Cipher_o(connect)                             
                               );    
 
    
    
endmodule
