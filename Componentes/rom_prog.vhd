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
      WHEN "0000000" => s_aux <= "0000000101100000"; --x"0130"
      WHEN "0000001" => s_aux <= "0000010000000011"; --x"0403"
      WHEN "0000010" => s_aux <= "0000101001000011"; --x"0A43"
      WHEN "0000011" => s_aux <= "0000101101010100"; --x"0B54"
      WHEN "0000100" => s_aux <= "0000110101100100"; --x"0D64"
      WHEN "0000101" => s_aux <= "0000110001110000"; --x"0C70"
      WHEN "0000110" => s_aux <= "0000001111100100"; --x"03E4"
      WHEN "0000111" => s_aux <= "0000001000000011"; --x"0203"
      WHEN "0001000" => s_aux <= "0000001000000100"; --x"0204"
      WHEN "0001001" => s_aux <= "0000001000000101"; --x"0205"
      WHEN "0001010" => s_aux <= "0000001000000110"; --x"0206"
      WHEN "0001011" => s_aux <= "0000001000000111"; --x"0207"
      WHEN "0001100" => s_aux <= "0000001000001000"; --x"0208"
      WHEN "0001101" => s_aux <= "0000001000001101"; --x"020D"
      WHEN "0001110" => s_aux <= "0000001000001110"; --x"020E"
      WHEN others    => s_aux <= "0000000000000000"; --x"0000"                  
    END CASE;
  END PROCESS;
 
  rom_prog_out <= s_aux;
END rom_prog_behavioral;
