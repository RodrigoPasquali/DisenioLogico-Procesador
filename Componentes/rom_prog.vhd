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
--                                  ins    rs  rd
      WHEN "0000000" => s_aux <= "0000000100000011"; --x"0130" in(rd)     r3
      WHEN "0000001" => s_aux <= "0000010000110000"; --x"0403" lda(rs)    r3
      WHEN "0000010" => s_aux <= "0000101000110100"; --x"0A43" add(rd-rs) r4,r3
      WHEN "0000011" => s_aux <= "0000101101000101"; --x"0B54" sub(rd-rs) r5, r4
      WHEN "0000100" => s_aux <= "0000110101000110"; --x"0D64" or(rd-rs)  r6, r4
      WHEN "0000101" => s_aux <= "0000110000000111"; --x"0C70" and(rd-rs) r7, r0
      WHEN "0000110" => s_aux <= "0000001101001110"; --x"03E4" mov(rd-rs) r14, r4
      WHEN "0000111" => s_aux <= "0000001000110000"; --x"0203" out(rs)    r3
      WHEN "0001000" => s_aux <= "0000001001000000"; --x"0204" out(rs)    r4
      WHEN "0001001" => s_aux <= "0000001001010000"; --x"0205" out(rs)    r5
      WHEN "0001010" => s_aux <= "0000001001100000"; --x"0206" out(rs)    r6
      WHEN "0001011" => s_aux <= "0000001001110000"; --x"0207" out(rs)    r7
      WHEN "0001100" => s_aux <= "0000001010000000"; --x"0208" out(rs)    r8  --0
      WHEN "0001101" => s_aux <= "0000001011010000"; --x"020D" out(rs)    r13 --0
      WHEN "0001110" => s_aux <= "0000001011100000"; --x"020E" outv r14 
      WHEN others    => s_aux <= "0000000000000000"; --x"0000"                  
    END CASE;
  END PROCESS;
 
  rom_prog_out <= s_aux;
END rom_prog_behavioral;
