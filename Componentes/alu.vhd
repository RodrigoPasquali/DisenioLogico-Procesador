LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY alu IS
  PORT ( 
         alu_a:  IN  std_logic_vectOR(7 DOWNTO 0);
         alu_b:  IN  std_logic_vectOR(7 DOWNTO 0);
         alu_op: IN  std_logic_vectOR(2 DOWNTO 0);
         alu_s:  OUT std_logic_vectOR(7 DOWNTO 0)
        );    
END alu;
 
ARCHITECTURE alu_behavioral OF alu IS
  SIGNAL s_aux : std_logic_vectOR (7 DOWNTO 0); 

BEGIN
     
 PROCESS (alu_a, alu_b, alu_op)
 BEGIN   
    CASE alu_op IS
      WHEN "000" => s_aux <= alu_a;
      WHEN "001" => s_aux <= (alu_a(6 DOWNTO 0) & '0');
      WHEN "010" => s_aux <= alu_a + alu_b;
      WHEN "011" => s_aux <= alu_a - alu_b;
      WHEN "100" => s_aux <= alu_a AND alu_b;
      WHEN "101" => s_aux <= alu_a OR alu_b;
      WHEN "110" => s_aux <= alu_a XOR alu_b; 
      WHEN "111" => s_aux <= (alu_a(7) & alu_a(7 DOWNTO 1));
      WHEN OTHERS => s_aux <= (OTHERS => '0');                  
    END CASE;
  END PROCESS;
 
  alu_s <= s_aux;
END alu_behavioral;