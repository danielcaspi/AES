`timescale 1ns / 1ps


module TB_Unfolded_not_pipline();
parameter clk_cycle = 10;
parameter sim_end = 3000;

reg  clk_i,rstn_i;   
reg  [127:0] key_i;  
reg  [127:0] text_i;
wire [127:0] Cipher_o;
Unfolded_not_pipelined UNP(clk_i,rstn_i,key_i,text_i,Cipher_o);


initial
begin
    clk_i = 0;
    forever #(clk_cycle)
    clk_i = !clk_i;
end
initial
begin
    rstn_i = 1;
end   
 
integer O_file;            
reg [127:0] data_in_text[100:0];
reg [127:0] data_in_key[100:0];
reg [127:0] result [100:0];
reg [127:0] Cipher_o_reg[100:0];

integer number =0;
integer i;

always@(posedge clk_i)
begin   
    if(number <5)
        begin
          key_i <= data_in_key[number];
          text_i <= data_in_text[number];  
          Cipher_o_reg [number -2 ] <= Cipher_o;
          number <= number +1;    
        end
    else if((number < 7)&(number > 4))
        begin
          Cipher_o_reg [number -2 ] <= Cipher_o;
          number <= number +1;       
        
        end
end

initial
begin
O_file = $fopen("O_file.txt","w");
$readmemh("data_text_file.txt",data_in_text);
$readmemh("data_key_file.txt",data_in_key);
$readmemh("data_result_file.txt",result);
$fwrite(O_file, "Test for AES UNP \n******************************\n");
#sim_end
   
    for(i = 0; i < number-2; i = i+1)
        begin
             if(result[i] == Cipher_o_reg[i])
             begin
                $fwrite(O_file, "test pass, number = %h  \n " ,i); 
                $fwrite(O_file, "text = %h, key = %h, expected result = %h, relust = %h  \n",data_in_text[i],data_in_key[i],result[i],Cipher_o_reg[i]);        
             end
             else
             begin
                $fwrite(O_file, "test fail, number = %h  \n ",i);
                $fwrite(O_file, "text = %h, key = %h, expected result = %h, relust = %h  \n",data_in_text[i],data_in_key[i],result[i],Cipher_o_reg[i]);               
             end
        end
$fclose(O_file);

end                                                                   
endmodule
