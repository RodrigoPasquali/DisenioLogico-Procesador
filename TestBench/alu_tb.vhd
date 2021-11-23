LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY alu_tb IS
END alu_tb;
 
ARCHITECTURE arch_alu_tb OF alu_tb IS 
  COMPONENT alu
    PORT(
         alu_a  : IN  std_logic_vector(7 DOWNTO 0);
         alu_b  : IN  std_logic_vector(7 DOWNTO 0);
         alu_op : IN  std_logic_vector(2 DOWNTO 0);
         alu_s  : OUT std_logic_vector(7 DOWNTO 0)
         );
  END COMPONENT;
    
  SIGNAL s_a :  std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL s_b :  std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL s_op : std_logic_vector(2 DOWNTO 0) := (OTHERS => '0'); 
  SIGNAL s_s :  std_logic_vector(7 DOWNTO 0);

BEGIN 
  UUT: alu PORT MAP (
                     alu_a =>  s_a,
                     alu_b =>  s_b,
                     alu_op => s_op,
                     alu_s =>  s_s
                    );
  PROCESS 
    BEGIN
      s_a <=  "00000100"; --2
      s_b <=  "00000010"; --4
      s_op <= "000"; 
      WAIT FOR 10 ns; -- A
      
      s_op <= "001";  
      WAIT FOR 10 ns; -- A << 1 (desplazamiento izq)
      
      s_op <= "010";  
      WAIT FOR 10 ns; -- A + B
      
      s_op <= "011";
      WAIT FOR 10 ns; -- A - B
      
      s_op <= "100";  
      WAIT FOR 10 ns; -- A and B
      
      s_op <= "101";  
      WAIT FOR 10 ns; -- A or B
      
      s_op <= "110";  
      WAIT FOR 10 ns; -- A xor B
      
      s_op <= "111";    -- A >> 1 (desplazamiento der) 
      WAIT FOR 10 ns; -- A xor B

      s_op <= "UUU";
      WAIT;
  END PROCESS;    
END arch_alu_tb;