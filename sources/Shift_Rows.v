`timescale 1ns / 1ps


module Shift_Rows(
                    input [127:0] shift_rows_in,
                    output [127:0] shift_row_out
                  );
begin
// row 0         
assign {shift_row_out[127:120],shift_row_out[95:88],shift_row_out[63:56],shift_row_out[31:24]} = 
       {shift_rows_in[127:120],shift_rows_in[95:88],shift_rows_in[63:56],shift_rows_in[31:24]};
// row 1
assign {shift_row_out[119:112],shift_row_out[87:80],shift_row_out[55:48],shift_row_out[23:16]} =
 
       {shift_rows_in[87:80],shift_rows_in[55:48],shift_rows_in[23:16],shift_rows_in[119:112]};
// row 2   
assign {shift_row_out[111:104],shift_row_out[79:72],shift_row_out[47:40],shift_row_out[15:8]}  = 
       {shift_rows_in[47:40],shift_rows_in[15:8],shift_rows_in[111:104],shift_rows_in[79:72]};
// row 3  
 assign {shift_row_out[103:96],shift_row_out[71:64],shift_row_out[39:32],shift_row_out[7:0]}   = 
        {shift_rows_in[7:0],shift_rows_in[103:96],shift_rows_in[71:64],shift_rows_in[39:32]};   
end
    
endmodule
