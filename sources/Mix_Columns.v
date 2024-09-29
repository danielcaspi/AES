`timescale 1ns / 1ps


module Mix_Columns(
                    input [127:0] MC_in,
                    output [127:0] MC_out
    );
  
mix_colum c0 (MC_in[31:0],MC_out[31:0]);
mix_colum c1 (MC_in[63:32],MC_out[63:32]);
mix_colum c2 (MC_in[95:64],MC_out[95:64]);
mix_colum c3 (MC_in[127:96],MC_out[127:96]);
    
    
endmodule
