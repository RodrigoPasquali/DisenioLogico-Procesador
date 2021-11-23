LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regs_aux IS
    PORT ( 
           regs_aux_clk : IN  std_logic;
           regs_aux_rst : IN  std_logic;
           regs_aux_we  : IN  std_logic;
           regs_aux_in  : IN  std_logic_vector (7 DOWNTO 0);
           regs_aux_out : OUT std_logic_vector (7 DOWNTO 0)
          );
END regs_aux;

ARCHITECTURE regs_aux_behavioral OF regs_aux IS
    SIGNAL s_aux : std_logic_vector (7 DOWNTO 0);

BEGIN 
  PROCESS (regs_aux_clk, regs_aux_rst)
  BEGIN
    IF (regs_aux_rst = '1') THEN
      s_aux <= (OTHERS => '0');
    ELSIF (regs_aux_clk'EVENT AND regs_aux_clk = '1' AND regs_aux_we = '1') THEN
      s_aux <= regs_aux_in;
    END IF; 
  END PROCESS; 
  
  regs_aux_out <= s_aux; 
END regs_aux_behavioral;