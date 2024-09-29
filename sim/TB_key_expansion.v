`timescale 1ns / 1ps


module TB_key_expansion( );

                        reg [3:0] round_numbe;
                        reg [127:0] key;
                        wire [127:0] next_key;
                        
Key_Expansion  ke ( round_numbe, key,  next_key);
  
initial
begin               
$monitor("key128Bit= %h , round_numbe= %h, next_key = %h",key,round_numbe, next_key);        
key = 128'h5468617473206D79204B756E67204675;
round_numbe = 1;
#10
key = 128'hE232FCF191129188B159E4E6D679A293;
round_numbe = 2;
#10
key = 128'h56082007C71AB18F76435569A03AF7FA;
round_numbe = 3;
#10
key = 128'hD2600DE7157ABC686339E901C3031EFB;
round_numbe =4;
#10
key = 128'hA11202C9B468BEA1D75157A01452495B;
round_numbe =5;
#10
key = 128'hB1293B3305418592D210D232C6429B69;
round_numbe =6;
#10
key = 128'hBD3DC2B7B87C47156A6C9527AC2E0E4E;
round_numbe =7;
#10
key = 128'hCC96ED1674EAAA031E863F24B2A8316A;
round_numbe =8;
#10
key = 128'h8E51EF21FABB4522E43D7A0656954B6C;
round_numbe =9;
#10
key = 128'hBFE2BF904559FAB2A16480B4F7F1CBD8;
round_numbe = 10;




end                
endmodule
