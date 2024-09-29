`timescale 1ns / 1ps


module inverse_mix_columns(   
                             input [127:0] inv_MC_in,
                             output [127:0] inv_MC_out
                          );
  
invarse_mix_colum IMC0 (inv_MC_in[31:0],  inv_MC_out[31:0]);
invarse_mix_colum IMCc1 (inv_MC_in[63:32], inv_MC_out[63:32]);
invarse_mix_colum IMCc2 (inv_MC_in[95:64], inv_MC_out[95:64]);
invarse_mix_colum IMCc3 (inv_MC_in[127:96],inv_MC_out[127:96]);
    
    
endmodule


