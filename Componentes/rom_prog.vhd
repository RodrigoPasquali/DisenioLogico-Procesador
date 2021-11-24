LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY rom_prog IS
  PORT ( 
        rom_prog_addr : IN  std_logic_vector(6 DOWNTO 0);
        rom_prog_out : OUT std_logic_vector(15 DOWNTO 0)
        );    
END rom_prog;
 
ARCHITECTURE rom_prog_behavioral OF rom_prog IS
  
 SIGNAL s_aux : std_logic_vector (15 DOWNTO 0); 

BEGIN 
     
 PROCESS (rom_prog_addr)
 
 BEGIN
   
    CASE rom_prog_addr IS
--                                  ins    rs  rd                            con in = 00000001
      WHEN "0000000" => s_aux <= "0000000100000011"; --x"0103" 1  in(rd)     r3      r3 = 1   
      WHEN "0000001" => s_aux <= "0000010000110000"; --x"0430" 2  lda(rs)    r3      r3 = 1 ra = 1 
      WHEN "0000010" => s_aux <= "0000101000110100"; --x"0A34" 3  add(rd-rs) r4,r3   r4 = 2 ra = 1
      WHEN "0000011" => s_aux <= "0000101101000101"; --x"0B45" 4  sub(rd-rs) r5, r4  r5 = 1 ra = 1
      WHEN "0000100" => s_aux <= "0000110101000110"; --x"0D46" 5  or(rd-rs)  r6, r4  r6 = 3 ra = 1   
      WHEN "0000101" => s_aux <= "0000110000000111"; --x"0C07" 6  and(rd-rs) r7, r0  r7 = 0
      WHEN "0000110" => s_aux <= "0000001101001110"; --x"034E" 7  mov(rd-rs) r14, r4 r14 = 2
      WHEN "0000111" => s_aux <= "0000001000110000"; --x"0230" 8  out(rs)    r3 = 1     b
      WHEN "0001000" => s_aux <= "0000001001000000"; --x"0240" 9  out(rs)    r4 = 2     b
      WHEN "0001001" => s_aux <= "0000001001010000"; --x"0250" 10 out(rs)    r5 = 1     b
      WHEN "0001010" => s_aux <= "0000001001100000"; --x"0260" 11 out(rs)    r6 = 3     b
      WHEN "0001011" => s_aux <= "0000001001110000"; --x"0270" 12 out(rs)    r7 = 0     b
      WHEN "0001100" => s_aux <= "0000001010000000"; --x"0280" 13 out(rs)    r8 = 0     b
      WHEN "0001101" => s_aux <= "0000001011010000"; --x"02D0" 14 out(rs)    r13 = 0    b
      WHEN "0001110" => s_aux <= "0000001011100000"; --x"02E0" 15 out(rs)    r14 = 2    b 
      WHEN others    => s_aux <= "0000000000000000"; --x"0000"                  
    END CASE;
  END PROCESS;
 
  rom_prog_out <= s_aux;
END rom_prog_behavioral;
