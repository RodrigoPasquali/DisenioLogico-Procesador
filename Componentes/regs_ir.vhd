LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regs_ir IS
    PORT ( 
           regs_ir_clk : IN  std_logic;
           regs_ir_rst : IN  std_logic;
           regs_ir_in  : IN  std_logic_vector (15 DOWNTO 0);
           regs_ir_out : OUT std_logic_vector (15 DOWNTO 0));
END regs_ir;

ARCHITECTURE regs_ir_behavioral OF regs_ir IS
  SIGNAL s_aux : std_logic_vector (15 DOWNTO 0);
  
BEGIN 
  PROCESS (regs_ir_clk, regs_ir_rst)
  BEGIN
    IF (regs_ir_rst = '1') THEN
      s_aux <= (OTHERS => '0');
    ELSIF (regs_ir_clk'EVENT AND regs_ir_clk = '1') THEN
      s_aux <= regs_ir_in;
    END IF; 
  END PROCESS; 

  regs_ir_out <= s_aux;
  
END regs_ir_behavioral;