`timescale 1ns / 1ps

module inverse_shift_rows(
                            input [127:0] inv_shift_rows_in,
                            output [127:0] inv_shift_row_out
                            );
    
    begin
// row 0         
assign {inv_shift_row_out[127:120],inv_shift_row_out[95:88],inv_shift_row_out[63:56],inv_shift_row_out[31:24]} = 
       {inv_shift_rows_in[127:120],inv_shift_rows_in[95:88],inv_shift_rows_in[63:56],inv_shift_rows_in[31:24]};
// row 1
assign {inv_shift_row_out[119:112],inv_shift_row_out[87:80],inv_shift_row_out[55:48],inv_shift_row_out[23:16]} =
       {inv_shift_rows_in[23:16],inv_shift_rows_in[119:112],inv_shift_rows_in[87:80],inv_shift_rows_in[55:48]};
// row 2   
assign {inv_shift_row_out[111:104],inv_shift_row_out[79:72],inv_shift_row_out[47:40],inv_shift_row_out[15:8]}  = 
       {inv_shift_rows_in[47:40],inv_shift_rows_in[15:8],inv_shift_rows_in[111:104],inv_shift_rows_in[79:72]};
// row 3  
 assign {inv_shift_row_out[103:96],inv_shift_row_out[71:64],inv_shift_row_out[39:32],inv_shift_row_out[7:0]}   = 
        {inv_shift_rows_in[71:64],inv_shift_rows_in[39:32],inv_shift_rows_in[7:0],inv_shift_rows_in[103:96]};   
end
endmodule
